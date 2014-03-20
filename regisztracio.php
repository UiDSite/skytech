<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');

//ha van bej�v� regisztr�ci�s adat
if(!empty($_POST['nu_name']) || !empty($_POST['nu_email'])){
	$hiba=array(); //a hib�k list�ja!
	$pname=$_POST['nu_name'];
	$pemail=$_POST['nu_email'];

	//elfogad�sok	
	if($_POST['rules_read']!='OK' || $_POST['faq_read']!='OK' || $_POST['rights_read']!='OK' ) $hiba[0]='Minden dokumentumot el kell olvasni!';

	if(count($hiba)==0){
		//a bek�ld�tt mez� adatok
		if(strlen($pname)<4 || strlen($pname)>15) $hiba[1]='A felhaszn�l�i n�v hossza nem megfelel�(4-15 karakter k�z�ttinek kell lennie)!';
		if(strlen($pemail)<8 || strlen($pemail)>40) $hiba[2]='Az email c�m hossza nem megfelel�(8-40 karakter k�z�ttinek kell lennie)!';
	}

	if(count($hiba)==0){
		//az user nev alaposabb vizsg�lata		
		if(array_search($pname,$tiltott_nev)!==false) $hiba[20]='A kiv�lsztott n�v titl� list�n van';
		if(!ervenyes_nev($pname)) $hiba[20]='A kiv�lasztott n�v �rv�nytelen karaktereket tartalmaz! A neved csak az angol abc bet�it, �s sz�mokat tartalmazhat!';
		db::futat("select uid from users where name='%s'",$pname);
		if(db::$sorok!==0) $hiba[20]='Sajn�lom, de m�r valaki haszn�lja az �ltalad v�lasztott nevet!';
	}

	if(count($hiba)==0){
		//az email c�m alaposabb vizsg�lata		
		if(array_search($pemail,$tiltott_email)!==false) $hiba[30]='A kiv�lsztott email c�m titl� list�n van';
		if(!ervenyes_email($pemail)) $hiba[30]='A megadott e-mail c�m �rv�nytelen. Csak �gy tudsz regisztr�lni, ha egy �rv�nyes, m�k�d� e-mail c�met adsz meg!';
		db::futat("select uid from users where email='%s'",$pemail);
		if(db::$sorok!==0) $hiba[30]='Sajn�lom, de m�r valaki haszn�lja az �ltalad v�lasztott email c�met!';
	}

	//hib�k ki�r�sa �s �jra mindent!
	if(count($hiba)!=0){		
		$tomb['name']=$pname;
		$tomb['email']=$pemail;
		if(!empty($_SESSION['marad']) && $_SESSION['marad']===true){
			$tomb['marad']=true;
		}		
		$smarty->assign('hiba',$hiba);
		$smarty->assign('form_value',$tomb);
		$smarty->display('regisztracio.tpl');	
	}

	// minden adat rendben �s indul az adatr�gz�t�s �s mail kik�ld�s			
	else{
		//user adat rogz�t�s
		$vadat= veletlen_adat($pname);
		db::futat("insert into users (pass,tor_pass,name,email,statusz,reg_date) values('%s','%s','%s','%s','uj','%d')",$vadat['passhash'],$vadat['passkey'],$pname,$pemail,time());
		$uid=db::$id;
		$ellenor=veletlen_ellenor();

		//az ellen�rz� adatok rogz�t�se
		db::futat("insert into regisztral(uid,date,type,tema,ellenor) values('%d','%d','reg','','%s')",$uid,time(),md5($ellenor));

		//email kik�ld�se
		require_once( CLASS_DIR . 'mailer.class.php');
		if (sendEmail($pemail, $pname, OLDAL_NEVE." - regisztr�ci� meger�s�t�se", reg_mail(array('name'=>$pname,'pass'=>$vadat['password'],'ellenor'=>$ellenor))) )
			$mailUzi=uzi('Sikeres regisztr�ci�',"Gratul�lunk, sikeresen regisztr�ltad magad. Hamarosan egy meger�s�t� e-mail �rkezik az e-mail c�medre (<span class=\"highlight\">".$pemail."</span>). A meger�s�t�s ut�n bejelentkezhetsz. Amenniyben nem kapn�d meg a mailt, k�rlek jelezd a staff@sky-tech.hu c�men!");
		else
			$mailUzi=hiba_uzi('Sikertelen regisztr�ci�!<br />K�rlek jelezd a staff@sky-tech.hu -n');

		//ha meghivoval ker�lt be
		if(!empty($_SESSION['meghivo']) && is_numeric($_SESSION['meghivo']) ){
			db::futat("update meghivo set meghivott='%d' where mid='%d' ",$uid,$_SESSION['meghivo']);
			unset($_SESSION['meghivo']);
			unset($_SESSION['marad']);
		}

		//siker megjelen�t�se
		$smarty->assign('uzi',$mailUzi);
		$smarty->display('regisztracio.tpl');
	}	
}

