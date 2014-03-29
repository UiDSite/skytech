<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep = new belep();
$old = new old();
$kerek = new Kerek();


if(!empty($g['modul']) && !empty($g['kid']) && is_numeric($g['kid'])) {
	switch($g['modul']) {
		case 'keres_del':
			if($kerek->isModified((int)$g['kid']) == true)
				$kerek->del("kid = '" . $g['kid'] . "'");
		break;

		case 'keres_csat':
			$pont = (int)$g['pont'];
			if($pont < 1)
				die('Egy Sky-Pontn�l kevesebbel nem lehet csatlakozni egy k�r�shez!');
			if($kerek->pontCheck($pont) != true)
				die('Nincs elegend� Sky-Pontod!');
			$kerek->addItem($g['kid'], $pont);
			die('Csatlakozt�l a k�r�shez ' . $pont . ' Sky-Ponttal');
		break;

		default:
			die('Modulhiba');
		break;
	}
}

if(!empty($p['name']) && !empty($p['kat']) && is_numeric($p['kat'])) {
	$insert['uid'] = (int)$USER['uid'];
	$insert['kat_id'] = (int)$p['kat'];
	$insert['name'] = $p['name'];
	$insert['text'] = $p['text'];
	$insert['datum'] = date('Y-m-d H:i:s');

	if(!empty($p['modId']) && is_numeric($p['modId'])) {
		if($kerek->isModified((int)$p['modId'])) {
			unset($insert['uid'], $insert['datum']);
			$insert['mod_datum'] = date('Y-m-d H:i:s');
			$insert['mod_uid'] = (int)$USER['uid'];
			$kerek->update('kid = ' . (int)$p['modId'], $insert);
			$_SESSION['uzenet'] = nyugta('Sikeres m�dos�t�s');
		} else {
			$_SESSION['uzenet'] = hiba_uzi('M�s k�r�s�t nem szerkeztheted!');
		}
	} else {
		if($kerek->pontCheck() == true && $kerek->pontLevon() == true) {
			$kerek->add($insert);
			$_SESSION['uzenet'] = nyugta('Sikeres bek�ld�s');
		}  else {
			$_SESSION['uzenet'] = hiba_uzi('Nincs elegendo Sky-Pontod!');
		}
	}

	header('Location:' . $_SERVER['SCRIPT_NAME']);
	exit;
} elseif(!empty($g['modosit']) && is_numeric($g['modosit'])) {
	$data = $kerek->getById((int)$g['modosit']);
	$smarty->assign('data', $data);
	$smarty->assign('cim', 'K�r�s szerkeszt�se');
} else {
	$smarty->assign('cim', '�j k�r�s');
}

$smarty->assign('kats', kategoria::getAll('kid, nev'));
$smarty->assign('OLDAL', $OLDAL);
$smarty->display('kerek.tpl');
ob_end_flush();

?>
