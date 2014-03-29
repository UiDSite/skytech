<?php
ob_start();
define('SZINT', 666);
require_once('rendszer/mag.php');
$belep = new belep();
$old = new old();


$torrentStats['Legakt�vabb'] = Stats::torrent('total DESC');
$torrentStats['Leggyorsabb'] = Stats::torrent('seb DESC');
$torrentStats['Legt�bb let�lt�s'] = Stats::torrent('letoltve DESC');
$torrentStats['Legt�bb adat'] = Stats::torrent('adat DESC');
$torrentStats['Legt�bb Seeder'] = Stats::torrent('seed DESC');
$torrentStats['Legt�bb Leech'] = Stats::torrent('leech DESC');

$userStats['Legt�bbet felt�lt�'] = Stats::user('feltolt DESC');
$userStats['Legt�bbet let�lt�'] = Stats::user('letolt DESC');
$userStats['Legt�bbet megoszt�'] = Stats::user('arany DESC');
$userStats['Leggyorsabb felt�lt�'] = Stats::user('felseb DESC');
$userStats['Leggyorsabb let�lt�'] = Stats::user('leseb DESC');

$smarty->assign('torrentek', $torrentStats);
$smarty->assign('userek', $userStats);
$smarty->assign('OLDAL', $OLDAL);
$smarty->display('top10.tpl');
ob_end_flush();

?>