//jelsz� eml�kesztelo  
elseif(!empty($_POST['new_pass_email'])){
	die('hehe');
	db::futat("select uid,name from users where email='%s'",$_POST['new_pass_email']);
	if(db::$sorok!=1){
		$smarty->assign('uzi',uzi('Hiba!',"A megadott e-mail c�m nincs regisztr�lva"));
	}
	else{
		$tomb=db::tomb();
		$ellenor=veletlen_ellenor();
		$pari="insert into regisztral(uid,date,type,ellenor) values('%d','%d','emlekeszteto','%s')";
		db::futat($pari,$tomb[0]['uid'],time(),md5($ellenor));

		//indul a mail
		sendEmail($_POSR['new_pass_email'], $_POSR['new_pass_email'], OLDAL_NEVE." - elfelejtett jelsz�", elfelejtet_jelszo_mail(array('name'=>$USER['name'],'ellenor'=>$ellenor)));
		$smarty->assign('uzi',uzi('Sikeres jelsz� eml�kesztet�',"Hamarosan egy meger�s�t� e-mail �rkezik az e-mail c�medre (<span class=\"highlight\">".$_POSR['new_pass_email']."</span>). A meger�s�t�s ut�n megkapod az �j v�letlen jelszavadat.<BR>".elfelejtet_jelszo_mail(array('name'=>$USER['name'],'ellenor'=>$ellenor))));
	}
}

// meger�s�t�s ellen�rz�s
elseif(!empty($_GET['mod'])){
	$gmod=as_md5($_GET['mod']);
	$hiba=0;

	//van e ilyen ellen�rz�
	if($hiba==0){
		db::futat("select r.type,r.date,r.tema,r.rid,r.uid,u.name from regisztral r left join users u on r.uid=u.uid where ellenor='%s'",md5($gmod));
		if(db::$sorok!=1){
			$smarty->assign('uzi',uzi('Hiba!',"Nem l�tezik k�r�s az adott ellen�rz� �sszeggel!"));
			$hiba++;
		}		
	}

	//lej�rt-e az ellen�rz�
	if($hiba==0){
		$tomb=db::tomb();
		$tomb=$tomb[0];
		if((time()-$tomb['date'])>(60*60*24*3)){
			db::futat("delete from regisztral where rid='%s'",$tomb['rid']);
			$smarty->assign('uzi',uzi('Hiba!',"A k�r�s h�rom napn�l r�gebbi, m�r nem haszn�lhat� fel!"));
			$hiba++;
		}
	}

	//minden leellen�rizve most mehetnek a r�gz�t�sek
	if($hiba==0){
		//regiszt�ci�
		if($tomb['type'] == 'reg') {
			db::futat("UPDATE users SET statusz='aktiv' WHERE `uid`='%d'", $tomb['uid']);			
			$smarty->assign('uzi',uzi('Sikeres meger�s�t�s!',"Felhaszn�l�i fi�kodat sikeresen meger�s�tett�k!"));

			
			db::futat(" select uid from user_data where uid='%d' ",$tomb['uid']);
			if( db::$sorok !=1 ){
				//�j user adatok rogzitese
				db::futat("insert into user_data(uid) values ('%d')",$tomb['uid']);
			}
		}

		//uj jelszo
		elseif($tomb['type'] == 'new_pass'){
			db::futat("update users set pass='%s' where uid='%d'",md5($tomb['name'].$tomb['tema']),$tomb['uid']);
			$smarty->assign('uzi',uzi('Sikeres meger�s�t�s!',"Jelszavadat sikeresen m�dos�tottuk!"));
		}

		//meghivo
		elseif($tomb['type']=='meghivo'){
			$sql="select email,mid from meghivo where mid=(select tema from regisztral where rid='%d')";
			db::futat($sql,$tomb['rid']);
			$tomb=db::tomb();
			$smarty->assign('form_value',array('email'=>$tomb[0]['email'],'marad'=>true));
			$_SESSION['meghivo']=$tomb[0]['mid'];
			$_SESSION['marad']=true;				
		}
		
		//jelszo emlekezteto
		elseif($tomb['type'] == 'emlekez'){
			db::futat("update users set pass='%s' where uid='%d'",md5($tomb['name'].$tomb['tema']),$tomb['uid']);
			$smarty->assign('uzi',uzi('Sikeres meger�s�t�s!',"Jelszavadat sikeresen m�dos�tottuk!"));
		}

		// az adott azonos�t� t�rl�se
		db::futat("delete from regisztral where rid='%s'",$tomb['rid']);
	}

	$smarty->display('regisztracio.tpl');
}

// alapb�l a regisztr�l� oldal
else{
	// a max user sz�m ellen�rz�se
	db::futat("SELECT count( * ) AS db FROM users WHERE statusz != 'delete' ");	
	if(db::egy_ertek('db')>Max_user){
		// hehe nincs reg :)
		$smarty->assign('uzi','Regisztr�ci� lez�rva, csak megh�v�val lehet beker�lni!');
	}

	// reg form kiir�sa
	$smarty->display('regisztracio.tpl');
}

ob_end_flush ();
?>