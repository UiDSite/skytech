<?php
if(!defined('SZINT1') || SZINT1!==666 ) die('Hozz�f�r�s megtagadva'); //oszt�ly biztons�g 



class forumTema extends baseModel {

	protected $table='forum_csoport';
	protected $idName='fid';

	function getChilden( $id ){
		$sql="select tid as id from forum_topik  where " . $this->idName."='%d'";
		return db::getAll($sql,$id);	
	}
	



}//end class
?>