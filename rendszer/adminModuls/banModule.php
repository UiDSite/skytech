<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN != 951)
	die('Hozz�f�r�s megtagadva');

switch($r['modul']) {
	case 'ban_lista':
		$smarty->assign('modul', 'ban_lista');
		$smarty->assign('modulnev', 'BAN');
		$smarty->assign('data', Warn::getAllByType('ban'));
	break;

	case 'ban_uj':
		$smarty->assign('modul', 'ban_uj');
		$smarty->assign('modulnev', '�j ban l�trehoz�sa');
		
		if(!empty($p['user_id']) && is_numeric($p['user_id']))
			$searchUserId = (int)$p['user_id'];

		if(!empty($p['user_name']))
			$searchUserId = (int)User::getIdByName($p['user_name']);

		if(!empty($searchUserId))
			$smarty->assign('data', User::load($searchUserId));
	break;

	case 'ban_save':
		$data['uid'] = (int)$p['banuid'];
		$data['aid'] = $USER['uid'];
		$data['text'] = $p['text'];
		$data['lejar'] = $p['lejar'];
		$data['type'] = 'ban';
		
		logs::sysLog('ban', '�j ban', 'uid=' . $data['uid']);

		$pont = new Pont();
		$pont->addBan($data['uid']);

		Warn::add($data['uid'], $data['aid'], $data['text'], $data['lejar'], $data['type']);

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=ban_lista");
		exit;
	break;

	case 'ban_del':
		logs::sysLog('ban', 'ban t�rl�s', 'banid=' . $g['id']);
		Warn::del((int)$g['id']);
		
		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=ban_lista");
		exit;
	break;
}

?>
