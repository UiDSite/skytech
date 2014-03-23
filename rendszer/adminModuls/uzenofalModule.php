<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN != 951)
	die('Hozz�f�r�s megtagadva');

switch($r['modul']) {
	case 'uzenofal':
		$data = array();
		db::futat("SELECT cim, text, cid, mod_user, mod_date FROM cikk WHERE mihez = 'uzifal' ORDER BY mod_date DESC ");

		foreach(db::tomb() as $i => $row) {
			foreach($row as $key => $val) {
				$data[$i][$key] = ($key == 'text') ? bb::bbdecode($val) : $val;
			}
			$data[$i]['mod_user_name'] = User::getNameById($row['mod_user']);
		}

		$smarty->assign('modul','uzenofal');
		$smarty->assign('modulnev','�zen�fal');
		$smarty->assign('data',$data);
	break;

	case 'uzenofal_uj':
		$smarty->assign('modul', 'uzenofal_uj');
		$smarty->assign('modulnev', '�j bejegyz�s l�trehoz�sa');
	break;

	case 'uzenofal_mod':
		$doc = new Doc();
		$modId = (int)$g['id'];

		$smarty->assign('modul','uzenofal_uj');
		$smarty->assign('modulnev','Bejegyz�s szereszt�se');
		$smarty->assign('data', $doc->getById($modId));
	break;

	case 'uzenofal_save':
		$doc = new Doc();
		$modId = (int)$p['id'];
		$data['cim'] = $p['cim'];
		$data['text'] = $p['text'];
		$data['mihez'] = 'uzifal';
		$data['mod_user'] = $USER['uid'];
		$data['mod_date'] = date('Y-m-d H:i:s');

		if(!empty($modId)) {
			logs::sysLog('uzenofal', 'uzenofal modositas', 'docId=' . $modId);
			$doc->update(array('cid' => $modId), $data);
		} else {
			logs::sysLog('uzenofal', '�j uzenofal', 'cim=' . $p['cim']);
			$doc->add($data);
		}

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=uzenofal");
		exit;
	break;

	case 'uzenofal_del':
		$doc = new Doc();
		$modId = (int)$g['id'];

		logs::sysLog('uzenofal', 'uzenofal t�rl�s', 'docId=' . $modId);
		$doc->del(array('cid' => $modId));

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=uzenofal");
		exit;
	break;
}

?>
