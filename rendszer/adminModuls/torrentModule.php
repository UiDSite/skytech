<?php
if(!defined('SZINT_ADMIN') || SZINT_ADMIN!=951 ) die('Hozz�f�r�s megtagadva');

switch($r['modul'])	{

	case 'torrent_setting':
		$smarty->assign('modulnev','Torrent be�ll�t�sok');
		$smarty->assign('modul','torrent_setting');		
		$smarty->assign('kategoriak',kategoria::getForOption());	
	break;	

	case 'torrent_save'  :
		if( $SUPER_ADMIN_ALLAT == true ){
			
			switch(true){
				case $p['kategoria']=='mind':
					//ide egyenl�re nem j�nn semmi :)
					$where=' ';
				break;
				case is_numeric($p['kategoria']):
					$where= " where kid='".$p['kategoria']."'";
				break;
				default:
					$_SESSION['uzenet']=hiba_uzi('Nem volt kiv�lasztva kateg�ria');
					header('Location:'.$_SERVER['SCRIPT_NAME']);
					exit;	
				break;
			}		

			switch($p['feladat']){
				case 'ingyen_yes':
					$sql="update torrent set ingyen='yes' ".$where;
				break;
				case 'ingyen_no':
					$sql="update torrent set ingyen='no' ".$where;
				break;
				default:
					$_SESSION['uzenet']=hiba_uzi('Nem volt kiv�lasztva feladat');
					header('Location:'.$_SERVER['SCRIPT_NAME']);
					exit;	
				break;	
			}
			db::futat($sql);	
			$_SESSION['uzenet']=nyugta('Sikeres m�dos�t�sok!');
			header('Location:'.$_SERVER['SCRIPT_NAME']);
			exit;
		}		
	break;
}
?>