<?php
if(!defined('SZINT1') || SZINT1 !== 666)
	die('Hozz�f�r�s megtagadva');

class forumTopik extends baseModel {
	protected $table = 'forum_topik';
	protected $idName = 'tid';
}

?>
