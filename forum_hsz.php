<?php
ob_start();
define('SZINT',666);
require_once('rendszer/mag.php');
$belep=new belep(); // user bel�p�s chek
$old=new old(); //oldalelemek bet�lt�se


$aktualis_oldal=$_SERVER["SCRIPT_NAME"]."?id=".$g['id']."&amp;page=".$g['page'];
$smarty->assign('oldal_cime',$aktualis_oldal);
$smarty->assign('oldal_id','forum.php?id='.$g['id']);
$smarty->assign('vissza','vissza='.$_SERVER["SCRIPT_NAME"]."?id=".$g['id']);

//az idezethez
if(!empty($p['idezet']) && is_numeric($p['idezet'])){
	db::futat("select  text from forum_hsz where hid='%d'",$p['idezet']);
	echo db::egy_ertek('text');
	exit;
}

//letoltes
if( !empty($g['letolt']) ){
	header("Content-Disposition: attachment; filename=\"levelek.txt\"");
	header("Content-Type: plain/text");
	$sql="select h.*,
		(select t.tema from forum_topik t where t.tid=h.tid ) as topik 
		from forum_hsz h where hid='%d'";
	
	db::futat($sql,$g['letolt']);
	$t=db::elso_sor();
	$u=User::load( $t['uid'] );
	
	echo Oldal_fejlec ."\r\n".Oldal_cime."\r\nF�rum hozz�sz�l�s\r\n\r\n";
	echo "Hozz�szol�s topikja:".$t['topik']."\r\n";
	echo "Hozz�sz�l�s szerz�je:".$u['name']."\r\n";
	echo "Hozz�sz�l�s ideje:".date('Y-m-d H:i:s',$t['datum'])."\r\n";
	echo "Hozz�sz�l�s:"."\r\n";
	echo $t['text']."\r\n";

	exit;
}

