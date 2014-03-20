<?php
if(!defined('SZINT1') || SZINT1!==666 ) die('Hozz�f�r�s megtagadva'); //oszt�ly biztons�g


/***********************/
/* Smarty be�ll�t�sok  */
/***********************/


define('SMARTY_DEF_TEMPLATE_DIR', SABLON_DIR . 'alap/'); //a smarty template_dir el�r�se

define('SMARTY_CACHE',false); //smarty cache l�se false/true
define('SMARTY_CACHE_TIME','10'); //smarty cache id�
define('SMARTY_DEBUG',false); //smarty debug false/true


/******************************/
/* Oldal adatainak be�ll�t�sa */
/******************************/



define('Oldal_verzio', '1.3' ,true);
define('Oldal_fejlec','..::'.OLDAL_NEVE.'-'.OLDAL_JELMONDAT.'::..');
define('OLDAL_COPY', 'Copyright &copy; '.date('Y').' '.OLDAL_NEVE,true);
define('Oldal_nyelve','hu');
define('Oldal_lablec_text',OLDAL_NEVE.' Frontend v'.OLDAL_VERZIO.' '.OLDAL_COPY,true);

define('TORRENT_TRACKER',Oldal_cime."/tracker.php");


define('MAX_TORRENT_SIZE',1000000); 



define('Suti_elet',28800); //a suti �let�t �ll�tjuk be (60*60*8)=28800sec=> 8h
define('Suti_kuka',(Suti_elet+600)); //a suti ennyi id� mulva szem�tnek min�s�l �s t�rli a rendszer.....



/*****************/
/* Hiba szovegek */
/*****************/

define('HIBAS_NEV','A megadott felhaszn�l�i n�v jelsz� p�ros nem l�tezik!');
define('HIBAS_JELSZO','A megadott felhaszn�l�i n�v jelsz� p�ros nem l�tezik!');
define('HIBA_NO_ID','K�rlek jelentkezz be!');
define('HIBA_TIMEOUT','A rendszer t�tlens�g miatt kil�ptetet!');
define('HIBA_UJRA','Az �jraellen�rz�s nem siker�lt l�pj be �jra');
define('HIBA_MEGEROSITETLEN','A felhaszn�l�i fi�kod m�g meger�s�tetlen!');
define('HIBA_NINCS_STATUS','A felhaszn�l�i fi�kod megs�r�lt!!');
define('HIBA_TOROLT_USER','A felhaszn�l�i fi�kod t�rl�d�tt!!');

define('SQL_QUERY_LOG', false );
define('BELEP_HIBA_NAPI_LIMIT',7);

define('HIR_ADMIN_MIN_RANG', 9);
define('SZAVAZAS_ADMIN_MIN_RANG',9);
define('FORUM_ADMIN_MIN_RANG',8);
define('DOKUMENTUM_ADMIN_MIN_RANG',8);
define( 'TORRENET_ADMIN_MIN_RANG', 8);
define( 'TORRENET_ADMIN_HSZ_MIN_RANG', 8);
define( 'USER_ADMIN_IN_USERINFO', 8);
define( 'USER_EMAIL_NO_HIDDEN_MIN_RANG',9);
define( 'STAFF_MAIL_MIN_RANG',8);

define( 'KERESEK_ADMIN_MIN_RANG',8);




define('SECTION_COOKIE','skysection');
define('INFOPANEL_COOKIE','skyinfopanel');


/*********************************/
/* az oldal v�ltoz�it tartalmazza*/
/*********************************/
  
$theme='alap'; // az alap�rtelmezett smink
define('MB', (1024 * 1024) );
define('GB', (1024 * MB)   );

$RANGOK=array(
        '1'   =>  '�jonc',
        '2'   =>  'Leecher',
        '3'   =>  'Felhaszn�l�',
        '4'   =>  'Tag',
        '5'   =>  'ViP',
        '6'   =>  'Helpdesk',
        '7'   =>  '<font color="#6a97da">Felt�lt�</font>',
        '8'   =>  'Moder�tor',
        '9'   =>  'Adminisztr�tor',
        '10'  =>  'Tulajdonos'
);

