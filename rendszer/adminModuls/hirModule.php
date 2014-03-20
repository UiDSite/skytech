<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN!=951 ) die('Hozz�f�r�s megtagadva');

switch($r['modul'])	{
	
	case 'hir_lista':
		$smarty->assign('modul','hir_lista');	
		$smarty->assign('modulnev','H�rek');
		
		
		$hir=new Hir();
		$hirek=$hir->getAll();
		foreach($hirek as $key=>$val){
			$hirek[$key]['text']=bb::bbdecode($val['text']);
		}
		$smarty->assign('data',$hirek );
	
	break;
	
	case 'hir_uj':
		$smarty->assign('modul','hir_uj');	
		$smarty->assign('modulnev','�j h�r l�trehoz�sa');
		$smarty->assign('data', array('datum'=>date('Y-m-d H:i:s')) );
	
	break;
	
	case 'hir_mod':
		$smarty->assign('modul','hir_uj');	
		$smarty->assign('modulnev','H�r szereszt�se');
		
		$modId=(int)$g['id'];
		$hir=new Hir();
		$smarty->assign('data', $hir->getById( $modId ) );
		
	break;
	
	
	case 'hir_save':
		
		$hir= new Hir();	
		
		$data['cim']=$p['cim'];
		$data['text']=$p['text'];
		$data['datum']=$p['datum'];
		$data['disp']=$p['disp'];

		$modId=(int)$p['id'];
		
		if(!empty($modId)){
			logs::sysLog( 'hir' , 'hir m�d', 'hirId='. $modId  );
			$hir->update( array('hid'=>$modId),$data);
		}
		else{
			logs::sysLog( 'hir' , 'hir �j', 'hirC�m='. $p['cim']  );
			$hir->add($data);
		}
		
		Cache::set( CACHE_HIREK );
		
		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=hir_lista");
		exit;
	
	break;
	
	case 'hir_del':
		$hir= new Hir();
		$modId=(int)$g['id'];
		
		logs::sysLog( 'hir' , 'hir t�r�l', 'hirId='. $modId  );
		$hir->del(  array('hid'=>$modId) );

		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=hir_lista");
		exit;		
	break;
	
	
	
}
?>