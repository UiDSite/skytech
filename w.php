<?php
ob_start();
define('SZINT',666);
require_once('../rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se


/*
if( !is_resource( db::$kapcsolat ) ){
	die('hiba');
}
else{
	die('eroforras');
}
*/

//d(db::$kapcsolat, 1);
d($GLOBALS['SECTION_COOKIES']);
d( $_COOKIE['skyinfopanel'],1);

/*
$belephet=array(1,2,438);
if(in_array($USER['uid'],$belephet) !==true){
	$OLDAL[]=hiba_uzi('Most fejlesztem id�n meglesz<br />szicsu');
	$smarty->assign('mehet',false);
}
else{
	$smarty->assign('mehet',true);
}
*/
$smarty->assign('UZANOFALTOPICID',14);
$smarty->assign('mehet',true);
$smarty->assign('OLDAL',$OLDAL);
$smarty->display('a.tpl');
ob_end_flush ();
?>