$STATUSZOK = array(
        'uj' => '�j',
        'aktiv' => 'Akt�v',
        'passziv' => 'Passz�v',
        'torolt' => 'T�r�lt'
);

$DOKUMNETUM_TIPUSOK=array(
        
        'bbhelp' => 'BB code help',
        'felt' => 'Felt�lt�s',
        'gyik' => 'GY.I.K',
        'helpd' => 'Helpdesk',
        'jogi' => 'Jogi nyilatkozat',
        'link' => 'Linkek',
        'meghivo' => 'Megh�v�',
        'szab' => 'Szab�lyzat',
        'uzifal' => '�zen�fal'
);

$PONT_EVENTS[0]=array('name'=>'Bejelentkez�s','value'=>1);

$PONT_EVENTS[1]=array('name'=>'Felt�lt�s( 500MB - 1GB )','value'=>1);
$PONT_EVENTS[2]=array('name'=>'Felt�lt�s( 1GB - 3GB )','value'=>2);
$PONT_EVENTS[3]=array('name'=>'Felt�lt�s( 3GB felett  )','value'=>3);



$PONT_EVENTS[10]=array('name'=>'Torrent felt�lt�s(  200MB alatt )','value'=>1);
$PONT_EVENTS[11]=array('name'=>'Torrent felt�lt�s( 200-800MB )','value'=>2);
$PONT_EVENTS[12]=array('name'=>'Torrent felt�lt�s( 800MB felett )','value'=>3);


$PONT_EVENTS[20]=array('name'=>'Sky-Tech pontjutalom','value'=>10);
$PONT_EVENTS[21]=array('name'=>'Sky-Tech pontjutalom ( k�zepes )','value'=>50);
$PONT_EVENTS[22]=array('name'=>'Sky-Tech pontjutalom ( nagy )','value'=>100);

$PONT_EVENTS[30]=array('name'=>'Figyelmeztet�s ( warn )','value'=> -20 );
$PONT_EVENTS[31]=array('name'=>'Ideiglenes kitilt�s ( ban )','value'=> -50 );

$PONT_EVENTS[40]=array('name'=>'Torrent k�r�se ','value'=> -5 );
$PONT_EVENTS[41]=array('name'=>'Torrent k�r�shez csatlakoz�s ','value'=> 0 );
$PONT_EVENTS[42]=array('name'=>'Torrent teljes�t�se ','value'=> 0 );







$PONT_EVENTS[666]=array('name'=>'Rendszer tesztel�sre ','value'=> 100 );





/*
$RANGOK=array(
        '1'   =>  'Honv�d',
        '2'   =>  'Tizedes',
        '3'   =>  '�rmester',
        '4'   =>  'F�t�rzs�rmester',
        '5'   =>  'Z�szl�s',
        '6'   =>  'Hadnagy',
        '7'   =>  'Sz�zados',
        '8'   =>  '�rnagy',
        '9'   =>  'Ezredes',
        '10'  =>  'T�bornagy'
);
*/

$OS_TIPUSOK=array(
        
        2=>'Windows XP',
        3=>'Windows 98',
        4=>'Windows 2000',
        5=>'Windows 2003 server',
        6=>'Windows Vista',
        7=>'Windows NT',
        8=>'Windows ME',
        9=>'Windows CE',
        10=>'Windows ME',
        11=>'Mac OS X',
        12=>'Macintosh',
        13=>'Linux',
        14=>'Free BSD',
        15=>'Symbian',
        16=>'Egy�b'     
);

$BONGESZO_TIPUSOK=array(
        
        1 => 'Mozilla Firefox',
        2 => 'Netscape',
        3 => 'Safari',
        4 => 'Galeon',
        5 => 'Konqueror',
        6 => 'Gecko based',
        7 => 'Opera',
        8 => 'Lynx',
        9 => 'Netscape',
        10 => 'Egy�b',
        11 => 'Internet Explorer'
);

