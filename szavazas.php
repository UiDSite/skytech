<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se

/**************/
/* R�gz�t�sek */
/**************/

if(!empty($p) && $USER['rang'] >= SZAVAZAS_ADMIN_MIN_RANG){

	// �j szavaz�s r�gz�t�se
	if($p['modmezo']=='uj'){
		if(db::futat("insert into szavazas(cim,datum) values('%s',now())",$p['kerdes'])===true){
			$szavaz_id=db::$id;
			foreach($p['valasz'] as $v){
				if(!empty($v)){
					db::futat("insert into szavazas_elem(szid,text) values('%d','%s')",$szavaz_id,$v);
				}
			}
			$_SESSION['uzenet']=nyugta('Az �j szavaz�s r�gz�t�s siker�lt');
			header("Location:".$p['vissza']);
			exit;
		}
		else{
			$OLDAL[]=hiba_uzi('A r�gz�t�s sikertelen :(');
		}
	}
	// m�dos�t�sok ment�se

	elseif($p['modmezo']=='mod' && is_numeric($p['modid'])){	

		if(!empty($p['kerdes'])){
			if(db::futat("update szavazas set cim='%s' where szid='%d'",$p['kerdes'],$p['modid'])===true){

				//a r�gi mez�k bej�r�sa
				foreach($p['regi'] as $key=>$val){
					// ha a r�gi mez� tartalma be van �ll�tva, akkor fel�l�rja a r�gi adatokat
					if(!empty($val)){
						db::futat("update szavazas_elem set text='%s' where sze_id='%d'",$val,$key);
					}
					// ha �res, akkor t�rli a szavaz�s elem�t �s a hozz�tatoz� voksokat is
					else{
						db::futat("delete from szavazas_elem where  sze_id='%d'",$key);
						db::futat("delete from szavazatok where sze_id='%d'",$key);
					}
				}		

				// az �j mez�k r�gz�t�se ha van tartalmuk
				foreach($p['valasz'] as $v){
					if(!empty($v)){
						db::futat("insert into szavazas_elem(szid,text) values('%d','%s')",$p['modid'],$v);
					}
				}				
				$_SESSION['uzenet']=nyugta('A m�dos�t�s siker�lt');
				header("Location:".$p['vissza']);
				exit;	
			}
			else{
				$OLDAL[]=hiba_uzi('A m�dos�t�s sikertelen');	
			}		
		}
		else{
			$OLDAL[]=hiba_uzi('A k�rd�s c�me nem volt kit�ltve ez�rt nem v�geztem m�veletet');
		}
	}

	// a szavaz�s t�rl�se
	elseif($p['modmezo']=='del' && is_numeric($p['modid'])){
		if(db::futat("delete from szavazas where szid='%d'",$p['modid'])===true){
			db::futat("delete from szavazas_elem where szid='%d'",$p['modid']);
			db::futat("delete from szavazatok where szid='%d'",$p['modid']);
			/*
			$_SESSION['uzenet']=nyugta('A t�rl�s siker�lt');
			header("Location:".$p['vissza']);
			exit;
			*/
			die('ok');
		}
		else{
			$OLDAL[]=hiba_uzi('A t�rl�s sikertelen');
		}
	}
}

/************************/
/* A szavaz�s m�veletek */
/************************/

if(!empty($g) && $USER['rang'] >= SZAVAZAS_ADMIN_MIN_RANG){

	//a form feldolgoz�ja
	$smarty->assign('feldolgozo',$_SERVER["SCRIPT_NAME"]);
	$smarty->assign('vissza',$g['vissza']);

	// �j szavaz�s l�trehoz�sa
	if($g['mit']=='uj'){
		//a form elemi
		$form[]=array("olv"=>"K�rd�s","id"=>"kerdes");
		for($i=1;$i<11;$i++){
			$form[]=array("olv"=>"V�lasz ".$i,"id"=>"valasz[".$i."]");
		}	
		$smarty->assign('form',$form);
		$smarty->assign('modmezo','<input type="hidden" name="modmezo" value="uj" />');
		$smarty->assign('fejlec','�j szvaz�s');
	}

	//szavaz�s m�dos�t�s
	elseif($g['mit']=='mod' && is_numeric($g['id'])){
		//szavazas c�me
		db::futat("select cim from szavazas where szid='%d'",$g['id']);
		$cim=db::tomb();
		$form[]=array("olv"=>"K�rd�s","id"=>"kerdes","val"=>$cim[0]['cim']);

		//mez�k �s neveik
		db::futat("select sze_id,text from szavazas_elem where szid='%d' order by szid",$g['id']);
		$tomb=db::tomb();

		//a megl�v� elemek felt�lt�se
		foreach($tomb as $i=>$elem){
			$form[]=array("olv"=>"V�lasz ".($i+1),"id"=>"regi[".$elem['sze_id']."]","val"=>$elem['text']);
		}

		//plusz mez�k 
		for($i=count($tomb);$i<11;$i++){
			$form[]=array("olv"=>"V�lasz ".$i,"id"=>"valasz[".$i."]");
		}	

		$smarty->assign('form',$form);
		$smarty->assign('modmezo','<input type="hidden" name="modmezo" value="mod" /><input type="hidden" name="modid" value="'.$g['id'].'" />');
		$smarty->assign('fejlec','Szavaz�s m�dos�t�sa');
	}

	// szavaz�s m�dos�t�sa
	elseif($g['mit']=='del' && is_numeric($g['id'])){
		$smarty->assign('modmezo','<input type="hidden" name="modmezo" value="del" /><input type="hidden" name="modid" value="'.$g['id'].'" />');
		$smarty->assign('fejlec','Szavaz�s t�rl�se');
	}
	else{
		$OLDAL[]=hiba_uzi('Vak v�g�ny :(');		
	}
}

//szavaz�sok list�ja
else{
	//csak az utols� 15 szavz�st jelen�tem csak meg, ha ig�ny van r� akkor majd �ll�tunk rajta.
	db::futat("select szid,cim,datum from szavazas order by szid desc limit 0,15");
	$tomb=db::tomb();
	$szavazasok=array();
	foreach($tomb as $i=>$elem){
		$szavazasok[$i]['cim']=$elem['cim'];
		$szavazasok[$i]['datum']=$elem['datum'];
		$szavazasok[$i]['text']=$old->szavazas_eredmeny($elem['szid']);
		if($USER['rang'] >= SZAVAZAS_ADMIN_MIN_RANG){
			$szavazasok[$i]['link']='<a href="szavazas.php?mit=mod&id='.$elem['szid'].'">Szavaz�s szerkeszt�se</a> &bull; ';
			$szavazasok[$i]['link'].='<a href="szavazas.php?mit=del&id='.$elem['szid'].'"class="szavaztorol" alt="'.$elem['szid'].'">Szavaz�s t�rl�se</a> &bull; ';
			$szavazasok[$i]['link'].='<a href="szavazas.php?mit=uj">�j szavaz�s</a>';
		}		
	}	
	$smarty->assign('szavazasok',$szavazasok);
}

$smarty->assign('OLDAL',$OLDAL);
$smarty->display('szavazas.tpl');
ob_end_flush ();
?>