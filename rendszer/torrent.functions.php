<?php
function benc($obj) {
	if (!is_array($obj) || !isset($obj["type"]) || !isset($obj["value"]))
		return;
	$c = $obj["value"];
	switch ($obj["type"]) {
		case "string":
			return benc_str($c);
		case "integer":
			return benc_int($c);
		case "list":
			return benc_list($c);
		case "dictionary":
			return benc_dict($c);
		default:
			return;
	}
}

function benc_str($s) {
	return strlen($s) . ":$s";
}

function benc_int($i) {
	return "i" . $i . "e";
}

function benc_list($a) {
	$s = "l";
	foreach ($a as $e) {
		$s .= benc($e);
	}
	$s .= "e";
	return $s;
}

function benc_dict($d) {
	$s = "d";
	$keys = array_keys($d);
	sort($keys);
	foreach ($keys as $k) {
		$v = $d[$k];
		$s .= benc_str($k);
		$s .= benc($v);
	}
	$s .= "e";
	return $s;
}

function bdec_file($f, $ms) {
	//privHack($f,$ms);
	$fp = fopen($f, "rb");
	if (!$fp)
		return;
	$e = fread($fp, $ms);
	fclose($fp);
	return bdec($e);
}

function bdec($s) {
	if (preg_match('/^(\d+):/', $s, $m)) {
		$l = $m[1];
		$pl = strlen($l) + 1;
		$v = substr($s, $pl, $l);
		$ss = substr($s, 0, $pl + $l);
		if (strlen($v) != $l)
			return;
		return array('type' => "string", 'value' => $v, 'strlen' => strlen($ss), 'string' => $ss);
	}
	if (preg_match('/^i(\d+)e/', $s, $m)) {
		$v = $m[1];
		$ss = "i" . $v . "e";
		if ($v === "-0")
			return;
		if ($v[0] == "0" && strlen($v) != 1)
			return;
		return array('type' => "integer", 'value' => $v, 'strlen' => strlen($ss), 'string' => $ss);
	}
	switch ($s[0]) {
		case "l":
			return bdec_list($s);
		case "d":
			return bdec_dict($s);
		default:
			return;
	}
}

function bdec_list($s) {
	if ($s[0] != "l")
		return;
	$sl = strlen($s);
	$i = 1;
	$v = array();
	$ss = "l";
	for (;;) {
		if ($i >= $sl)
			return;
		if ($s[$i] == "e")
			break;
		$ret = bdec(substr($s, $i));
		if (!isset($ret) || !is_array($ret))
			return;
		$v[] = $ret;
		$i += $ret["strlen"];
		$ss .= $ret["string"];
	}
	$ss .= "e";
	return array('type' => "list", 'value' => $v, 'strlen' => strlen($ss), 'string' => $ss);
}

function bdec_dict($s) {
	if ($s[0] != "d")
		return;
	$sl = strlen($s);
	$i = 1;
	$v = array();
	$ss = "d";
	for (;;) {
		if ($i >= $sl)
			return;
		if ($s[$i] == "e")
			break;
		$ret = bdec(substr($s, $i));
		if (!isset($ret) || !is_array($ret) || $ret["type"] != "string")
			return;
		$k = $ret["value"];
		$i += $ret["strlen"];
		$ss .= $ret["string"];
		if ($i >= $sl)
			return;
		$ret = bdec(substr($s, $i));
		if (!isset($ret) || !is_array($ret))
			return;
		$v[$k] = $ret;
		$i += $ret["strlen"];
		$ss .= $ret["string"];
	}
	$ss .= "e";
	return array('type' => "dictionary", 'value' => $v, 'strlen' => strlen($ss), 'string' => $ss);
}

function dict_check($d, $s) {
	if ($d["type"] != "dictionary")
		die("not a dictionary");
	$a = explode(":", $s);
	$dd = $d["value"];
	$ret = array();
	foreach ($a as $k) {
		unset($t);
		if (preg_match('/^(.*)\((.*)\)$/', $k, $m)) {
			$k = $m[1];
			$t = $m[2];
		}
		if (!isset($dd[$k]))
			die("Semmiylen tracker c?met nem adt?l meg a torrent f?jlban!!");
		if (isset($t)) {
			if ($dd[$k]["type"] != $t)
				die("invalid entry in dictionary");
			$ret[] = $dd[$k]["value"];
		}
		else
			$ret[] = $dd[$k];
	}
	return $ret;
}

function dict_get($d, $k, $t) {
	if ($d["type"] != "dictionary")
		die("not a dictionary");
	$dd = $d["value"];
	if (!isset($dd[$k]))
		return;
	$v = $dd[$k];
	if ($v["type"] != $t)
		die("invalid dictionary entry type");
	return $v["value"];
}

function searchfield($s) {
    return preg_replace(array('/[^a-z0-9]/si', '/^\s*/s', '/\s*$/s', '/\s+/s'), array(" ", "", "", " "), $s);
}

function err($msg){
	benc_resp(array('failure reason' => array(type => 'string', value => $msg)));
	db::hardClose();
	d::addText('err-msg',$msg);
	d::addText('_GET',$_GET);
	d::addText('_server',$_SERVER);	
	d::send(MAIL_DEBUG);
	exit();
}

function benc_resp($d){
	benc_resp_raw(benc(array(type => 'dictionary', value => $d)));
}

function benc_resp_raw($x) {
	header("Content-Type: text/plain");
	header("Pragma: no-cache");
	if ($_SERVER["HTTP_ACCEPT_ENCODING"] == "gzip") {
		header("Content-Encoding: gzip");
		echo gzencode($x, 9, FORCE_GZIP);
	} else
		echo $x;
}