$NO_LOGS_FILE=array('letolt_admin.php','level.php','userlista.php','modimanel.php','chat_admin.php');



$filetypes = array(
        'ace'  =>  'ACE arch�vum',
        'arj'  =>  'ARJ arch�vum',
        'tar'  =>  'Tape Archive',
        'bz'  =>  'Bzip arch�vum',
        'zip'  =>  'ZIP arch�vum',
        'rar'  =>  'RAR arch�vum',
        '7z'  =>  '7-zip arch�vum',
        'uha'  =>  'UHA arch�vum',
        'wav'  =>  'Hanghull�m',
        'mp3'  =>  'Mpeg Layer-3',
        'ape'  =>  "Monkey's Audio",
        'flac'  =>  'FLAC audio',
        'ogg'  =>  'OGG Vorbis audio',
        'avi'  =>  'Audio Video Interleave',
        'wmv'  =>  'Windows Media Video',
        'qt'  =>  'QuickTime video',
        'mpg'  =>  'MPEG video',
        'mpeg'  =>  'MPEG video',
        'mkv'  =>  'Matroska Video Stream',
        'ts'  =>  'Transport Stream MPEG-2 video',
        '3gp'  =>  '3GPP Multimedia f�jl',
        'bmp'  =>  'Bitt�rk�p',
        'jpg'  =>  'JPEG/JIFF k�p',
        'jpeg'  =>  'JPEG/JIFF k�p',
        'jpe'  =>  'JPEG/JIFF k�p',
        'gif'  =>  'GIF k�p',
        'png'  =>  'PNG k�p',
        'tiff'  =>  'TIFF k�p',
        'psd'  =>  'PhotoShop k�p',
        'wmf'  =>  'Windows Metafile',
        'psp'  =>  'Paint Shop Pro k�p',
        'txt'  =>  'Sz�veges f�jl',
        'rtf'  =>  'Rich Text f�jl',
        'doc'  =>  'Word dokumentum',
        'xls'  =>  'Excel dokumentum',
        'db'  =>  'Adatb�zis f�jl',
        'ppt'  =>  'PowerPoint prezent�ci�',
        'pps'  =>  'PowerPoint vet�t�s',
        'ini'  =>  'Konfigur�ci�s be�ll�t�sok',
        'inf'  =>  'Telep�t�si inform�ci�k',
        'lnk'  =>  'Parancsikon',
        'exe'  =>  'Programf�jl',
        'dll'  =>  'Dinamic Link Library',
        'sys'  =>  'Rendszerf�jl',
        'vxd'  =>  'Virtu�lis illeszt�program',
        'hlp'  =>  'S�g�f�jl',
        'chm'  =>  'HTML s�g�f�jl',
        'dat'  =>  'Adatf�jl',
        'iso'  =>  'ISO lemezk�p',
        'mds'  =>  'Media Descriptor',
        'mdf'  =>  'Alcohol 120% lemezk�p',
        'bin'  =>  'Bin�ris adatfolyam',
        'cue'  =>  'Lemezk�p f�jl',
        'nrg'  =>  'Nero lemezk�p',
        'bws'  =>  'BlindWrite lemezk�p',
        'bwt'  =>  'BlindWrite lemezk�p',
        'bwi'  =>  'BlindWrite lemezk�p',
        'm3u'  =>  'm3u lej�tsz�lista',
        'pls'  =>  'pls lej�tsz�lista',
        'bat'  =>  'Windows 9x k�tegf�jl',
        'cmd'  =>  'Windows NT k�tegf�jl',
        'js'  =>  'JavaScript f�jl',
        'jar'  =>  'Java arch�vum',
        'pdf'  =>  'Adobe PDF dokumentum',
        'cab'  =>  'CAB arch�vum',
        'bik'  =>  'Bink video',
        'vob'  =>  'DVD video',
        'ifo'  =>  'DVD Info f�jl',
        'sfv'  =>  'Checksum f�jl',
        'nfo'  =>  'Inform�ci�s f�jl',
        'ccd'  =>  'CloneCD lemezk�p',
        'img'  =>  'CloneCD lemezk�p',
        'sub'  =>  'CloneCD lemezk�p'
);

