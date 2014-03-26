<?php
if(!defined('SZINT1') || SZINT1 !== 666)
	die('Hozz�f�r�s megtagadva');

class Warn {
	private function __construct() {}

	function add($uid, $adminId, $text, $lejar, $type = "warn") {
		$sql = "INSERT INTO warn (uid, aid, text, datum, lejar, type) VALUES ('%d', '%d', '%s', now(), '%s', '%s')";
		db::futat($sql, $uid, $adminId, $text, $lejar, $type);

		switch($type) {
			case 'warn':
				Warn::warnUzi($uid, $text, $lejar);
			break;

			case 'ban':
				Warn::banUzi($uid, $text, $lejar);
			break;
		}
	}

	function del($wid) {
		db::futat("DELETE FROM warn WHERE wid = '%d'", $wid);
	}

	function update($wid, $tomb) {
		$mit = array();
		foreach($tomb as $key => $val) {
			$mit[] = $key . "='" . $val . "'";
		}
		if(count($mit) < 1)
			return true;

		$sql = "UPDATE warn SET " . implode(',', $mit) . " WHERE wid = '%d'";
		db::futat($sql, $uid);	
	}

	function get($uid, $type = "warn") {
		db::futat("SELECT * FROM warn WHERE uid = '%d' AND type = '%s'", $uid, $type);
		if(db::$sorok == 0)
			return true;

		$tomb = db::tomb();
		return $tomb[0];
	}

	function getId($uid, $type = "warn") {
		db::futat("SELECT wid FROM warn WHERE uid = '%d' AND type = '%s'", $uid, $type);
		if(db::$sorok == 0)
			return true;

		$tomb = db::elso_sor();
		return $tomb['wid'];
	}

	function getByUid($uid, $type = "warn") {
		db::futat("SELECT text, lejar, type FROM warn WHERE uid = '%d' AND type = '%s'", $uid, $type);
		if(db::$sorok == 0)
			return true;

		$tomb = db::tomb();
		return $tomb[0]['text'] . '<br />lej�r:' . $tomb[0]['lejar'];
	}

	function banUzi($uid, $text, $lejar) {
		$targy = OLDAL_NEVE . " kiz�r�s (ban)";
		$torzs = "Kiz�r�s oka:" . $text . "<br />\n";
		$torzs .= "A kiz�r�sod lej�r:" . $lejar;

		$u = User::load($uid);

		$headers = "From: " . OLDAL_VAKMAIL . "\r\nContent-type: text/html\r\n";
		mail($u['email'], $targy, $torzs, $headers);
	}

	function warnUzi($uid, $text, $lejar) {
		$targy = "Figyelmeztet�st(warn) kapt�l!";
		$torzs = "Figyelmeztet�s oka:" . $text . "\n\n";
		$torzs .= "Ha a figyelmeztet�sed lej�rta el�tt(" . $lejar . ") �jabb figyelmeztet�st kapsz, akkor az m�r kiz�r�ssal(ban-nal) j�r!";
		level::felad($uid, OLDAL_MAIL_USER_ID, $targy, $torzs);
	}

	function getAllByType($type) {
		$sql = "SELECT w.*,
			(SELECT u.name FROM users u WHERE u.uid = w.uid) AS user,
			(SELECT u2.name FROM users u2 WHERE u2.uid = w.aid) AS admin 
			FROM warn w WHERE w.type = '%s' ORDER BY w.wid DESC";
		return db::getAll($sql, $type);
	}
}

?>
