<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN != 951)
	die('Hozz�f�r�s megtagadva');

switch($r['modul']) {
	case 'level_uj':
		$smarty->assign('modul', 'level_uj');
		$smarty->assign('modulnev', '�j h�r l�trehoz�sa');
		$smarty->assign('data', array('datum' => date('Y-m-d H:i:s')));
	break;

	case 'level_send':
		$targy = $p['tema'];
		$torzs = $p['text'];
		$where = " AND rang IN(" . implode(',', $p['kinek'] ) . ")";

		level::korlevel($targy, $torzs, $where);
		logs::sysLog('korlevel', '�j k�rlev�l', 'kiknek = ' . implode(',', $p['kinek']));

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=level_uj");
		exit;
	break;
}

?>