$ORSZAGTOMB=array('Nincs adat','Afganiszt�n' ,'Alb�nia' ,'Alg�ria' ,'Andorra' ,'Angola' ,'Antigua �s Barbuda' ,'Arab Em�rs�gek' ,'Argent�na' ,'Ausztr�lia' ,'Ausztria' ,'Azerbajdzs�n' ,'Bahama-szigetek' ,'Bahrein' ,'Banglades' ,'Barbados' ,'Belgium' ,'Belize' ,'Benin' ,'Bhut�n' ,'Bissau-Guinea' ,'Bol�via' ,'Bosznia-Herc.' ,'Botswana' ,'Braz�lia' ,'Brunei' ,'Bulg�ria' ,'Burkina Faso' ,'Burundi' ,'Chile' ,'Ciprus' ,'Comore-szigetek' ,'Costa Rica' ,'Cs�d' ,'Csehorsz�g' ,'D�nia' ,'D�l-Afrikai K�zt.' ,'Dominikai K�z�ss�g' ,'Dominikai K�zt.' ,'Dzsibuti' ,'Ecuador' ,'Egyenl�toi Guinea' ,'Egyiptom' ,'Elef�ntcsontpart' ,'Eritrea' ,'�sztorsz�g' ,'Eti�pia' ,'Feh�roroszo.' ,'Fidzsi-szigetek' ,'Finnorsz�g' ,'Franciaorsz�g' ,'F�l�p-szigetek' ,'Gabon' ,'Gambia' ,'Gh�na' ,'G�r�gorsz�g' ,'Grenada' ,'Gr�zia' ,'Guatemala' ,'Guinea' ,'Guyana' ,'Haiti' ,'Hollandia' ,'Honduras' ,'Horv�torsz�g' ,'India' ,'Indon�zia' ,'Irak' ,'Ir�n' ,'�rorsz�g' ,'Izland' ,'Izrael' ,'Jamaica' ,'Jap�n' ,'Jemen' ,'Jord�nia' ,'Jugoszl�via' ,'Kambodzsa' ,'Kamerun' ,'Kanada' ,'Katar' ,'Kazahszt�n' ,'Kenya' ,'K�na' ,'Kirgiziszt�n' ,'Kiribati' ,'Kolumbia' ,'Kong�' ,'Korea' ,'Koreai NDK' ,'K�z�p-Afrikai K�zt.' ,'Kuba' ,'Kuvait' ,'Laosz' ,'Lengyelorsz�g' ,'Lesotho' ,'Lettorsz�g' ,'Libanon' ,'Lib�ria' ,'L�bia' ,'Liechteinstein' ,'Litv�nia' ,'Luxemburg' ,'Maced�nia' ,'Madagaszk�r' ,'Magyarorsz�g' ,'Malajzia' ,'Malawi' ,'Mald�v-szigetek' ,'Mali' ,'M�lta' ,'Marokk�' ,'Marshall-szigetek' ,'Maurit�nia' ,'Mauritius' ,'Mexik�' ,'Mianmar' ,'Mikron�zia' ,'Moldova' ,'Monaco' ,'Mong�lia' ,'Mozambik' ,'Nagy-Britannia' ,'Nam�bia' ,'Nauru' ,'N�metorsz�g' ,'Nep�l' ,'Nicaragua' ,'Niger' ,'Niger�a' ,'Norv�gia' ,'Nyugat-Szahara' ,'Olaszorsz�g' ,'Om�n' ,'Oroszorsz�g' ,'�rm�nyorsz�g' ,'Pakiszt�n' ,'Palau' ,'Panama' ,'P�pua �j-Guinea' ,'Paraguay' ,'Peru' ,'Portug�lia' ,'Rom�nia' ,'Ruanda' ,'Saint Kitts �s Nevis' ,'Saint Lucia' ,'Saint Vicent' ,'Salamon-szigetek' ,'Salvador' ,'San Marino' ,'Sao Tom� & Principe' ,'Seychelle-szk.' ,'Sierra Leone' ,'Spanyolorsz�g' ,'Sri Lanka' ,'Suriname' ,'Sv�jc' ,'Sv�dorsz�g' ,'Szamoa' ,'Sza�d-Ar�bia' ,'Szeneg�l' ,'Szerbia' ,'Szingapur' ,'Sz�ria' ,'Szlov�kia' ,'Szlov�nia' ,'Szom�lia' ,'Szud�n' ,'Szv�zif�ld' ,'T�dzsikiszt�n' ,'Tanz�nia' ,'Thaif�ld' ,'Togo' ,'Tonga' ,'T�r�korsz�g' ,'Trinidad �s Tobago' ,'Tun�zia' ,'Tuvalu' ,'T�rkmeniszt�n' ,'Uganda' ,'�j-Z�land' ,'Ukrajna' ,'Uruguay' ,'Usa' ,'�zbegiszt�n' ,'Vanatu' ,'Vatik�n' ,'Venezuela' ,'Vietnam' ,'Zaire' ,'Zambia' ,'Zimbabwe' ,'Z�ld-foki K�zt.');


