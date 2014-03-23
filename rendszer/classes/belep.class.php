<?php
if(!defined('SZINT1') || SZINT1!==666 ) die('Hozz�f�r�s megtagadva'); //oszt�ly biztons�g
 
//auth oszaly rev 2 :)
class belep{

	function  __construct(){				
		return call_user_func(array($this,'chek'));			
	}

	function chek(){
		global $USER;
		if (!empty($USER['uid'])) {

			//timeout be�ll�t�sa
			$temp_suti=($USER['ip_ceck']===true)? Suti_elet : Suti_elet_bizt;
			
			//suti elet ellen�rz�s
			if($temp_suti > 0 && !empty($USER['timestamp']) ) {				
				// time out sz�r�s
				if (($USER['timestamp'] + $temp_suti) < time() ) {
					$this->logout(HIBA_TIMEOUT);
					exit;
				}
				else{
					$USER['timestamp']=time();				
				}
				//hash lekerdezes
				if($USER['ip_ceck']===false){
					$hash=belep::getHash();					
				}
				else{
					$hash=belep::getHash( belep::getIp() );					
				}
				//stimmel e az adat�zisban
				db::futat("select uid from users where uid='%d' and sess_hash='%s'",$USER['uid'],$hash);
				if(db::$sorok!==1){
					belep::logout(HIBA_UJRA);
					exit;
				}
				else{
					//ok minden vizit rogzitese
					db::futat("update users set vizit='%d',ip='%s' where uid='%d'",time(),$_SERVER['REMOTE_ADDR'],$USER['uid']);

					//useradatok betoltes
					$userAdat=User::load($USER['uid']);
					foreach($userAdat as $key=>$val){
						$USER[$key]=$val;
					}
					
				//logs
					logs::user();
					return $this->jogosultsag();
				}
				
			}
			else{
				belep::logout('V�ratlan v�gzetes hiba!');
				exit;
			}
		}
		else{
			$this->logout(HIBA_NO_ID);
		}
	}
	
	function getHash($ip=''){		
		$sId=session_id();
		$bongeszo=$_SERVER['HTTP_USER_AGENT'];		
		return md5($sId.'a'.$ip.'a'.$bongeszo);		
	}
	
	function getIp(){
		$ip =$_SERVER['REMOTE_ADDR'] ;
		$ip.=(!empty($_SERVER['HTTP_VIA']) ? $_SERVER['HTTP_VIA'] : '');
		$ip.=(!empty($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : '' );
		return $ip;
	}

	function logout($cim=''){
		//az adatb�zisba is takar�tok
		db::futat("update users set sess_hash='kileptetve' where uid='%d' ",$GLOABLS['USER']['uid']);
		
		//suti takar�t�s
		setcookie(session_name(), '', 0, '/');
		unset($_COOKIE[session_name()]);
		unset($_COOKIE);
		
		//session takaritas
		$_SESSION = array();
		session_destroy();
		unset($_SESSION);
		
		//users takar�t�s
		$GLOBALS['USER']=array();
		unset($GLOBALS['USER']);
		
		if(!empty($cim)){			
			header('Location: belep.php?mod='.urlencode(base64_encode($cim)));
			exit;
		}
		else{
			header('Location: belep.php');
		}
		exit;
	}

	function login($name,$pass,$ip=true){

		//l�tezik e a felhaszn�l�i n�v
		db::futat("select uid from users where name='%s'",$name);
		if(db::$sorok!==1){
			logs::addFaildLogin( $name , $pass );
			belep::logout(HIBAS_NEV);
			exit;
		}

		//a jelsz� megfelel� e
		db::futat("select uid,statusz  from users where name='%s' and pass='%s'",$name,md5($name.$pass));
		$vUserData=db::tomb();
		$vUserData=$vUserData[0];

		if(db::$sorok!==1){
			logs::addFaildLogin( $name , $pass );
			belep::logout(HIBAS_JELSZO);
			exit;
		}
		//status ellenorzes
		switch($vUserData['statusz']){
			case 'aktiv':
				//h�t itt nincs mit tenni :)
			break;
			case 'uj':
				logs::addFaildLogin( $name , $pass );
				belep::logout(HIBA_MEGEROSITETLEN);
				exit;
			break;
			case 'torolt':
				logs::addFaildLogin( $name , $pass );
				belep::logout(HIBA_TOROLT_USER);
				exit;
			break;			
			default:
				logs::addFaildLogin( $name , $pass );
				belep::logout(HIBA_NINCS_STATUS);
				exit;
			break;		
		}

		//warm ellen�rzes
		$banText=Warn::getByUid($vUserData['uid'],'ban');		
		if($banText!==true){
			logs::addFaildLogin( $name , $pass );
			belep::logout("BAN:".$banText);
			exit;
		}

		//hiteles�t�ss megt�rt�nt		
		$userId=$vUserData['uid'];
		$_SESSION['uid']=$userId;
		
		//hasht elmentjuk a tov�bbi azonos�t�shoz
		if($ip===false){
			$hash=belep::getHash();
			$_SESSION['ip_ceck']=false;
		}
		else{
			$hash=belep::getHash( belep::getIp() );
			$_SESSION['ip_ceck']=true;
		}

		//belepes datuma rogzit�se
		$_SESSION['timestamp']=time();
	
	//hash rogzitese adatbazisba
		$sql="update users set sess_hash='%s' where uid='%d' ";
		db::futat($sql,$hash,$userId);
		
	//user adatok betoltese a sessinba
			$userAdat=User::load($_SESSION['uid']);
			foreach($userAdat as $key=>$val){
				$_SESSION[$key]=$val;
			}
		
		//pontok j�v��r�sa
		$pont=new Pont();
		$pont->addBelep();
		
			//atiranyitas a kezdooldalra
		$tovabb='index.php';
		header("Location:".$tovabb);
		exit;	
	}
	
	
	function jogosultsag(){
		
		$rang=(int)$GLOBALS['USER']['rang'];
		$oldal=strtoupper (str_replace( array('/','skytech','.php'),'',$_SERVER["REQUEST_URI"]) );
		$konst=@constant('JOG_'.$oldal);
		
		if($konst != NULL ){
			
			if( (int)$konst > $rang  ){
				
				$cim='404.php?ok='.urlencode('Az oldal megtekint�s�hez a legkisebb jog: ' . $GLOBALS['RANGOK'][(int)$konst]);
				header('location: '.$cim);
				exit;
			}
		
			
		}
		return;
	}

}//end class
?>