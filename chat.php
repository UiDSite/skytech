<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se

$smarty->assign('mehet',true);
$smarty->assign('OLDAL',$OLDAL);
$smarty->display('chat.tpl');
ob_end_flush ();
?>