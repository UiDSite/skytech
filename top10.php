<?php
ob_start();
define('SZINT',666);
require_once('../rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se



$torrentStats['Legakt�vabb']=Stats::torrent('total desc');
$torrentStats['Leggyorsabb']=Stats::torrent('seb desc');
$torrentStats['Legt�bb let�lt�s']=Stats::torrent('letoltve desc');
$torrentStats['Legt�bb adat']=Stats::torrent('adat desc');
$torrentStats['Legt�bb Seeder']=Stats::torrent('seed desc');
$torrentStats['Legt�bb Leech']=Stats::torrent('leech desc');

$smarty->assign('torrentek',$torrentStats);



$userStats['Legt�bbet felt�lt�']=Stats::user('feltolt desc');
$userStats['Legt�bbet let�lt�']=Stats::user('letolt desc');
$userStats['Legt�bbet megoszt�']=Stats::user('arany desc');
$userStats['Leggyorsabb felt�lt�']=Stats::user('felseb desc');
$userStats['Leggyorsabb let�lt�']=Stats::user('leseb desc');

$smarty->assign('userek',$userStats);



$smarty->assign('OLDAL',$OLDAL);
$smarty->display('top10.tpl');
ob_end_flush ();
?>