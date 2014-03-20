<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN!=951 ) die('Hozz�f�r�s megtagadva');

switch($r['modul'])	{
		
	case 'oldal_setting':
		$smarty->assign('modulnev','Oldal be�ll�t�sok');
		$smarty->assign('modul','var_setting');		
		$smarty->assign('vars',Vars::getByTypeMod('oldal'));		
	break;

	case 'tracker_setting':
		$smarty->assign('modulnev','Tracker be�ll�t�sok');
		$smarty->assign('modul','var_tracker_setting');
		$smarty->assign('vars',Vars::getByTypeMod('tracker'));
		$smarty->assign('rangok',$RANGOK);
	break;

	case 'cron_setting':
		$smarty->assign('modulnev','Cron be�ll�t�sok');
		$smarty->assign('modul','var_setting');
		$smarty->assign('vars',Vars::getByTypeMod('cron'));
	break;		
	
	case 'rang_setting':
		$smarty->assign('modulnev','Rang be�ll�t�sok');
		$smarty->assign('modul','var_setting');
		$smarty->assign('vars',Vars::getByTypeMod('rang'));
	break;
	
	case 'jog_setting':
		$smarty->assign('modulnev','Jogosults�g be�ll�t�sok');
		$smarty->assign('modul','var_setting');		
		$smarty->assign('vars',Vars::getByTypeMod('jog'));
		$smarty->assign('rangok',$RANGOK);
	break;

	case 'varsave':
		
		if(!empty($p['param'])){
			foreach($p['param'] as $key=>$val){
				if(!empty($val)){
					Vars::update($key,$val);
				}
			}
			Cache::set( CACHE_VALTOZOK );
			$_SESSION['uzenet']=nyugta('Ha l�tod ezt az �zit, akkor az oldal m�dos�t�sok nem okoztak v�gzetes hib�t :)');
			header('Location:'.$_SERVER['SCRIPT_NAME']);
			exit;		
		}
	break;	


	
	
}
?>