<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN!=951 ) die('Hozz�f�r�s megtagadva');

switch($r['modul'])	{
	
	case 'szavazas_lista':
		$smarty->assign('modul','szavazas_lista');	
		$smarty->assign('modulnev','Szavaz�sok');
		
		$szav=new Szavazas();
		$smarty->assign('szavazasok',$szav->getAll() );
	
	break;
	
	case 'szavazas_uj':
		$smarty->assign('modul','szavazas_uj');	
		$smarty->assign('modulnev','�j szavaz�s l�trehoz�sa');	
		$form[]=array("olv"=>"K�rd�s","id"=>"kerdes");
		for($i=1;$i<11;$i++){
			$form[]=array("olv"=>"V�lasz ".$i,"id"=>"valasz[".$i."]");
		}
		$smarty->assign('data',$form);		
	
	break;
	
	case 'szavazas_mod':
		
		$smarty->assign('modul','szavazas_uj');	
		$smarty->assign('modulnev','Szavaz�s szereszt�se');
		
	
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
		$smarty->assign('modId',$g['id']);
		
	break;
	
	
	case 'szavazas_save':
		
		if( !empty( $_POST['id'] ) && is_numeric( $_POST['id'] ) ){
			
			db::futat("update szavazas set cim='%s' where szid='%d'",$p['kerdes'],$p['id']);

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
					db::futat("insert into szavazas_elem(szid,text) values('%d','%s')",$p['id'],$v);
				}
			}				
			
			logs::sysLog( 'szavazas' , 'szavaz�s szerkeszt�se', 'szid='. $p['id']  );
		}
		else{
		
			db::futat("insert into szavazas(cim,datum) values('%s',now())",$p['kerdes']);
			$szavaz_id=db::$id;
			foreach($p['valasz'] as $v){
				if(!empty($v)){
					db::futat("insert into szavazas_elem(szid,text) values('%d','%s')",$szavaz_id,$v);
				}
			}
			
			logs::sysLog( 'szavazas' , 'szavaz�s l�trehoz�sa', 'szid='. $szavaz_id  );
		}		
		
		db::futat("select szid  from szavazas order by szid desc limit 0,1");
		$tomb=db::tomb();
		Cache::set( CACHE_AKTIV_SZAVAZAS, $tomb[0]['szid'] );
		
		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=szavazas_lista");
		exit;
	
	break;
	
	case 'szavazas_del':
		db::futat("delete from szavazas where szid='%d'",$g['id']);
		db::futat("delete from szavazas_elem where szid='%d'",$g['id']);
		db::futat("delete from szavazatok where szid='%d'",$g['id']);
		
		logs::sysLog( 'szavazas' , 'szavaz�s t�rl�se', 'szid='. $g['id']  );
		
		
		db::futat("select szid  from szavazas order by szid desc limit 0,1");
		$tomb=db::tomb();
		Cache::set( CACHE_AKTIV_SZAVAZAS, $tomb[0]['szid'] );
		
		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=szavazas_lista");
		exit;		
	break;
	
	
	
}
?>