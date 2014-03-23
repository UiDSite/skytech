<?php
if(!defined('SZINT1') || SZINT1 !== 666 ) die('Hozz�f�r�s megtagadva'); //oszt�ly biztons�g

define('SYSTEM_OFF', false);

define('SQL_DEBUG', false);
define('SQL_MAIL', true);
define('JS_COMMPRES', false);
define('DEBUG_MAIL', 'dave666.david@gmail.com');
define('LOAD_WIDTH', 550);

/*************************/
/* Adatb�zis be�ll�t�sok */
/*************************/
define('DB_USER', 'root'); //az adatb�zishoz kapcsol�d�shoz haszn�lt felhaszn�l�i n�v
define('DB_PASS', 'usbw'); //jelsz�
define('DB_HOST', 'localhost'); //a host ahov� a mysql csatlakozik
define('DB_DATA', 'sky'); //az oldalhoz tartoz� adatb�zis neve

/************************/
/* k�nyvt�r be�ll�t�sok */
/************************/ 
define('ROOT_DIR', '');
define('WEBROOT_DIR', ROOT_DIR);
define('SABLON_DIR', ROOT_DIR . 'sablon/');
define('CORE_DIR', ROOT_DIR . 'rendszer/');
define('CLASS_DIR', CORE_DIR . 'classes/');
define('MAILER_DIR', CORE_DIR . 'phpmailer/');
define('CACHE_DIR', ROOT_DIR . 'cache/');
define('DB_CACHE_DIR', CACHE_DIR . 'db/');
define('SMARTY_COMPILE_DIR', CACHE_DIR . 'compile/');
define('JS_PRIVATE_DIR', ROOT_DIR . 'scriptek/');
define('JS_PUBLIC_DIR', WEBROOT_DIR . 'scriptek/');
define('TORRENT_PATH', ROOT_DIR . 'torrentek/');
define('LOGS_PATH', ROOT_DIR . 'logs/');


define('OLDAL_HIBA', '<b>Kedves felhaszn�l�nk!</b><br/><br/>Oldalunk jelenleg karbantart�s alatt �ll, k�r�nk n�zz vissza k�s�bb!<br>V�rhat� indul�s 2009.11.30!<br>Meg�rt�seteket k�sz�nj�k!<br/><br/><i>Sky-Tech Staff</i>',true);

/**
* CACHE
**/
define('CACHE_VALTOZOK', 1);
define('CACHE_HIREK', 2);
define('CACHE_INDEX_STATS', 3);
define('CACHE_AKTIV_USER', 4);
define('CACHE_AKTIV_SZAVAZAS', 5);
define('CACHE_DOKUMENTACIO', 6);
define('CACHE_KONYVJELZOK', 7);

$CACHE_CONFIG[CACHE_HIREK] = array(
	"type"      => "file", 
	"name"      => "hirek.cache",
	"serialize" => true,
	"create"    => array('Hir', 'createCache'),
);

$CACHE_CONFIG[CACHE_VALTOZOK] = array(
	"type"      => "file",
	"name"      => "valtozok.cache",
	"serialize" => true,
	"create"    => array('Vars', 'getByType'),
);

$CACHE_CONFIG[CACHE_INDEX_STATS] = array(
	"type"      => "file",
	"name"      => "index_stats.cache",
	"serialize" => true,
	"create"    => array('Stats', 'indexStats'),
	"time"      => 1000
);

$CACHE_CONFIG[CACHE_AKTIV_USER] = array(
	"type"      => "file",
	"name"      => "aktiv_users_stats.cache",
	"serialize" => true,
	"create"    => array('Stats', 'aktivUsers'),
	"time"      => 300
);

$CACHE_CONFIG[CACHE_AKTIV_SZAVAZAS] = array(
	"type"      => "file",
	"name"      => "aktiv_szavazas.cache",
	"serialize" => false,
	"create"    => array('Szavazas', 'getDataById'),
);

$CACHE_CONFIG[CACHE_DOKUMENTACIO] = array(
	"type"      => "file",
	"name"      => "dok.cache",
	"serialize" => true,
	"create"    => array('Doc', 'createCache'),
);

$CACHE_CONFIG[CACHE_KONYVJELZOK] = array(
	"type"      => "session",
	"name"      => "konyvjelzo",
	"serialize" => false,
	"create"    => array('KonyvJelzo', 'setKonyvLista'),
);

/**
	AutoLoad
**/
function __autoload($className) {
	$classFile = strtolower($className) . '.class.php';
	$classPath = CLASS_DIR . $classFile;
	if(is_readable($classPath)) {
		require_once($classPath);
	}
}
?>