<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se
$pontok= new Pont();


$data=$pontok->getAll('uid='.$USER['uid'],'pid desc','0,100');
foreach($data as $i=>$row){
	$data[$i]['eventText']=$PONT_EVENTS[ $row['event'] ]['name'];
}

$smarty->assign('data',$data);
$smarty->assign('OLDAL',$OLDAL);
$smarty->display('pontok.tpl');
ob_end_flush ();
?>