<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN != 951)
	die('Hozz�f�r�s megtagadva');

switch($r['modul']) {
	case 'flush_cache':
		Cache::clearAll();

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME']);
		exit;
	break;
}

?>
