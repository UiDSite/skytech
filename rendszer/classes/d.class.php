<?php
if(!defined('SZINT1') || SZINT1 !== 666)
	die('Hozz�f�r�s megtagadva');

class d {
 	private static $text = '';
	private static $sub = "SkyTech MailDebug";
	
	public function addText($key, $val) {
		$call_info = array_shift(debug_backtrace());
		$code_line = $call_info['line'];
		$file = array_pop(explode('/', $call_info['file']));
		$uzi .= "Megh�vva:" . $file . "->" . $code_line . "\n";
		$uzi .= "V�ltoz�: " . $key . "\n";
		$uzi .= var_export($val, true);
		$uzi .= "\n=============================\n\n\n";
		self::$text .= $uzi;	
	}

	public function send($jog) {
		if(!empty(self::$text) && $jog === true) {
			mail(DEBUG_MAIL, self::$sub, self::$text);
			self::$text = '';
		}
	}
}

?>