$OLDAL=array();
$MENU=array();

/************/
/* Tilt�sok */
/************/



$tiltott_email = array(
                'sky-tech@gmail.com',
                'info@sky-tech.hu',
                'highpowersystem@gmail.com',
                'waserver@gmail.com'
                
);

$tiltott_nev= array(
                'God',
                'Saddam',
                'BinLaden',
                'Hitler',
                'darkboss',
                'darkboss555',
                'kiki',
                'Zedi'
);



/*********/
/* Menu */
/********/


$MENU_bal=array(
        array(
                "olvas"=>"<span class='menu'>F�oldal</span>",
                "cim"=>"index.php",
                "class"=>"fooldal"
        ),
        array(
                "olvas"=>"<span class='menu'>Let�lt�s</span>",
                "cim"=>"letolt.php",
                "class"=>"letoltes"
        ),
        array(
                "olvas"=>"<span class='menu'>Felt�lt�s</span>",
                "cim"=>"feltolt.php",
                "class"=>"feltoltes"
        ),
        array(
                "olvas"=>"<span class='menu'>K�r�sek</span>",
                "cim"=>"keresek.php",
                "class"=>"keresek"
        ),
        array(
                "olvas"=>"<span class='highlight'>Szab�lyzat</span>",
                "cim"=>"dokumentacio.php?mit=szab",
                "class"=>"szabalyzat"
        ),
        array(
                "olvas"=>"<span class='highlight'>GY.I.K</span>",
                "cim"=>"dokumentacio.php?mit=gyik",
                "class"=>"gyik"
        ),
        array(
                "olvas"=>"<span class='menu'>F�rum</span>",
                "cim"=>"forum.php",
                "class"=>"forum"
        ),
        array(
                "olvas"=>"<span class='menu'>Staff</span>",
                "cim"=>"staff.php",
                "class"=>"staff"
        ),
);



$MENU_job=array(
        array(
                "olvas"=>"Admin",
                "cim"=>"skytech.php",
                "class"=>"staff"
        ),
        array(
                "olvas"=>"Kil�p",
                "cim"=>"belep.php?logout=true",
                "class"=>"kilep"
        ),

);


/***********/
/* Sminkek */
/***********/



//a t�mbben vannak a sminkek az olv -hoz  amegjelen� sz�veg kell az ert-hez a konyvt�r neve 

$sminkek_tomb=array(

        array('olv'=>'Barna','ert'=>'alap'),
        //array('olv'=>'K�k','ert'=>'kek'),
        //array('olv'=>'Sz�rke','ert'=>'szurke')

);



?>
