<?php
class old {
	private $hol = "_top";

	function __construct() {
		call_user_func(array($this, 'menu'));
		call_user_func(array($this, 'infopanel'));
		call_user_func(array($this, 'sectionCookies'));
	}

	function menu() {
		$menu_kesz = '<ul style="float:left;">';

		$jobbos_menu = ($GLOBALS['USER']['rang'] >= 8 ? $GLOBALS["MENU_job_admin"] : $GLOBALS["MENU_job"]);
		
		foreach($GLOBALS["MENU_bal"] as $elem) {
			$menu_kesz .= '<li><a href="' . $elem['cim'] . '" target="' . $this->hol . '">' . $elem['olvas'] . '</a></li>';
		}

		$menu_kesz .= '</ul>';
		$menu_kesz .= '<ul style="float:right;padding-right:20px;">';

		foreach($jobbos_menu as $elem) {
			$menu_kesz .= '<li><a href="' . $elem['cim'] . '" target="' . $this->hol . '">' . $elem['olvas'] . '</a></li>';
		}

		$menu_kesz .= '</ul>';

		$GLOBALS['smarty']->assign('menu_kesz', $menu_kesz);

		//a kek menut k�sz�ti
		$menu_kek = "<ul>";

		foreach($GLOBALS["MENU_bal"] as $elem) {
			$menu_kek .= '<li><a class="' . $elem['class'] . '" href="' . $elem['cim'] . '" target="' . $this->hol . '">' . $elem['olvas'] . '</a></li>';
		}

		$menu_kek .= '<li class="nav_space"></li>';

		foreach($jobbos_menu as $elem) {
			$menu_kek .= '<li><a class="' . $elem['class'] . '" href="' . $elem['cim'] . '" target="' . $this->hol . '">' . $elem['olvas'] . '</a></li>';
		}

		$menu_kek .= '</ul>';

		$GLOBALS['smarty']->assign('menu_kek', $menu_kek);
	}

	function infopanel() {
		$ipanel = $GLOBALS['USER'];

		$csik_hossz = '304';
		$letolt_csik = ($ipanel['letolt'] > 0) ? round(($ipanel['letolt'] / ($ipanel['letolt'] + $ipanel['feltolt'])) * $csik_hossz) : $csik_hossz / 2;
		$feltolt_csik = $csik_hossz - $letolt_csik;
		$ipanel['feltolt_csik'] = $feltolt_csik;
		$ipanel['letolt_csik'] = $letolt_csik;
		$ipanel['konyvjelzok'] = KonyvJelzo::getKonyvLista();
		$ipanel['display'] = ($_COOKIE[constant('INFOPANEL_COOKIE')] == 'none') ? 'none' : 'block';
		$GLOBALS['USER']['pont'] = $GLOBALS['USER']['pontok'];
		$ipanel['pont'] = (int)$GLOBALS['USER']['pont'];
		$hol = explode('/', $_SERVER['SCRIPT_NAME']);
		$hol = end($hol);

		if($hol != 'index.php') {
			$sql = "SELECT COUNT(*) AS ez FROM szavazatok WHERE uid = '%d' AND szid = (SELECT szid FROM szavazas ORDER BY szid DESC LIMIT 1)";
			db::futat($sql, $ipanel['uid']);

			$ipanel['uj_szavazas'] = (db::egy_ertek() != 1) ? true : false; 
		} else
			$ipanel['uj_szavazas'] = false;

		if($hol != 'levelezes.php') {
			$sql = "SELECT COUNT(*) AS ez FROM levelek WHERE tulaj = '%d' AND status = 'u'";
			db::futat($sql, $ipanel['uid']);

			$ujL = db::egy_ertek();
			if($ujL >= 1) {
				$ipanel['uj_level'] = true;
				$ipanel['level_text'] = $ujL . " db �j lev�l";
			} else {
				$ipanel['uj_level'] = false;
				$ipanel['level_text'] = 'Nincs �j leveled!';
			}
		} else
			$ipanel['uj_level'] = false;
		
		$GLOBALS['smarty']->assign('ipanel', $ipanel);
	}

	function section($tomb) {
		$tt = call_user_func('section_open', $tomb['cim']);
		$tt .= $tomb['tt'];
		$tt .= call_user_func('section_end');		
		$GLOBALS['OLDAL'][] = $tt;		
	}

	function szavazhat($mit) {
		db::futat("SELECT text, sze_id AS id FROM szavazas_elem WHERE szid = '%d' ORDER BY id", $mit);
		$tomb = db::tomb();

		$tt = '<form action="index.php" method="post" >';
		$tt .= "\n<div class=\"vote\">";
		$i = 1;
		foreach($tomb as $elem) {
			$tt .= '<p><b>' . $i . '.</b><i>V�lasz:</i></p><p>&nbsp;&nbsp;<input name="voks" value="' . $elem['id'] . '" type="radio">&nbsp;<b>' . $elem['text'] . '</b></p><br>' . "\n";
			$i++;
		}
		$tt .= '<p><b>#.</b><i>Tart�zkodom:</i></p><p>&nbsp;&nbsp;<input name="voks" value="1" type="radio">&nbsp;<b>Csak l�tni szeretn�m az eredm�nyeket...</b></p>';
		$tt .= '</div><br /><p><input value="Szavazok!" name="submit" src="kinezet/' . $GLOBALS['USER']['smink'] . '/btn_vote.png" type="image"></p></form>';
		return $tt;
	}

	function szavazas_eredmeny($mit) {
		$data = Cache::get(CACHE_AKTIV_SZAVAZAS, $mit);	
		return $data;
	}

	function sectionCookies() {
		$cook = explode(',', $_COOKIE[constant('SECTION_COOKIE')]);
		$cook = array_flip($cook);
		$cook = array_flip($cook);
		$GLOBALS['SECTION_COOKIES'] = $cook;
		setcookie(constant('SECTION_COOKIE'), implode(',', $cook), time() + 60 * 60 * 24 * 365);
	}
}

?>
