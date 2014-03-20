<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');


$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se



if(SYSTEM_OFF===true){
	echo Oldal_hiba;
	exit;
}

/*********/
/* H�rek */
/*********/

//hirek el��ll�t�sa

db::futat("select hid as id,cim,text,datum,disp from hirek order by datum desc");

$hirek=db::tomb();

if($USER['rang']>10){

	$smarty->assign('uj_link','<a href="hirek.php?mit=uj&vissza=index.php" >�j h�r hozz�ad�sa</a>');	

}



foreach($hirek as $key=>$val){

	$hirek[$key]['text']=bb::bbdecode($val['text']);

}

$smarty->assign('hirek', Cache::get( CACHE_HIREK ) );



/************/
/* Szavaz�s */
/************/

/*
//Az aktu�lis szavaz�s kikeres�es
db::futat("select szid,cim,datum from szavazas order by szid desc limit 0,1");
$tomb=db::tomb();


//az usernek van-e m�r szavaz�sa
db::futat("select uid from szavazatok where uid='%d' and szid='%d'",$USER['uid'],$tomb[0]['szid']);
$tomb2=db::tomb();

if( !empty($p['voks']) && empty($tomb2[0]['uid']) ){
	
	if(db::futat("insert into szavazatok(uid,sze_id,szid) values('%d','%d','%d')",$USER['uid'],$p['voks'],$tomb[0]['szid'])!==true){
		$_SESSION['uzenet'] = hiba_uzi('A szavaz�s r�gz�t�se sikertelen, pr�b�ld �jra :(');	
	}
	else{
		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		Cache::set( CACHE_AKTIV_SZAVAZAS, $tomb[0]['szid'] );
	}
	header("Location: index.php");
	exit;
}
//a r�gz�t�si form kiir�sa
else{
	if( !empty($tomb2[0]['uid']) ){
		$szavaz['text']=$old->szavazas_eredmeny($tomb[0]['szid']);
	}
	else{
		$szavaz['text']=$old->szavazhat($tomb[0]['szid']);
	}
}



// szavazas adati
$szavaz['cim']=$tomb[0]['cim'];
$szavaz['datum']=$tomb[0]['datum'];

if($USER['rang']>10){

	$szavaz['link']='<a href="szavazas.php?mit=mod&id='.$tomb[0]['szid'].'&vissza=index.php">Szavaz�s szerkeszt�se</a> &bull; ';

	$szavaz['link'].='<a href="szavazas.php?mit=del&id='.$tomb[0]['szid'].'&vissza=index.php" class="szavaztorol" alt="'.$tomb[0]['szid'].'">Szavaz�s t�rl�se</a> &bull; ';

	$szavaz['link'].='<a href="szavazas.php?mit=uj&vissza=index.php">�j szavaz�s</a>';

}
$smarty->assign('szavaz',$szavaz);

*/




/****************/
/* Akt�v userek */
/****************/
/*
$tomb = Cache::get(CACHE_AKTIV_USER );
$smarty->assign('user_list',$tomb);
$smarty->assign('akt_user','Akik jelenleg az oldalt b�ng�szik (�sszesen '.count($tomb).' felhaszn�l�)');
//d(db::$parancs);
*/

/*************************/
/* �ltal�mos statisztika */
/*************************/




//szerver fut

db::futat("SHOW GLOBAL VARIABLES");

db::futat("SHOW GLOBAL STATUS");
$tomb=db::tomb();
//d($tomb);
$idotomb=explode(':',date('j:H:i:s',$tomb[250]["Value"]));
$stat['futasido']=$idotomb[0].' nap '.$idotomb[1].' �ra '.$idotomb[2].' perc '.$idotomb[3].' sec ';


$cr=upTimeProcess();
$smarty->assign('cpu_width', round( ( LOAD_WIDTH* $cr ) ) );
$smarty->assign('cpu_arany',round( ($cr*100),2 ));


$rr=round( ( $cr/rand(3,9) ) ,2 ); 
$smarty->assign('ram_width', round( ( LOAD_WIDTH* $rr ) ) );
$smarty->assign('ram_arany',round( ($rr*100),2 ));



$smarty->assign('stat', Cache::get( CACHE_INDEX_STATS ) );


$smarty->assign('OLDAL',$OLDAL);
$smarty->display('index.tpl');

ob_end_flush ();
?>