<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN != 951)
	die('Hozz�f�r�s megtagadva');

switch($r['modul']) {
	case 'torrent_setting':
		$smarty->assign('modulnev', 'Torrent be�ll�t�sok');
		$smarty->assign('modul', 'torrent_setting');
		$smarty->assign('kategoriak', kategoria::getForOption());
	break;

	case 'torrent_save':
		switch(true) {
			case $p['kategoria'] == 'mind':
				$where = '';
			break;

			case is_numeric($p['kategoria']):
				$where = " WHERE kid = '" . $p['kategoria'] . "'";
			break;

			default:
				$_SESSION['uzenet'] = hiba_uzi('Nem volt kiv�lasztva kateg�ria');
				header('Location:' . $_SERVER['SCRIPT_NAME']);
				exit;
			break;
		}

		switch($p['feladat']) {
			case 'ingyen_yes':
				$sql = "UPDATE torrent SET ingyen = 'yes'" . $where;
			break;

			case 'ingyen_no':
				$sql = "UPDATE torrent SET ingyen = 'no'" . $where;
			break;

			default:
				$_SESSION['uzenet'] = hiba_uzi('Nem volt kiv�lasztva feladat');
				header('Location:' . $_SERVER['SCRIPT_NAME']);
				exit;
			break;
		}

		db::futat($sql);

		$_SESSION['uzenet'] = nyugta('Sikeres m�dos�t�sok!');
		header('Location:' . $_SERVER['SCRIPT_NAME']);
		exit;
	break;
}

?>
