<?php
ob_start();
define('SZINT', 666);
require_once('rendszer/mag.php');
$belep = new belep();
$old = new old();


if(!empty($g['torol']) && is_numeric($g['torol'])) {
	db::futat("SELECT uid FROM meghivo WHERE mid = '%d'", $g['torol']);
	if(db::egy_ertek('uid') == $USER['uid']) {
		db::futat("DELETE FROM meghivo WHERE mid = '%d'", $g['torol']);
		db::futat("DELETE FROM regisztral WHERE tema = '%d'", $g['torol']);
		$uzi = nyugta('A megh�v�t t�r�lt�k');
	} else {
		$uzi = hiba_uzi('A megh�v� nem a Ti�d, nem t�r�lt�k!');
	}

	$_SESSION['uzenet'] = $uzi;
	header('Location: meghivo.php');
	exit;
}

$kuldhet = false;

$sql = "SELECT UNIX_TIMESTAMP(datum) AS num FROM meghivo WHERE uid = '%d' ORDER BY mid DESC LIMIT 1";
db::futat($sql, $USER['uid']);
$mikor = db::egy_ertek('num');

if(!empty($mikor)) {
	db::futat("SELECT feltolt AS num FROM meghivo WHERE uid = '%d' ORDER BY mid DESC LIMIT 1", $USER['uid']);
	$up_mentes = db::egy_ertek('num');		

	if(($mikor + MEGHIVO_IDO_LIMIT) < time()) {
		$azota_feltoltot = USER::feltoltKulonbseg($USER['uid'], $up_mentes);
		if($azota_feltoltot > MEGHIVO_UPLOAD_LIMIT)
			$kuldhet = true;
		else
			$kuldhet = false;
	} else {
		$kuldhet = false;
	}

	$smarty->assign('s_datum', date('Y.m.d H:i:s', $mikor));
	$smarty->assign('s_up', $azota_feltoltot);

	db::futat("SELECT * FROM meghivo WHERE uid = '%d' ORDER BY mid DESC", $USER['uid']);
	$tomb = db::tomb();

	$kesz = array();
	foreach($tomb as $key => $val) {
		$kesz[$key]['datum'] = $val['datum'];
		$kesz[$key]['email'] = $val['email'];
		if(!empty($val['meghivott'])) {
			$ki = User::load($val['meghivott']);
			$link = "<a href='userinfo.php?uid=" . $ki['uid'] . "'>" . $ki['name'] . "</a>";
		} else {
			$link = "<a href='meghivo.php?torol=" . $val['mid'] . "' title='Megh�v� t�rl�se'>Megh�v� t�rl�se</a>";
		}

		$kesz[$key]['link'] = $link;
	}
	$smarty->assign('meghivott', $kesz);
} else {
	if(USER::feltoltKulonbseg($USER['uid']) > MEGHIVO_UPLOAD_LIMIT)
		$kuldhet = true;
	else
		$kuldhet = false;

	$smarty->assign('s_datum', $USER['reg_date']);
	$smarty->assign('s_up', $USER['feltolt']);
}

if($USER['rang'] > 8) {
	$kuldhet = true;
	$smarty->assign('adminpanel', true);
}

/** HACK **/
$kuldhet = true;
$smarty->assign('kuldhet', $kuldhet);

if(!empty($p['meghivo'])) {
	if($kuldhet !== true) {
		$OLDAL[] = hiba_uzi('Nem k�ldhetsz megh�v�t!!!!!');
	} else {
		switch(true) {
			case strlen($p['meghivo']) < 8 || strlen($p['meghivo']) > 40:
				$OLDAL[] = hiba_uzi('Az email c�m hossza nem megfelel�(8-40 karakter k�z�ttinek kell lennie)!');
				$formatum = false;
			break;

			case array_search($p['meghivo'], $tiltott_email) !== false:
				$OLDAL[] = hiba_uzi('Az email c�m tilt�list�n van!');
				$formatum = false;
			break;

			case !ervenyes_email($p['meghivo']):
				$OLDAL[] = hiba_uzi('A megadott email c�m �rv�nytelen!!');
				$formatum = false;
			break;

			default:
				$formatum = true;
			break;
		}

		if($formatum === true) {
			db::futat("SELECT uid FROM users WHERE email = '%s'", $p['meghivo']);
			if(db::$sorok !== 0) {
				$OLDAL[] = hiba_uzi('Sajn�lom, de m�r valaki haszn�lja az �ltalad megadott email c�met!');
				$formatum = false;
			}
		}

		if($formatum === true) {
			$sql = "INSERT INTO meghivo (uid, feltolt, email, datum) VALUES (%d, %f, '%s', NOW())";
			db::futat($sql, $USER['uid'], $USER['feltolt'], $p['meghivo']);

			$ellenor = veletlen_ellenor();
			$sql = "INSERT INTO regisztral (uid, date, type, tema, ellenor) VALUES ('%d', '%d', 'meghivo', '%d', '%s')";
			db::futat($sql, $USER['uid'], time(), db::$id, md5($ellenor));

			$mailAdat=array('mail' => $p['meghivo'], 'nev' => $USER['name'], 'ellenor' => $ellenor);

			require_once( CLASS_DIR . 'mailer.class.php');

			if(sendEmail($p['meghivo'], $p['meghivo'], OLDAL_NEVE . ' - Megh�v�', meghivo_mail($mailAdat)) == true)
				$_SESSION['uzenet'] = nyugta('A megh�v�t kik�ldt�k!');
			else
				$_SESSION['uzenet'] = hiba_uzi('Kik�ld�si hiba! K�rlek jelezd a staffnak!');

			header('Location: meghivo.php');
			exit;
		}
	}
}

db::futat("SELECT cim, text, cid FROM cikk WHERE cid = '32'");
$segedlet = array();
foreach(db::elso_sor() as $key => $val) {
	$segedlet[$key] = ($key == 'text') ? bb::bbdecode($val) : $val;
}

$smarty->assign('meghivotext', $segedlet);
$smarty->assign('OLDAL', $OLDAL);
$smarty->display('meghivo.tpl');
ob_end_flush();

?>
