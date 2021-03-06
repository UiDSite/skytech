<?php
ob_start();
define('SZINT', 666);
require_once('rendszer/mag.php');
$belep = new belep();
$old = new old();
$torrent = new Torrent();


$where = array();
$order = '';
$lapozo = new lapozo($_SERVER['REQUEST_URI'], $USER['perold'][0]);

if(!empty($p['keres_text'])) {
	$where[] = " (t.name LIKE '%" . $p['keres_text'] . "%' OR t.search_text LIKE '%" . $p['keres_text'] . "%') ";
	$smarty->assign('keres_text', $p['keres_text']);

	if(is_numeric($p['keres_tipus']))
		$where[] = " t.kid = '" . $p['keres_tipus'] . "' ";

	if($p['keres_status'] == 'aktiv')
		$where[] = " ((SELECT COUNT(*) FROM peers p WHERE p.tid = t.tid) > 0) ";
	elseif($p['keres_status'] == 'inaktiv')
		$where[] = " ((SELECT COUNT(*) FROM peers p WHERE p.tid = t.tid) <1 ) ";
	elseif($p['keres_status'] == 'ingyen')
		$where[] = " t.ingyen = 'yes' ";
	elseif($p['keres_status'] == 'mod')
		$where[] = " t.admin_id IS NULL OR (t.admin_megj IS NOT NULL AND t.admin_megj != '') ";
} else {
	if(!empty($g['tipus']) || !empty($g['uid']) || !empty($g['mind']) || !empty($g['ingyen'])) {
		if(!empty($g['tipus']))
			$where[] = " t.kid = '" . $g['tipus'] . "' ";

		if(!empty($g['uid']))
			$where[] = " t.uid = '" . $USER['uid'] . "' ";

		if($g['ingyen'] == 'yes')
			$where[] = " t.ingyen = 'yes' ";
	} elseif(!empty($USER['kategoriak_text'])) {
		$where[] = " t.kid IN(" . $USER['kategoriak_text'] . ")";
	}
}

switch($g['rendez']) {
	case 'tipus':
		$order = ' nev ';
	break;

	case 'tipus_d':
		$order = ' nev DESC ';
	break;

	case 'nev':
		$order = ' t.name ';
	break;

	case 'nev_d':
		$order = ' t.name DESC ';
	break;

	case 'letoltve':
		$order = ' t.letoltve ';
	break;

	case 'letoltve_d':
		$order = ' t.letoltve DESC ';
	break;

	case 'seed':
		$order = ' seed ';
	break;

	case 'seed_d':
		$order = ' seed DESC ';
	break;

	case 'leech':
		$order = ' leech ';
	break;

	case 'leech_d':
		$order = ' leech DESC ';
	break;

	case 'ero':
	break;

	case 'ero_d':
	break;

	case 'feltolto':
		$order = ' username ';
	break;

	case 'feltolto_d':
		$order = ' username DESC ';
	break;

	case 'meret':
		$order = ' meret ';
	break;

	case 'meret_d':
		$order = ' meret DESC ';
	break;

	default:
		$order = ' t.datum DESC ';
	break;
}

$kategoriaTomb = kategoria::getForOption();
$kategoriaPlusz = array(array('value' => 'mind', 'text' => '?sszes t?pusban'));
$kategoriaTomb = array_merge($kategoriaPlusz, $kategoriaTomb);

if(!empty($p['keres_tipus'])) {
	foreach($kategoriaTomb as $key => $val) {
		if($p['keres_tipus'] == $val['value'])
			$kategoriaTomb[$key]['selected'] = true;
	}
}
$smarty->assign('keres_tipusok', $kategoriaTomb);

$statusTomb[] = array('value' => 'mind', 'text' => 'Akitv ?s inakt?v');
$statusTomb[] = array('value' => 'aktiv', 'text' => 'Aktiv torrentek');
$statusTomb[] = array('value' => 'inaktiv', 'text' => 'Inakt?v torrentek');
$statusTomb[] = array('value' => 'ingyen', 'text' => 'Ingyen torrentek');
if($USER['rang'] >= 8)
	$statusTomb[] = array('value' => 'mod', 'text' => 'Ellen?rizetlen ?s hib?s');

if(!empty($p['keres_status'])) {
	foreach($statusTomb as $key => $val) {
		if($p['keres_status'] == $val['value'])
			$statusTomb[$key]['selected'] = true;
	}
}
$smarty->assign('keres_status', $statusTomb);

$queryString = array('uid', 'page', 'tipus');
$queryTomb = array();
foreach($queryString as $val) {
	if(!empty($g[$val]))
		$queryTomb[] = $val . "=" . $g[$val];
}
$queryUrl = $_SERVER['SCRIPT_NAME'] . '?' . implode('&', $queryTomb) . (count($queryTomb) == 0 ? '' : '&');

$keszQuery = array();
$rendezLehetoseg = array('tipus', 'nev', 'letoltve', 'seed', 'leech', 'ero', 'feltolto', 'meret');
foreach($rendezLehetoseg as $val) {
	if(str_replace('_d', '', $g['rendez']) == str_replace('_d', '', $val))
		$keszQuery[] = $queryUrl . 'rendez=' . (strpos($g['rendez'], '_d') !== false ? $val : $val . '_d');
	else
		$keszQuery[] = $queryUrl . 'rendez=' . $val;
}
$smarty->assign('rendezlink', $keszQuery);

$torrentTomb = $torrent->fullLoad($where, $order, $lapozo->limitalo());
db::futat('SELECT FOUND_ROWS() AS id');
$lapozo->max = db::sor();
$smarty->assign('lapozo', $lapozo->szamsor());
$smarty->assign('betuvel', $lapozo->betuvel());
$smarty->assign('selectbe', $lapozo->selectbe());
if($USER['rang'] >= TORRENET_ADMIN_MIN_RANG)
	$smarty->assign('admin_panel', true);
$smarty->assign('torrentek', $torrentTomb);
$smarty->assign('kategoriak', kategoria::getToLista());
$smarty->assign('OLDAL', $OLDAL);
$smarty->display('letolt.tpl');
ob_end_flush();

?>
