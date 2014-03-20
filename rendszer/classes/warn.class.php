<?php
if(!defined('SZINT1') || SZINT1!==666 ) die('Hozz�f�r�s megtagadva'); //oszt�ly biztons�g

class Warn{
  
	private function  __construct(){}


	function add($uid,$adminId,$text,$lejar,$type="warn"){
		$sql="insert into warn(uid,aid,text,datum,lejar,type) values('%d','%d','%s',now(),'%s','%s')";
		db::futat($sql,$uid,$adminId,$text,$lejar,$type);
		
		switch($type){
			case 'warn':
				Warn::warnUzi($uid,$text,$lejar);
			break;
			case 'ban':
				Warn::banUzi($uid,$text,$lejar);
			break;
		}
	}

	function del($wid){
		db::futat("delete from warn where wid='%d'",$wid);
	}

	function update($wid,$tomb){
		$mit=array();
		foreach($tomb as $key=>$val){
			$mit[]=$key."='".$val."'";
		}
		if(count($mit)<1) return true;
	
		$sql="update warn set ".implode(',',$mit)." where wid='%d'";
		db::futat($sql,$uid);	
	}

		
	function get($uid,$type="warn"){
		db::futat("select * from warn where uid='%d' and type='%s'",$uid,$type);
		if(db::$sorok==0){
			return true;
		}
		$tomb=db::tomb();
		return $tomb[0];
	}
	
	function getId($uid,$type="warn"){
		db::futat("select wid from warn where uid='%d' and type='%s'",$uid,$type);
		if(db::$sorok==0){
			return true;
		}
		$tomb=db::elso_sor();
		return $tomb['wid'];
	}

	function getByUid($uid,$type="warn"){
		db::futat("select text,lejar,type from warn where uid='%d' and type='%s'",$uid,$type);
		if(db::$sorok==0){
			return true;
		}
		$tomb=db::tomb();
		return $tomb[0]['text'].'<br />lej�r:'.$tomb[0]['lejar'];
	}
	
	function banUzi($uid,$text,$lejar){
		$targy=OLDAL_NEVE." kiz�r�s (ban)";
		$torzs ="Kiz�r�s oka:".$text."<br />\n";
		$torzs.="A kiz�r�sod lej�r:".$lejar;
		
		$u=User::load($uid);
		
		$headers  = "From: ".OLDAL_VAKMAIL."\r\nContent-type: text/html\r\n";
		mail($u['email'], $targy, $torzs, $headers);
		
	}
	
	function warnUzi($uid,$text,$lejar){
					
		$targy="Figyelmeztet�st(warn) kapt�l!";
		$torzs ="Figyelmeztet�s oka:".$text."\n\n";
		$torzs.="Ha a figyelmeztet�sed lej�rta el�tt(".$lejar.") �jabb figyelmeztet�st kapsz, akkor az m�r kiz�r�ssal(ban-nal) j�r!";				
		level::felad($uid,OLDAL_MAIL_USER_ID,$targy,$torzs);		
	}
	
	function getAllByType( $type ){
		$sql="select w.*,
			(select u.name from users u where u.uid=w.uid) as user,
			(select u2.name from users u2 where u2.uid=w.aid) as admin 
			from warn w where w.type='%s' order by w.wid desc";
		return db::getAll($sql , $type );			
	}

}

?>