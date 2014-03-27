<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN != 951)
	die('Hozz�f�r�s megtagadva');

switch($r['modul']) {
	case 'szavazas_lista':
		$szav = new Szavazas();

		$smarty->assign('modul', 'szavazas_lista');
		$smarty->assign('modulnev', 'Szavaz�sok');
		$smarty->assign('szavazasok', $szav->getAll());
	break;

	case 'szavazas_uj':
		$form[] = array("olv" => "K�rd�s", "id" => "kerdes");
		for($i = 1; $i < 11; $i++) {
			$form[] = array("olv" => "V�lasz " . $i, "id" => "valasz[" . $i . "]");
		}

		$smarty->assign('modul', 'szavazas_uj');
		$smarty->assign('modulnev', '�j szavaz�s l�trehoz�sa');
		$smarty->assign('data', $form);
	break;

	case 'szavazas_mod':
		//szavazas c�me
		db::futat("SELECT cim FROM szavazas WHERE szid = '%d'", $g['id']);
		$cim = db::tomb();
		$form[] = array("olv" => "K�rd�s", "id" => "kerdes", "val" => $cim[0]['cim']);

		//mez�k �s neveik
		db::futat("SELECT sze_id, text FROM szavazas_elem WHERE szid = '%d' ORDER BY szid", $g['id']);
		$tomb = db::tomb();

		//a megl�v� elemek felt�lt�se
		foreach($tomb as $i => $elem){
			$form[] = array("olv" => "V�lasz " . ($i + 1), "id" => "regi[" . $elem['sze_id'] . "]", "val" => $elem['text']);
		}

		//plusz mez�k 
		for($i = count($tomb) + 1; $i < 11; $i++) {
			$form[] = array("olv" => "V�lasz " . $i,"id" => "valasz[" . $i . "]");
		}	

		$smarty->assign('modul', 'szavazas_uj');
		$smarty->assign('modulnev', 'Szavaz�s szereszt�se');
		$smarty->assign('form', $form);
		$smarty->assign('modId', $g['id']);
	break;

	case 'szavazas_save':
		if(!empty($_POST['id']) && is_numeric($_POST['id'])) {
			db::futat("UPDATE szavazas SET cim = '%s' WHERE szid = '%d'", $p['kerdes'], $p['id']);

			//a r�gi mez�k bej�r�sa
			foreach($p['regi'] as $key => $val) {
				if(!empty($val))
					db::futat("UPDATE szavazas_elem SET text = '%s' WHERE sze_id = '%d'", $val, $key);
				else {
					db::futat("DELETE FROM szavazas_elem WHERE sze_id = '%d'", $key);
					db::futat("DELETE FROM szavazatok WHERE sze_id = '%d'", $key);
				}
			}

			// az �j mez�k r�gz�t�se ha van tartalmuk
			foreach($p['valasz'] as $v) {
				if(!empty($v))
					db::futat("INSERT INTO szavazas_elem (szid, text) VALUES ('%d', '%s')", $p['id'], $v);
			}

			logs::sysLog('szavazas', 'szavaz�s szerkeszt�se', 'szid=' . $p['id']);
		} else {
			db::futat("INSERT INTO szavazas (cim, datum) VALUES ('%s', now())", $p['kerdes']);
			$szavaz_id = db::$id;
			foreach($p['valasz'] as $v) {
				if(!empty($v))
					db::futat("INSERT INTO szavazas_elem (szid, text) VALUES ('%d', '%s')", $szavaz_id, $v);
			}

			logs::sysLog('szavazas', 'szavaz�s l�trehoz�sa', 'szid=' . $szavaz_id);
		}

		db::futat("SELECT szid FROM szavazas ORDER BY szid DESC LIMIT 0,1");
		$tomb = db::tomb();
		Cache::set(CACHE_AKTIV_SZAVAZAS, $tomb[0]['szid']);

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=szavazas_lista");
		exit;
	break;

	case 'szavazas_del':
		db::futat("DELETE FROM szavazas WHERE szid = '%d'", $g['id']);
		db::futat("DELETE FROM szavazas_elem WHERE szid = '%d'", $g['id']);
		db::futat("DELETE FROM szavazatok WHERE szid = '%d'", $g['id']);

		logs::sysLog('szavazas', 'szavaz�s t�rl�se', 'szid=' . $g['id']);

		db::futat("SELECT szid FROM szavazas ORDER BY szid DESC LIMIT 0,1");
		$tomb = db::tomb();
		Cache::set(CACHE_AKTIV_SZAVAZAS, $tomb[0]['szid']);

		$_SESSION['uzenet'] = nyugta('A m�velet sikeres');
		header("Location:" . $_SERVER['SCRIPT_NAME'] . "?modul=szavazas_lista");
		exit;
	break;
}

?>
