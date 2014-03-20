<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se




if(!empty($g['torol']) && is_numeric($g['torol'])){

	//leellen�rz�s, hogy saj�t megh�v�t akar e t�r�lni....

	db::futat("select uid from meghivo where mid='%d'",$g['torol']);

	if(db::egy_ertek('uid')==$USER['uid']){

		db::futat("delete from meghivo where mid='%d'",$g['torol']);

		db::futat("delete from regisztral where tema='%d'",$g['torol']);

		$uzi=nyugta('A megh�v�t t�r�lt�k');

	}

	else{

		$uzi=hiba_uzi('A megh�v� nem a Ti�d, nem t�r�lt�k!');

	}

	

	

	$_SESSION['uzenet']=$uzi;

	header('Location: meghivo.php');

	exit;

}









//nem kuldhet meghivot

$kuldhet=false;

	

//k�ld�tt-e mar meghivot

$sql="select UNIX_TIMESTAMP(datum) as num from  meghivo where uid='%d' order by mid desc limit 1";

db::futat($sql,$USER['uid']);

$mikor=db::egy_ertek('num');



//kuldott meghivot

if(!empty($mikor)){

	

	//feltoltotte az�ta x mennyiseget

	db::futat("select feltolt as num from  meghivo where uid='%d' order by mid desc limit 1",$USER['uid']);

	$up_mentes=db::egy_ertek('num');		

	

	

	//tobb mint X napja koldott meghivt

	if( ( $mikor + MEGHIVO_IDO_LIMIT ) < time() ){						

		

		//ok minden kuldhet meghivot

		$azota_feltoltot=USER::feltoltKulonbseg($USER['uid'],$up_mentes);

		if($azota_feltoltot > MEGHIVO_UPLOAD_LIMIT){

			$kuldhet=true;

		}

		else{

			$kuldhet=false;

		}			

	}

	//kevesebb

	else{

		$kuldhet=false;

	}

	

	//satisztikahoz az adatok

	$smarty->assign('s_datum',date('Y.m.d H:i:s',$mikor));

	$smarty->assign('s_up',$azota_feltoltot);

	

	//a meghivotta list�ja

	db::futat("select * from meghivo where uid='%d' order by mid desc ",$USER['uid']);

	$tomb=db::tomb();

	

	$kesz=array();

	foreach($tomb as $key=>$val){

		$kesz[$key]['datum']=$val['datum'];

		$kesz[$key]['email']=$val['email'];

		if(!empty($val['meghivott'])){

			$ki=User::load($val['meghivott']);

			$link="<a href='userinfo.php?uid=".$ki['uid']."'>".$ki['name']."</a>";

		}

		else{

			$link="<a href='meghivo.php?torol=".$val['mid']."' title='Megh�v� t�rl�se'>Megh�v� t�rl�se</a>";

		}

		

		$kesz[$key]['link']=$link;

	}

	$smarty->assign('meghivott',$kesz);

	

}

//m�g nem kuldott meghivot

else{

	if(USER::feltoltKulonbseg($USER['uid']) > MEGHIVO_UPLOAD_LIMIT){

		$kuldhet=true;

	}

	else{

		$kuldhet=false;

	}	

	

	$smarty->assign('s_datum',$USER['reg_date']);

	$smarty->assign('s_up',$USER['feltolt']);



}







// faltolto �s magasabb rang� kuldhet meghivot

if($USER['rang']>8){

	$kuldhet=true;

	$smarty->assign('adminpanel',true);

}


/** HACK **/

$kuldhet=true;




$smarty->assign('kuldhet',$kuldhet);





// ha van reg kerelem

if(!empty($p['meghivo'])){

	

	//ellenorzes

	if($kuldhet!==true){

		$OLDAL[]=hiba_uzi('Nem k�ldhetsz megh�volt!!!!!');

	}

	else{

		//email cim alaposabb vizsg�lata

		switch(true){

			

			//email hossza

			case strlen($p['meghivo'])<8 || strlen($p['meghivo'])>40:

				$OLDAL[]=hiba_uzi('Az email c�m hossza nem megfelel�(8-40 karakter k�z�ttinek kell lennie)!');

				$formatum=false;

			break;

			

			//tiltolista

			case array_search($p['meghivo'],$tiltott_email)!==false:

				$OLDAL[]=hiba_uzi('Az email c�m tilt�list�n van!');

				$formatum=false;

			break;

			

			//ervenyes form�tum

			case !ervenyes_email($p['meghivo']):

				$OLDAL[]=hiba_uzi('A megadott email c�m �rv�nytelen!!');

				$formatum=false;

			break;

			

			default:

				$formatum=true;

			break;			

		}

		

		//van-e mar az adatbazisban

		if($formatum===true){

			db::futat("select uid from users where email='%s'",$p['meghivo']);

			if(db::$sorok!==0){

				$OLDAL[]=hiba_uzi('Sajn�lom, de m�r valaki haszn�lja az �ltalad megadott email c�met!');

				$formatum=false;

			}			

		}

		

		//ha minden leellen�rizve mehet e r�gz�t�s

		if($formatum===true){

			

			//mentjuk a meghivotablaba

			$sql="insert into meghivo(uid,feltolt,email,datum) values(%d,%f,'%s',now())";

			db::futat($sql,$USER['uid'],$USER['feltolt'],$p['meghivo']);

			

			//mentjuk a regtablaba is.....

			$ellenor=veletlen_ellenor();

			$sql="insert into regisztral(uid,date,type,tema,ellenor) values('%d','%d','meghivo','%d','%s')";

			db::futat($sql,$USER['uid'],time(),db::$id,md5($ellenor));

			

			//mehet meg az email

			$mailAdat=array('mail'=>$p['meghivo'],'nev'=>$USER['name'],'ellenor'=>$ellenor);

			$text=meghivo_mail($mailAdat);

			

			//email kik�ld�se
			/*
			$m_subject = Oldal_neve." - megh�v�";

			$m_headers  = "From: ".Oldal_vakmail."\r\nContent-type: text/html\r\n";			

			mail($p['meghivo'], $m_subject, $text, $m_headers);
			*/
			
			require_once( CLASS_DIR . 'mailer.class.php');
			$mail=new Mailer();
			$mail->address= $p['meghivo'];
			$mail->body= $text;
			$mail->subject= OLDAL_NEVE." - megh�v�";	
			if( $mail->send() == true ){
				$_SESSION['uzenet']=nyugta('A megh�v�t kik�ldt�k!');
			}
			else{
				$_SESSION['uzenet']=hiba_uzi('Kik�ld�si hiba! K�rlek jelezd a staffnak!');
			}
			

			//vege

			

			header('Location: meghivo.php');

			exit;

		}		

	}	

}



db::futat("select cim,text,cid from cikk where cid='32'");

$segedlet=array();

foreach(db::elso_sor() as $key=>$val){

	$segedlet[$key]=($key=='text')? bb::bbdecode($val) : $val;

}



$smarty->assign('meghivotext',$segedlet);
$smarty->assign('OLDAL',$OLDAL);

$smarty->display('meghivo.tpl');

ob_end_flush ();

?>