function validip($ip){
	if (!empty($ip) && $ip == long2ip(ip2long($ip))){
				$reserved_ips = array (
				array('0.0.0.0','2.255.255.255'),
				array('10.0.0.0','10.255.255.255'),
				array('127.0.0.0','127.255.255.255'),
				array('169.254.0.0','169.254.255.255'),
				array('172.16.0.0','172.31.255.255'),
				array('192.0.2.0','192.0.2.255'),
				array('192.168.0.0','192.168.255.255'),
				array('255.255.255.0','255.255.255.255')
		);
		foreach ($reserved_ips as $r){
				$min = ip2long($r[0]);
				$max = ip2long($r[1]);
				if ((ip2long($ip) >= $min) && (ip2long($ip) <= $max)) return false;
		}
		return true;
	}
	else return false;
}

function getip() {
   if (isset($_SERVER)) {
     if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && validip($_SERVER['HTTP_X_FORWARDED_FOR'])) {
       $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
     } elseif (isset($_SERVER['HTTP_CLIENT_IP']) && validip($_SERVER['HTTP_CLIENT_IP'])) {
       $ip = $_SERVER['HTTP_CLIENT_IP'];
     } else {
       $ip = $_SERVER['REMOTE_ADDR'];
     }
   } else {
     if (getenv('HTTP_X_FORWARDED_FOR') && validip(getenv('HTTP_X_FORWARDED_FOR'))) {
       $ip = getenv('HTTP_X_FORWARDED_FOR');
     } elseif (getenv('HTTP_CLIENT_IP') && validip(getenv('HTTP_CLIENT_IP'))) {
       $ip = getenv('HTTP_CLIENT_IP');
     } else {
       $ip = getenv('REMOTE_ADDR');
     }
   }
   return $ip;
 }

function hash_where($name, $hash) {
    $shhash = preg_replace('/ *$/s', "", $hash);
    return "($name = " . sqlesc($hash) . " OR $name = " . sqlesc($shhash) . ")";
}

function my_hash($val){
	$mod=preg_replace('/ *$/s', "", $val);
	return $mod;
}

function hash_pad($hash) {
    return str_pad($hash, 20);
}

function getoutofmysite($client){
	$array = Array("BS", "\0\2BS", "\0\3BS", "exbc\0L", "exbcL", "exbcLORD", "-TS", "Mbrst", "-BB", "-SZ", "XBT", "turbo", "A301", "A310", "-UT11", "-UT12", "-UT13", "-UT14", "-UT15", "FUTB", "exbc\08", "exbc\09", "exbc\0:", "-BC0059-", "-BC0060-", "-BC0061-", "-BC0062-", "-BC0063-", "-BC0064-", "-BC0065-", "-BC0066-", "-BC0067-", "-BC0068-", "-BC0069-", "-BC0070-");
	foreach($array as $bannedclient){
		if($bannedclient == substr($client,0,strlen($bannedclient))){
			header("Content-Type: text/plain");
			header("Pragma: no-cache");
			echo 'Client is banned. Please use uTorrent 1.6 or Azureus 2.4!';
			die();
		}	
	}       
}

function portblacklisted($port){
	if ($port >= 411 && $port <= 413) return true;
	if ($port >= 6881 && $port <= 6889) return true;
	if ($port == 1214) return true;
	if ($port >= 6346 && $port <= 6347) return true;
	if ($port == 4662) return true;
	if ($port == 6699) return true;
	return false;
}

function sqlesc($value) {
    // Stripslashes
   if (get_magic_quotes_gpc()) {
       $value = stripslashes($value);
	}
	// Quote if not a number or a numeric string
   if (!is_numeric($value)) {
       $value = "'" . mysql_real_escape_string($value) . "'";
   }
   return $value;
}

function numericDecode($str){
	$len=strlen($str);
	for($i=0;$i<$len;$i++){
		$tomb[]= ord($str{$i});
	}
	$decode=implode(';',$tomb);
	return $decode;
}

function numericEncode($code){
	$tomb=explode(';',$code);
	$str='';
	foreach($tomb as $elem){
		$str.=chr($elem);
	}
	return $str;
}

function rstrpos ($haystack, $needle){
	$size = strlen ($haystack);
	$pos = strpos (strrev($haystack), strrev($needle) );
	if ($pos === false)
		return false;
	return $size - $pos;
}

//private hack, b?r nincs r? sz?ks?g
define('PRIVATE_STRING','privatei1');
function privHack($f,$ms){
	//adatkinyer?s
	$file=fopen($f, "rb");	
	if (!$file) return false;
	$data=fread($file,$ms);
	fclose($file);
	unset($file);
	//adatm?dos?t?s

	// ee csonkit?s
	if(substr($data, -2, 2) == 'ee')
		$data = substr($data, 0, (strlen($data)-2));

	//private kiszures
	$private = rstrpos($data, 'privatei1');
	if($private !== false)
		$data = substr($data, 0, ($private - strlen('privatei1')));

	$data.='7:privatei1e6:source10:newskytechee';
	
	//file vissza?ras
	$file=fopen($f, "wb");	
	if (!$file) return false;
	fwrite($file, $data);
	fclose($file);
	unset($file);
	
	
	$dict = bdec_file($f, $ms );
	$data=benc($dict);
	
	$file=fopen($f, "wb");	
	if (!$file) return false;
	fwrite($file, $data);
	fclose($file);
	unset($file);
	
	return true;
}

function b_to_gb($size) {
return ($size / 1024 / 1024 / 1024);
}

function hnr_calc($r, $s, $t, $n = 172800) {
return ((1 - $r) * ($n + 0.4 * b_to_gb($s)) - $t);
}



?>