<?php
ob_start();
define('SZINT', 666);
require_once('rendszer/mag.php');
$belep = new belep();
$old = new old();


if(!empty($p['text'])) {
	$smarty->assign('teszt_text', bb::bbdecode($p['text']));
	$smarty->assign('text', $p['text']);
}

if($USER['rang'] > 8)
	$smarty->assign('admin_link','true');

db::futat("SELECT cim, text, cid FROM cikk WHERE cid = '33'");
$segedlet = array();
foreach(db::elso_sor() as $key => $val) {
	$segedlet[$key] = ($key == 'text') ? bb::bbdecode($val) : $val;
}

$smarty->assign('segedlet', $segedlet);
$smarty->assign('OLDAL', $OLDAL);
$smarty->display('bbcode_teszt.tpl');
ob_end_flush();

?>
