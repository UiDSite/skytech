<?php
ob_start();
define('SZINT',666);
require_once('../rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se

	
			
	//barat hozzaadasa
	if($g['akcio']=='add' && is_numeric($g['uid'])){
		$sql="insert into barat(tulaj_uid,barat_uid) values('%d','%d')";
		if(db::futat($sql,$USER['uid'],$g['uid'])){
			$_SESSION['jelentes']=nyugta('A bar�t felv�tele sikeres volt!');
		}
		else{
			$_SESSION['jelentes']=hiba_uzi('A bar�t felv�tele sikertelen');
		}
		header("Location:barat.php");
	}
	
	//barat delete
	if($g['akcio']=='del' && is_numeric($g['uid'])){
		$sql="delete from barat where tulaj_uid='%d' and barat_uid='%d'";
		if(db::futat($sql,$USER['uid'],$g['uid'])){
			$_SESSION['jelentes']=nyugta('A bar�t t�rl�se sikeres volt!');
		}
		else{
			$_SESSION['jelentes']=hiba_uzi('A bar�t t�rl�se sikertelen');
		}
		header("Location:barat.php");
	}
	
	
	//barat lista
	$sql="select barat_uid from barat where tulaj_uid='%d'";
	db::futat($sql,$USER['uid']);
	
	$baratok=array();
	foreach(db::tomb() as $key=>$val){
		$baratok[$key]=User::load($val['barat_uid']);
		$baratok[$key]['barat']=isBarat($val['barat_uid']);
			}
	//d($baratok);
	$smarty->assign('baratok',$baratok);
	

$smarty->assign('OLDAL',$OLDAL);
$smarty->display('barat.tpl');
ob_end_flush ();
?>