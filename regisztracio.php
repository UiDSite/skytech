<?php
ob_start();
define('SZINT', 666);
require_once('rendszer/mag.php');

if(!empty($p['nu_name']) || !empty($p['nu_email'])) {
	$hiba = array();
	$pname = $p['nu_name'];
	$pemail = $p['nu_email'];

	if($p['rules_read'] != 'OK' || $p['faq_read'] != 'OK' || $p['rights_read'] != 'OK')
		$hiba[0] = 'Minden dokumentumot el kell olvasni!';

	if(count($hiba) == 0) {
		if(strlen($pname) < 4 || strlen($pname) > 15)
			$hiba[1] = 'A felhaszn�l�i n�v hossza nem megfelel�(4-15 karakter k�z�ttinek kell lennie)!';
		if(strlen($pemail) < 8 || strlen($pemail) > 40)
			$hiba[2] = 'Az email c�m hossza nem megfelel�(8-40 karakter k�z�ttinek kell lennie)!';
	}

	if(count($hiba) == 0) {
		if(array_search($pname, $tiltott_nev) !== false)
			$hiba[20 ] ='A kiv�lsztott n�v titl� list�n van';
		if(!ervenyes_nev($pname))
			$hiba[20] = 'A kiv�lasztott n�v �rv�nytelen karaktereket tartalmaz! A neved csak az angol abc bet�it, �s sz�mokat tartalmazhat!';
		db::futat("SELECT uid FROM users WHERE name = '%s'", $pname);
		if(db::$sorok !== 0)
			$hiba[20] = 'Sajn�lom, de m�r valaki haszn�lja az �ltalad v�lasztott nevet!';
	}

	if(count($hiba) == 0) {
		if(array_search($pemail, $tiltott_email) !== false)
			$hiba[30] = 'A kiv�lsztott email c�m titl� list�n van';
		if(!ervenyes_email($pemail))
			$hiba[30] = 'A megadott e-mail c�m �rv�nytelen. Csak �gy tudsz regisztr�lni, ha egy �rv�nyes, m�k�d� e-mail c�met adsz meg!';
		db::futat("SELECT uid FROM users WHERE email = '%s'", $pemail);
		if(db::$sorok !== 0)
			$hiba[30] = 'Sajn�lom, de m�r valaki haszn�lja az �ltalad v�lasztott email c�met!';
	}

	if(count($hiba) != 0) {
		$tomb['name'] = $pname;
		$tomb['email'] = $pemail;
		if(!empty($_SESSION['marad']) && $_SESSION['marad'] === true)
			$tomb['marad'] = true;

		$smarty->assign('hiba', $hiba);
		$smarty->assign('form_value', $tomb);
		$smarty->display('regisztracio.tpl');
	} else {
		$vadat = veletlen_adat($pname);
		db::futat("INSERT INTO users (pass, tor_pass, name, email, statusz, reg_date) VALUES ('%s', '%s', '%s', '%s', 'uj', '%d')", $vadat['passhash'], $vadat['passkey'], $pname, $pemail, time());
		$uid = db::$id;
		$ellenor = veletlen_ellenor();

		db::futat("INSERT INTO regisztral (uid, date, type, tema, ellenor) VALUES ('%d', '%d', 'reg', '', '%s')", $uid, time(), md5($ellenor));

		require_once(CLASS_DIR . 'mailer.class.php');
		if(sendEmail($pemail, $pname, OLDAL_NEVE . ' - regisztr�ci� meger�s�t�se', reg_mail(array('name' => $pname, 'pass' => $vadat['password'], 'ellenor' => $ellenor))))
			$mailUzi = uzi('Sikeres regisztr�ci�', 'Gratul�lunk, sikeresen regisztr�ltad magad. Hamarosan egy meger�s�t� e-mail �rkezik az e-mail c�medre (<span class="highlight">' . $pemail . '</span>). A meger�s�t�s ut�n bejelentkezhetsz. Amenniyben nem kapn�d meg a mailt, k�rlek jelezd a staff@sky-tech.hu c�men!');
		else
			$mailUzi = hiba_uzi('Sikertelen regisztr�ci�!<br />K�rlek jelezd a staff@sky-tech.hu-n');

		if(!empty($_SESSION['meghivo']) && is_numeric($_SESSION['meghivo'])) {
			db::futat("UPDATE meghivo SET meghivott = '%d' WHERE mid = '%d'", $uid, $_SESSION['meghivo']);
			unset($_SESSION['meghivo']);
			unset($_SESSION['marad']);
		}

		$smarty->assign('uzi', $mailUzi);
		$smarty->display('regisztracio.tpl');
	}	
} elseif(!empty($p['new_pass_email'])) {
	db::futat("SELECT uid, name FROM users WHERE email = '%s'", $p['new_pass_email']);
	if(db::$sorok != 1) {
		$smarty->assign('uzi', uzi('Hiba!', 'A megadott e-mail c�m nincs regisztr�lva'));
	} else {
		$tomb = db::tomb();
		$ellenor = veletlen_ellenor();
		$pari = "INSERT INTO regisztral (uid, date, type, ellenor) VALUES ('%d', '%d', 'emlekeszteto', '%s')";
		db::futat($pari, $tomb[0]['uid'], time(), md5($ellenor));

		require_once(CLASS_DIR . 'mailer.class.php');
		sendEmail($p['new_pass_email'], $p['new_pass_email'], OLDAL_NEVE . ' - elfelejtett jelsz�', elfelejtet_jelszo_mail(array('name' => $USER['name'], 'ellenor' => $ellenor)));
		$smarty->assign('uzi', uzi('Sikeres jelsz� eml�kesztet�', 'Hamarosan egy meger�s�t� e-mail �rkezik az e-mail c�medre (<span class="highlight">' . $p['new_pass_email'] . '</span>). A meger�s�t�s ut�n megkapod az �j v�letlen jelszavadat.'));
	}
} elseif(!empty($g['mod'])) {
	$gmod = as_md5($g['mod']);
	$hiba = 0;

	if($hiba == 0) {
		db::futat("SELECT r.type, r.date, r.tema, r.rid, r.uid, u.name FROM regisztral r LEFT JOIN users u ON r.uid = u.uid WHERE ellenor = '%s'", md5($gmod));
		if(db::$sorok != 1) {
			$smarty->assign('uzi', uzi('Hiba!', 'Nem l�tezik k�r�s az adott ellen�rz� �sszeggel!'));
			$hiba++;
		}
	}

	if($hiba == 0) {
		$tomb = db::tomb();
		$tomb = $tomb[0];
		if((time() - $tomb['date']) > (60 * 60 * 24 * 3)) {
			db::futat("DELETE FROM regisztral WHERE rid = '%s'", $tomb['rid']);
			$smarty->assign('uzi', uzi('Hiba!', 'A k�r�s h�rom napn�l r�gebbi, m�r nem haszn�lhat� fel!'));
			$hiba++;
		}
	}

	if($hiba == 0) {
		if($tomb['type'] == 'reg') {
			db::futat("UPDATE users SET statusz='aktiv' WHERE `uid` = '%d'", $tomb['uid']);
			$smarty->assign('uzi', uzi('Sikeres meger�s�t�s!', 'Felhaszn�l�i fi�kodat sikeresen meger�s�tett�k!'));

			db::futat("SELECT uid FROM user_data WHERE uid = '%d'", $tomb['uid']);
			if(db::$sorok != 1)
				db::futat("INSERT INTO user_data (uid) VALUES ('%d')", $tomb['uid']);
		} elseif($tomb['type'] == 'new_pass') {
			db::futat("UPDATE users SET pass = '%s' WHERE uid = '%d'", md5($tomb['name'] . $tomb['tema']), $tomb['uid']);
			$smarty->assign('uzi', uzi('Sikeres meger�s�t�s!', 'Jelszavadat sikeresen m�dos�tottuk!'));
		} elseif($tomb['type'] == 'meghivo') {
			$sql = "SELECT email, mid FROM meghivo WHERE mid = (SELECT tema FROM regisztral WHERE rid = '%d')";
			db::futat($sql, $tomb['rid']);
			$tomb = db::tomb();
			$smarty->assign('form_value', array('email' => $tomb[0]['email'], 'marad' => true));
			$_SESSION['meghivo'] = $tomb[0]['mid'];
			$_SESSION['marad'] = true;
		} elseif($tomb['type'] == 'emlekez') {
			db::futat("UPDATE users SET pass = '%s' WHERE uid = '%d'", md5($tomb['name'] . $tomb['tema']), $tomb['uid']);
			$smarty->assign('uzi', uzi('Sikeres meger�s�t�s!', 'Jelszavadat sikeresen m�dos�tottuk!'));
		}

		db::futat("DELETE FROM regisztral WHERE rid = '%s'", $tomb['rid']);
	}

	$smarty->display('regisztracio.tpl');
} else {
	db::futat("SELECT COUNT(*) AS db FROM users WHERE statusz != 'delete'");
	if(db::egy_ertek('db') > MAX_USER)
		$smarty->assign('uzi', 'Regisztr�ci� lez�rva, csak megh�v�val lehet beker�lni!');

	$smarty->display('regisztracio.tpl');
}

ob_end_flush();

?>
