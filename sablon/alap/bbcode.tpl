{* ez a sablon felel bbcode bevitel��rt *}

<script language="javascript" type="text/javascript">
var  textarea_id='box_content', theme='{$ipanel.smink}';
</script>
<script language="javascript" src="scriptek/bbcode.js" type="text/javascript"></script>
<div class="bbtoolbar">
	<div class="bbtoolbar_left"></div>
	<div class="bbtoolbar_cell">
		<select size="1" name="size" id="sizes">
			<option value="8pt">8</option>

			<option value="9pt">9</option>
			<option value="10pt" selected="selected">10</option>
			<option value="12pt">12</option>
			<option value="14pt">14</option>
			<option value="16pt">16</option>
			<option value="18pt">18</option>

			<option value="20pt">20</option>
			<option value="22pt">22</option>
			<option value="24pt">24</option>
			<option value="30pt">30</option>
			<option value="36pt">36</option>
			<option value="48pt">48</option>

			<option value="72pt">72</option>
		</select>
	</div>
	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_size.png" alt="Bet�m�ret" title="Bet�m�ret" id="size" onclick="javascript: addbbm('size')"/></div>
	<div class="bbtoolbar_separator"></div>
	<div class="bbtoolbar_cell">
		<select size="1" name="color" id="colors">
			<option style="background-color: black; color: black;" value="black" selected="selected">Fekete</option>

			<option style="background-color: white; color: white;" value="white">Feh�r</option>
			<option style="background-color: green; color: green;" value="green">Z�ld</option>
			<option style="background-color: maroon; color: maroon;" value="maroon">Gesztenye</option>
			<option style="background-color: olive; color: olive;" value="olive">Oliva</option>
			<option style="background-color: navy; color: navy;" value="navy">M�lyk�k</option>
			<option style="background-color: purple; color: purple;" value="purple">Lila</option>

			<option style="background-color: gray; color: gray;" value="gray">Sz�rke</option>
			<option style="background-color: yellow; color: yellow;" value="yellow">S�rga</option>
			<option style="background-color: lime; color: lime;" value="lime">Lime</option>
			<option style="background-color: aqua; color: aqua;" value="aqua">Ci�n</option>
			<option style="background-color: fuchsia; color: fuchsia;" value="fuchsia">Cikl�men</option>
			<option style="background-color: silver; color: silver;" value="silver">Ez�st</option>

			<option style="background-color: red; color: red;" value="red">Piros</option>
			<option style="background-color: blue; color: blue;" value="blue">K�k</option>
			<option style="background-color: teal; color: teal;" value="teal">P�vak�k</option>
		</select>
	</div>
	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_color.png" alt="Bet�sz�n" title="Bet�sz�n" id="color" onclick="javascript: addbbm('color')"/></div>
	<div class="bbtoolbar_separator"></div>

	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_bold.png" alt="F�lk�v�r" title="F�lk�v�r" id="bold" onclick="javascript: addbbm('bold')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_italic.png" alt="D�lt" title="D�lt" id="italic" onclick="javascript: addbbm('italic')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_underline.png" alt="Al�h�zott" title="Al�h�zott" id="underline" onclick="javascript: addbbm('underline')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_overline.png" alt="F�l�h�zott" title="F�l�h�zott" id="overline" onclick="javascript: addbbm('overline')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_linetrough.png" alt="�th�zott" title="�th�zott" id="linetrough" onclick="javascript: addbbm('linetrough')"/></div>
	<div class="bbtoolbar_separator"></div>
	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_alignleft.png" alt="Balra z�rt" title="Balra z�rt" id="alignleft" onclick="javascript: addbbm('alignleft')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_aligncenter.png" alt="K�z�pre z�rt" title="K�z�pre z�rt" id="aligncenter" onclick="javascript: addbbm('aligncenter')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_alignright.png" alt="Jobbra z�rt" title="Jobbra z�rt" id="alignright" onclick="javascript: addbbm('alignright')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_alignjustify.png" alt="Sorkiz�rt" title="Sorkiz�rt" id="alignjustify" onclick="javascript: addbbm('alignjustify')"/></div>
	<div class="bbtoolbar_separator"></div>
	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="Id�zet" title="Id�zet" id="quote" onclick="javascript: addbbm('quote')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_quote.png" alt="Id�zet" title="Id�zet"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="Id�zet" title="Id�zet" id="quote_w" onclick="javascript: addbbw('Az id�zet sz�vege:', 'quote')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_smilies.png"  class="thickbox kat" alt="smiley.php?TB_iframe=true&amp;height=500&amp;width=800" title="Hangulatjelek" id="smilies" /></div>
	<div class="bbtoolbar_separator"></div>
	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="Hivatkoz�s" title="Hivatkoz�s" id="url" onclick="javascript: addbbm('url')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_url.png" alt="Hivatkoz�s" title="Hivatkoz�s"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="Hivatkoz�s" title="Hivatkoz�s" id="url_w" onclick="javascript: addbbw('A k�v�nt hivatkoz�s:', 'url')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="e-mail" title="e-mail" id="mail" onclick="javascript: addbbm('mail')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_email.png" alt="e-mail" title="e-mail"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="e-mail" title="e-mail" id="mail_w" onclick="javascript: addbbw('A c�mzett e-mail c�me:', 'mail')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="Google keres�s" title="Google keres�s" id="google" onclick="javascript: addbbm('google')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_google.png" alt="Google keres�s" title="Google keres�s"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="Google keres�s" title="Google keres�s" id="google_w" onclick="javascript: addbbw('A keresend� kifejez�s:', 'google')"/></div>
	<div class="bbtoolbar_separator"></div>
	<div class="bbtoolbar_cell"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="K�p" title="K�p" id="picture" onclick="javascript: addbbm('picture')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_image.png" alt="K�p" title="K�p"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="K�p" title="K�p" id="picture_w" onclick="javascript: addbbw('A k�v�nt k�p URL-je:', 'picture')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="Adobe Flash" title="Adobe Flash" id="flash" onclick="javascript: addbbm('flash')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_flash.png" alt="Adobe Flash" title="Adobe Flash"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="Adobe Flash" title="Adobe Flash" id="flash_w" onclick="javascript: addbbw('A flash movie URL-je:', 'flash')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_manual.png" alt="Multim�dia" title="Multim�dia" id="media" onclick="javascript: addbbm('media')"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_media.png" alt="Multim�dia" title="Multim�dia"/><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_wizard.png" alt="Multim�dia" title="Multim�dia" id="media_w" onclick="javascript: addbbw('A m�diaf�jl URL-je:', 'media')"/></div>

	<div class="bbtoolbar_separator"></div>
	<div class="bbtoolbar_cell"><a class="pic" href="bbcode_teszt.php" target="_blank"><img border="0" src="kinezet/{$ipanel.smink}/bbtoolbar_help.png" alt="S�g�" title="S�g�"/></a></div>
	<div class="bbtoolbar_right"></div>
</div>
<script type="text/javascript">tb_init("img.thickbox");</script>