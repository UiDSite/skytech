<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se


/** staff dolgok **/
if( !empty($_POST['modul']) && $USER['rang'] >= STAFF_MAIL_MIN_RANG ){
require_once( CLASS_DIR . 'staff.class.php');
	switch( $_POST['modul'] ){
		case 'staffLevelBovebb':
			$levelId=$_POST['level'];
			$levelek[]= array_shift( Staff::loadLevel($levelId) );
			foreach( Staff::getChilden($levelId) as $row ) $levelek[]=$row;
			$smarty->assign('levelek', $levelek );
			
		break;
		case 'staffLevelTorol':
			$levelId=$_POST['level'];
			Staff::levelTorol($levelId);
			die();
		break;
	}
	
	$smarty->assign('modul', $_POST['modul'] );
	echo $smarty->fetch('staff_admin.tpl');
	die();
}

$vezerlo_kepek=array(
	array(
		'id'	=>'kis_level_valasz',
		'kep'	=>'m_reply_disabled.png',
		'alt'	=>'1',
		'title'	=>'V�laszolok!',
	),
	array(
		'id'	=>'kis_level_tovabb',
		'kep'	=>'m_forward_disabled.png',
		'alt'	=>'1',
		'title'	=>'Tov�bb�t�s',
	),
	array(
		'id'	=>'kis_level_megjel',
		'kep'	=>'m_mark_disabled.png',
		'alt'	=>'0',
		'title'	=>'Megjel�l�s m�dos�t�sa',
	),
	array(
		'id'	=>'kis_level_letolt',
		'kep'	=>'m_save_disabled.png',
		'alt'	=>'0',
		'title'	=>'Let�lt�s',
	),
	array(
		'id'	=>'kis_level_kukaba',
		'kep'	=>'m_movetotrash_disabled.png',
		'alt'	=>'0',
		'title'	=>'Szem�tbe vele!',
	)
);

$lista_fejlec=array(
	"erkezet"=>"�rkezet",
	"partner"=>"Felad�",
	"targy"=>"T�rgy",
);

if(!empty($g)){	
	if($g['mit']=='level_olvasott'){
		$mit=str_replace('fej_','',$g['lid']);
		$sql="update levelek set status='n' where status='u' and tulaj='%d' and lid='%d'";
		db::futat($sql,$USER['uid'],$mit);
		die(':-)');
	}	
	elseif($g['mit']=='bejovo_level'){
		$smarty->assign('tartalom',level::getBejovo());
		$smarty->assign('modul','lista');
	}
	elseif($g['mit']=='uj_level'){
		$smarty->assign('modul','uj');
	}
	elseif($g['mit']=='szemetes'){
		$smarty->assign('tartalom',level::getSzemetes());
		$smarty->assign('modul','lista');
		$vezerlo_kepek[4]['id']='kis_level_vegleges_torles';
		$vezerlo_kepek[4]['title']='V�gleges t�rl�s!!';
	}
	elseif($g['mit']=='kuldott_level'){
		$smarty->assign('tartalom',level::getKuldott());
		$smarty->assign('modul','lista');
		$vezerlo_kepek[0]['kep']='m_reply_unable.png';
		$vezerlo_kepek[0]['id']='';
		$vezerlo_kepek[0]['alt']='9';
		$lista_fejlec['erkezet']='Kik�ldve';
		$lista_fejlec['partner']='C�mzet';
	}
	elseif($g['mit']=='level_tovabb' && is_numeric($g['mid'])){
		$tomb=level::getLevel($g['mid']);
		$smarty->assign('tema','FW: '.$tomb['targy']);
		$smarty->assign('text',$tomb['torzs']);
		$smarty->assign('modul','uj');
	}
	elseif($g['mit']=='level_valasz' && is_numeric($g['mid'])){
		$tomb=level::getLevel($g['mid']);
		$tomb2=level::getLevel($g['mid'],1);

		$torzs ="\n\n\n\n";
		$torzs.="&gt;&gt;�rkezet:".$tomb2['erkezet']."\n";
		$torzs.="&gt;&gt;Felad�:".$tomb2['partner']."\n";
		$torzs.="&gt;&gt;\n";
		$torzs.="&gt;&gt;".$tomb['torzs'];		

		$smarty->assign('tema','RE: '.$tomb['targy']);		
		$smarty->assign('text',$torzs);
		$smarty->assign('cimzet',$tomb2['partner']);
		$smarty->assign('modul','uj');
	}
if($USER['rang']>8) $smarty->assign('adminsor',1);
$smarty->assign('lista_fejlec',$lista_fejlec);	
$smarty->assign('vezerlo_kepek',$vezerlo_kepek);	
$smarty->assign('OLDAL',$OLDAL);
$smarty->display('level.tpl');
}
else{
	if(!empty($p['status']) && !empty($p['mid'])){
		$idk=explode(';',$p['mid']);
		foreach($idk as $id){			
			level::setLevelStatus($id,$p['status']);
		}	
	}
	elseif($p['letolt']==1 && !empty($p['mid'])){
		header("Content-Disposition: attachment; filename=\"levelek.txt\"");
		header("Content-Type: plain/text");

		$fajl=Oldal_fejlec ."\r\n".Oldal_cime."\r\n" . $USER['name'] ." levele(i)"."\r\n\r\n";
		$idk=explode(';',$p['mid']);
		foreach($idk as $id){			
			$tomb=level::getLevel($id,1);
			$tomb2=level::getLevel($id);
			$fajl.="\r\n"."\r\n"."\r\n"."\r\n";
			$fajl.="�rkezett: ".$tomb['erkezet']."\r\n";
			$fajl.="Felad�: ".$tomb['partner']."\r\n";
			$fajl.="T�rgy: ".$tomb['targy']."\r\n";
			$fajl.="==== ==== ==== ==== ===="."\r\n";
			$mit=array('<br/>','&gt;','\n');
			$mire=array("\r\n",'>',"\r\n");
			$fajl.=str_replace($mit,$mire,$tomb2['torzs'])."\r\n";
		}
		echo $fajl;		
	}
	elseif($p['jeloles']==1 && !empty($p['mid'])){
		$igen=array();
		$nem=array();
		$parok=explode(';',$p['mid']);
		foreach($parok as $val){
			$id=explode(',',$val);			
			if(is_numeric($id[0]) && $id[0]>0){
				if($id[1]==1) $igen[]=$id[0];
				else $nem[]=$id[0];				
			}				
		}
		level::setJeloltE($igen,true);
		level::setJeloltE($nem,false);	
	}
	elseif($p['torles']==1 && !empty($p['mid'])){
		$idk=explode(';',$p['mid']);
		foreach($idk as $id){			
			level::levelTorol($id);
		}	
	}
}
ob_end_flush ();
?>