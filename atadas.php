<?php
ob_start();
define('SZINT', 666);
require_once('rendszer/mag.php');
$belep = new belep();
$old = new old();


if(!empty($p['fogado_user']) && !empty($p['mennyiseg']) && is_numeric($p['mennyiseg'])) {
	$adhato = User::getMaxAtadas($USER['uid']);
	$igeny = $p['mennyiseg'] * (($p['egyseg'] == 'mb') ? 1024 * 1024 : 1024 * 1024 * 1024);

	if($adhato === false || $adhato < $igeny) {
		$OLDAL[] = hiba_uzi('K�relem elutas�tva, t�l sokat pr�b�lsz meg �tadni');
	} else {
		$fogado = User::getIdByName($p['fogado_user']);
		if(!is_numeric($fogado)) {
			$OLDAL[] = hiba_uzi('Nincs ilyen user�nk:' . $p['fogado_user']);
		} else {
			$sql = "INSERT INTO atadas (ado, fogado, mertek, datum) VALUES ('%d', '%d', '%f', NOW())";
			db::futat($sql, $USER['uid'], $fogado, $igeny);

			$sql = "UPDATE users SET feltolt = feltolt - (round(%f)) WHERE uid = '%d'";
			db::futat($sql, $igeny, $USER['uid']);

			$sql = "UPDATE users SET feltolt = feltolt + (round(%f)) WHERE uid = '%d'";
			db::futat($sql, $igeny, $fogado);

			$targy = 'Ar�nyj�v��r�st kapt�l';
			$torzs = $USER['name'] . ' felhaszn�l�nk ' . bytes_to_string($igeny) . ' -tal n�velte meg felt�lt�sedet.';
			level::felad($fogado, $USER['uid'], $targy, $torzs);

			$_SESSION['uzenet'] = nyugta('�tad�s sikeres');
			header('Location:atadas.php');
			exit;
		}
	}
}

$smarty->assign('max', User::getMaxAtadas($USER['uid']));
$smarty->assign('OLDAL', $OLDAL);
$smarty->display('atadas.tpl');
ob_end_flush();

?>