//ellen�rizz�k, hogy van olyn topik amit k�r az user
if(!is_numeric($g['id'])) $OLDAL[]=hiba_uzi('A k�rt topik nem l�tezik');
else{
	if(db::futat("select tema,ismerteto,tid,status,minrang from forum_topik where tid='%d'",$g['id'])===false) $OLDAL[]=hiba_uzi('A k�rt topik nem l�tezik');

	//minden ok indulhat a megjelen�t�s
	else{
		$topik=db::tomb();
		$smarty->assign('topik',array('tema'=>$topik[0]['tema'],'ismerteto'=>$topik[0]['ismerteto'],'tid'=>$topik[0]['tid'],'status'=>$topik[0]['status']));
		$topik_status=$topik[0]['status'];
		if($USER['rang']< $topik[0]['minrang']){
			$ujhsz=false;
		}else $ujhsz=true;
		
		if($USER['rang'] < JOG_FORUM_HOZZASZOLAS ) $ujhsz=false;
		$smarty->assign('ujhsz',$ujhsz);


		/************/
		/* R�gz�t�k */
		/************/		
		if( $topik[0]['status']=='n' || $USER['rang'] >= $topik[0]['minrang'] ){
		
			//miel�tt kilist�zn�nk a topik tartalm�t r�gz�tj�k, ha van mit.....
			if(!empty($p['text']) &&  empty($p['modmezo'])){
					
					$rogzit="insert into forum_hsz (tid,uid,text,datum) values('%d','%d','%s','%d')";
					if(db::futat($rogzit,$g['id'],$USER['uid'],$p['text'],time())===true){
						$_SESSION['uzenet']=nyugta('Hozz�sz�l�sodat r�gz�tett�k');
						header("Location:".$aktualis_oldal);
						exit;
					}
					else{
						$OLDAL[]=hiba_uzi('R�gz�t�si hiba! Pr�b�ld meg k�s�bb!');
					}
				
			}
			elseif($p['modmezo']=='mod' && is_numeric($p['modid']) ){
				$pari="update forum_hsz set text='%s' where hid='%d'";
				$modText="\n\n\n[admin]M�dos�totta:".$USER['name']."\nekkor:".date("Y.m.d H:i:s")."[/admin]";
				if(db::futat($pari,$p['text'].$modText,$p['modid'])===true){
					$_SESSION['uzenet']=nyugta('A m�dos�t�sokat r�gz�tett�k');
					header("Location:".$aktualis_oldal);
					exit;
				}			
				else $OLDAL[]=hiba_uzi('R�gz�t�si hiba! Pr�b�ld meg k�s�bb!');
			}
			elseif($p['modmezo']=='del' && is_numeric($p['modid']) && $USER['rang'] >= FORUM_ADMIN_MIN_RANG){
				$pari="delete from forum_hsz  where hid='%d'";
				if(db::futat($pari,$p['modid'])===true){
					$_SESSION['uzenet']=nyugta('A t�rl�s megt�rt�nt');
					header("Location:".$aktualis_oldal);
					exit;
				}
				else $OLDAL[]=hiba_uzi('Sikertelen t�rl�s! Pr�b�ld meg k�s�bb!');		
			}				
		}
		/************/
		/* Megjelen */
		/************/
		if($g['mod']=='mod' && is_numeric($g['mid']) ){
				db::futat("select text from forum_hsz where hid='%d'",$g['mid']);
				$tomb=db::tomb();	
				$smarty->assign('dat',$tomb[0]);
				$smarty->assign('modmezo','<input type="hidden" name="modmezo" value="mod" /><input type="hidden" name="modid" value="'.$g['mid'].'" />');
				$smarty->assign('fejlec','F�rum hozz�sz�l�s m�dos�t�sa');
				$smarty->assign('vezerlo','mod');
		}
		elseif($g['mod']=='del' && is_numeric($g['mid']) && $USER['rang']>= FORUM_ADMIN_MIN_RANG){			
				$smarty->assign('modmezo','<input type="hidden" name="modmezo" value="del" /><input type="hidden" name="modid" value="'.$g['mid'].'" />');
				$smarty->assign('fejlec','Hozz�sz�l�s t�rl�se');
				$smarty->assign('vezerlo','torol');
		}

		//mehet a hsz-ek list�z�sa
		$lapozo=new lapozo($_SERVER['REQUEST_URI'],$USER['perold'][1]);
		if(empty($g['keres'])){
			$pari="	select SQL_CALC_FOUND_ROWS  h.* from forum_hsz h 
				where h.tid='".$topik[0]['tid']."' order by h.hid desc limit ". $lapozo->limitalo();
		}
		else{
			$pari="	select SQL_CALC_FOUND_ROWS h.* from forum_hsz h 
				where h.tid='".$topik[0]['tid']."' and h.text like '%".$g['keres']."%' order by h.hid desc limit ". $lapozo->limitalo();
				$smarty->assign('keres_text',$g['keres']);
				$smarty->assign('keres_reset',$_SERVER['REQUEST_URI']);
		}

		db::futat($pari);
		$tomb=db::tomb();
		$hsz=array();
		foreach($tomb as $k=>$v){
			$uinfo=User::load( $v['uid'] );
			$hsz[$k]=$uinfo;			
			$hsz[$k]['datum']=date('Y.m.d H:i:s',$v['datum']);
			$hsz[$k]['text']=bb::bbdecode($v['text']);
			$hsz[$k]['hid']=$v['hid'];

			if($v['uid']==$USER['uid'] && $topik_status=='n'){
				$hsz[$k]['sajathsz']=true;
			}
		}
		$smarty->assign('hsz',$hsz);

		db::futat("SELECT FOUND_ROWS() as id");
		$lapozo->max=db::sor();
		$smarty->assign('lapozo',$lapozo->szamsor());
		$smarty->assign('betuvel',$lapozo->betuvel());
		$smarty->assign('selectbe',$lapozo->selectbe());

		//admin linkek be�ll�t�sa
		if($USER['rang'] >= FORUM_ADMIN_MIN_RANG ){
			$smarty->assign('admin_link','true');
		}
	}
}

$smarty->assign('OLDAL',$OLDAL);
$smarty->display('forum_hsz.tpl');
ob_end_flush ();
?>