<?php
if(!defined('SZINT') || SZINT != 666 ) die('Hozz�f�r�s megtagadva');
define('SZINT1', 666); //ez �ll�tja, be hogy csak egy m�sik lapon kereszt�l lehessen megnyitni a saj�t oszt�jokat
define('ora_indul', microtime(true));

ini_set('register_globals','off');
header("Content-type: text/html; charset=iso-8859-2");//be�ll�tom a megfelel� karakter k�dol�st...

require_once('config.php'); //konfigur�ci�s f�jl csatol�sa.
require_once(CORE_DIR . 'funkciok.php'); //f�ggv�ny lista csatol�sa

/**
* VARS INIT
**/
foreach(Cache::get(CACHE_VALTOZOK) as $key => $val) {
	define(strtoupper($key), $val['value'], true);
}

require_once(CORE_DIR . 'valtozo.php'); //a v�ltoz�k list�j�nak csatol�sa

/**********************/
/* Session be�ll�t�sa */
/**********************/
session_name('SkyTech');
session_start();
if(empty($_SESSION))
	$_SESSION = array();
$USER = &$_SESSION;
if(!array_key_exists('formtoken', $USER))
	$USER['formtoken'] = md5(mt_rand() . microtime()); //az �rlaphoz �ll�tja be a hiteles�t�st

/********************/
/* suti beallitasok */
/********************/
//suti be�ll�t�s
session_set_cookie_params(SUTI_ELET, '/');
ini_set('session.gc_maxlifetime', SUTI_KUKA );
ini_set('session.use_only_cookies', 1);

/**********************/
/* smarty beallitasok */
/**********************/
require_once(CORE_DIR . "smarty/Smarty.class.php");
switch($USER['smink']) {
	/*
	case 'kek':
		require_once(CLASS_DIR . 'smarty_kek_class.php'); //a smarty oszt�ly csatol�sa �s p�ld�nyos�t�sa 
		$smarty = new smarty_kek();
		define('KONYVJELZO_DB', 5);
	break;
	
	case 'szurke':
		require_once(CLASS_DIR . 'smarty_szurke_class.php'); //a smarty oszt�ly csatol�sa �s p�ld�nyos�t�sa 
		$smarty = new smarty_szurke();
		define('KONYVJELZO_DB', 5);
	break;
	*/
	
	default:
		require_once(CLASS_DIR . 'smarty_alap.class.php'); //a smarty oszt�ly csatol�sa �s p�ld�nyos�t�sa 
		$smarty = new smarty_alap();
		define('KONYVJELZO_DB', 6);
	break;
}

if(!empty($_SESSION['uzenet'])){
	$OLDAL[] = $_SESSION['uzenet'];
	unset($_SESSION['uzenet']);
}

$g = $_GET;
$p = $_POST;

$smarty->assign('RANGOK', $RANGOK);
?>