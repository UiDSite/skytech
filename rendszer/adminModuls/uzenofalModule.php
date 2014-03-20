<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN!=951 ) die('Hozz�f�r�s megtagadva');

switch($r['modul'])	{
	
	case 'uzenofal':
		
		$smarty->assign('modul','uzenofal');	
		$smarty->assign('modulnev','�zen�fal');	
		
		$data=array();
		db::futat("select cim,text,cid,mod_user,mod_date from cikk where mihez='uzifal' order by mod_date desc ");
		foreach( db::tomb() as $i=>$row){
			
			foreach($row as $key=>$val){
				$data[$i][$key]=($key=='text')? bb::bbdecode($val) : $val ;
			}
			$data[$i]['mod_user_name']=User::getNameById($row['mod_user']);
		}
		$smarty->assign('data',$data);	
	
	break;
	
	case 'uzenofal_uj':
		$smarty->assign('modul','uzenofal_uj');	
		$smarty->assign('modulnev','�j bejegyz�s l�trehoz�sa');
		
	
	break;
	
	case 'uzenofal_mod':
		$smarty->assign('modul','uzenofal_uj');	
		$smarty->assign('modulnev','Bejegyz�s szereszt�se');
		
		$modId=(int)$g['id'];
		$doc=new Doc();
		$smarty->assign('data', $doc->getById( $modId ) );
		
	break;
	
	
	case 'uzenofal_save':
		
		$doc= new Doc();	
		
		$data['cim']=$p['cim'];
		$data['text']=$p['text'];
		$data['mihez']='uzifal';
		$data['mod_user']=$USER['uid'];
		$data['mod_date']=date('Y-m-d H:i:s');
		
		
		$modId=(int)$p['id'];
		
		if(!empty($modId)){
			logs::sysLog( 'uzenofal' , 'uzenofal modositas', 'docId='. $modId  );
			$doc->update( array('cid'=>$modId),$data);
		}
		else{
			logs::sysLog( 'uzenofal' , '�j uzenofal', 'cim='. $p['cim']  );
			$doc->add($data);
		}

		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=uzenofal");
		exit;
	
	break;
	
	case 'uzenofal_del':
		$doc= new Doc();
		$modId=(int)$g['id'];
		
		logs::sysLog( 'uzenofal' , 'uzenofal t�rl�s', 'docId='. $modId  );
		$doc->del(  array('cid'=>$modId) );
		

		$_SESSION['uzenet']=nyugta('A m�velet sikeres');
		header("Location:". $_SERVER['SCRIPT_NAME'] ."?modul=uzenofal");
		exit;		
	break;
	
	
	
}
?>