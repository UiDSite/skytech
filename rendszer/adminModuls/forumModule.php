<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN!=951 ) die('Hozz�f�r�s megtagadva');

switch($r['modul'])	{
	
	case 'temakor_lista':
		$smarty->assign('modul','temakor_lista');	
		$smarty->assign('modulnev','F�rum t�mak�r');
		
		
		$tema= new forumTema();	
		$topik=new forumTopik();
		
		$kesz=array();
		foreach($tema->getAll() as $i=>$row ){
			$kesz[$i]=$row;
			foreach($tema->getChilden($row['fid']) as $subRow ){
				$kesz[$i]['childen'][]= $topik->getById( $subRow['id'] );
			}
		}
		$smarty->assign('data',$kesz);
	
	break;
	
	case 'temakor_uj':
		$smarty->assign('modul','temakor_uj');	
		$smarty->assign('modulnev','�j f�rum t�mak�r');
	
	break;
	
	case 'temakor_mod':
		$smarty->assign('modul','temakor_uj');	
		$smarty->assign('modulnev','T�mak�r szereszt�se');
		
		$modId=(int)$g['id'];
		$tema= new forumTema();
		$smarty->assign('data', $tema->getById( $modId ) );
		
	break;
	
	
	case 'temakor_save':
		
		$tema= new forumTema();	
		
		$data['cim']=$p['cim'];
		$modId=(int)$p['id'];
		
		if(!empty($modId)){
			logs::sysLog( 'forum' , 'f�rum t�mak�r m�d', 'temaId='. $modId  );
			$tema->update( array('fid'=>$modId),$data);
		}
		else{
			logs::sysLog( 'forum' , '�j f�rum t�mak�r', 'temaCim='.$p['cim']  );
			$tema->add($data);
		}
		
		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=temakor_lista");
		exit;
	
	break;
	
	case 'temakor_del':
		$tema= new forumTema();
		$modId=(int)$g['id'];
		
		if( count( $tema->getChilden( $modId ) ) > 0 ){
			
			$_SESSION['uzenet']=hiba_uzi('A t�macsoport nem �res! ');
			header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=temakor_lista");
			exit;
		}
		logs::sysLog( 'forum' , 'f�rum t�mak�r t�rl�s', 'temaId='. $modId  );
		$tema->del(  array('fid'=>$modId) );

		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=temakor_lista");
		exit;		
	break;
	
	
	
	
	
	/*** TOPIC ***/
	
	
	case 'topik_uj':
		$tema= new forumTema();
		$smarty->assign('modul','topik_uj');	
		$smarty->assign('modulnev','�j topik');
		$smarty->assign('csoportok',$tema->getAll() );
		
	break;
	
	case 'topik_mod':
		$topik=new forumTopik();
		$tema= new forumTema();
		$smarty->assign('modul','topik_uj');	
		$smarty->assign('modulnev','Topik szerkeszt�s');
		$smarty->assign('csoportok',$tema->getAll() );
		
		$modId=(int)$g['id'];
		$smarty->assign('data', $topik->getById( $modId ) );
	
	
	
	break;
	
	
	case 'topik_save':
		$topik=new forumTopik();
	
		$data['tema']=		$p['tema'];
		$data['ismerteto']=	$p['ismerteto'];
		$data['fid']=		$p['csoport'];
		$data['status']=	$p['status'];
		$data['minrang']=	$p['minrang'];
		
		$modId=(int)$p['id'];
		
		if(!empty($modId)){
			logs::sysLog( 'forum' , 'f�rum topik m�d', 'topikId='. $modId  );
			$topik->update( array('tid'=>$modId),$data);
		}
		else{
			logs::sysLog( 'forum' , '�j f�rum topik ', 'topikC�m='. $p['tema'] );
			$topik->add($data);
		}
		
		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=temakor_lista");
		exit;
	break;
	
	case 'topik_del':
		$topik=new forumTopik();
		
		$modId=(int)$g['id'];
		logs::sysLog( 'forum' , 'f�rum topik del', 'topikId='. $modId  );
		$topik->del(  array('tid'=>$modId) );

		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=temakor_lista");
		exit;		
	break;
	
		
	




}
?>