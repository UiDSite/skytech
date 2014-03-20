{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}
		{$ertek}
	{/foreach}
	
	{'BB code teszt'|section_open}	
		{if !empty($teszt_text)}
			<div class="rights">
				{$teszt_text}
			</div>
			<br /><br />
		{/if}
		<form method="post" action="bbcode_teszt.php">		
			{include file='bbcode.tpl'}
			<div class="textarea"><textarea name="text" id="box_content" rows="15" cols="144" style="width: 905px; height: 250px;">{$text}</textarea></div>
			<div class='center'><input name="submit" value="Ok" type="image" src="kinezet/{$ipanel.smink}/btn_ok.png"/></div>
		<form>
	
	{'BB code teszt'|section_end}
	
	
	{*'BB code manual'|section_open}	
			<h2>{$segedlet.cim}</h2>
			<div class="rights">
				{$segedlet.text}
			</div>
			{if adminlink==true}
			<div class="right">
				[ <a href="dokumentacio.php?mit=bbhelp&mod=mod&id={$segedlet.cid}" >szerkeszt�s</a> ]
			</div>
			{/if}
	{'BB code manual'|section_end*}
	
	
	
	
	
		{'Mintak'|section_open}	
	<div align="center">
				  <div class="UserBox"><DIV ALIGN="center" CLASS="forUsers"><table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Vastag</p></td>
	</tr>

	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">A sz�veget vastagbet�ss� (bold-d�) alak�tja.</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[b]<i>Sz�veg</i>[/b]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[b]Ez egy vastag sz�veg.[/b]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>

		<td ><p class="left"><span style="font-weight:bold">Ez egy vastag sz�veg.</span></p></td>
	</tr>
		
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">D�lt</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">A sz�veget d�ltt� (italic-k�) alak�tja.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[i]<i>Sz�veg</i>[/i]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[i]Ez egy d�lt sz�veg.[/i]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><span style="font-style:italic">Ez egy d�lt sz�veg.</span></p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Al�h�z�s</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">A sz�veget al�h�zott� alak�tja.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[u]<i>Sz�veg</i>[/u]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[u]Ez egy al�h�zott sz�veg.[/u]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><span style="text-decoration:underline">Ez egy al�h�zott sz�veg.</span></p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Sz�n (els� v�ltozat)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Megv�ltoztatja a sz�veg sz�n�t.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[color=<i>sz�n</i>]<i>Sz�veg</i>[/color]</p></td>
	</tr>
	<tr>

		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[color=blue]Ez egy k�k sz�veg.[/color]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><span style="color:blue">Ez egy k�k sz�veg.</span></p></td>
	</tr>

		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">Haszn�ld az alap sz�neket, mert nem minden b�ng�sz� t�mogat minden sz�nt! (piros, k�k, s�rga, z�ld stb.)</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Sz�n (m�sodik v�ltozat)</p></td>

	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Megv�ltoztatja a sz�veg sz�n�t</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>

		<td><p class="left">[color=#<i>RGBk�d</i>]<i>Sz�veg</i>[/color]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[color=#ff0000]Ez v�r�s sz�n� sz�veg.[/color]</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><span style="color:#ff0000">Ez v�r�s sz�n� sz�veg.</span></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>

		<td><p class="left">6 decim�lis sz�mb�l kell �llnia az RGB-nek</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">M�ret</p></td>
	</tr>
	<tr>

		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Megv�ltoztatja a bet�k m�ret�t</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[size=<i>m�rt�k</i>]<i>sz�veg</i>[/size]</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[size=10pt]Ez a sz�veg '10pt' m�ret�.[/size]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>

		<td ><p class="left"><span style="font-size:10pt">Ez a sz�veg '10pt' m�ret�.</span></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left"><i>m�rt�k</i> lehet pixelben (px), vagy pointsban (pt) m�rt.</p></td>
	</tr>

	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Bet�t�pus</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Be�ll�tja a sz�veg bet�t�pus�t.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[font=<i>neve</i>]<i>Sz�veg</i>[/font]</p></td>
	</tr>
	<tr>

		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[font=Impact]Hell� mi&uacute;js&aacute;g ?[/font]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><span style="font-family:Impact">Hell� mi&uacute;js&aacute;g ?</span></p></td>
	</tr>

	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Link (1.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy linket.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[url]<i>Az URL</i>[/url]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[url]http://sky-t.eu/[/url]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><a href="http://anonym.to/?http://sky-t.eu/" target="_blank" class="bb-url">http://sky-t.eu/</a></p></td>
	</tr>
		<tr>

		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">Minden URL automatikus link lesz.</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Link (2.)</p></td>

	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy linket.</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>

		<td><p class="left">[url=<i>URL</i>]<i>Link sz�vege</i>[/url]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[url=http://sky-t.eu/]Sky-Tech[/url]</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><a href="http://anonym.to/?http://sky-t.eu/" target="_blank" class="bb-url">Sky-Tech</a></p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>

		<td colspan="2"><p class="tbl_colhead">e-mail (1.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy e-mail linket.</p></td>
	</tr>
	<tr>

		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[email]<i>A lev�lc�m</i>[/email]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[email]webmaster@sky-t.eu[/email]</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><a href="mailto:webmaster@sky-t.eu " class="bb-email">webmaster@sky-t.eu </a></p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>

		<td colspan="2"><p class="tbl_colhead">e-mail (2.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy e-mail linket.</p></td>
	</tr>
	<tr>

		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[email=<i>address</i>]<i>�rj nek�nk egy levelet!</i>[/email]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[email=webmaster@sky-t.eu]�rj nek�nk egy levelet![/email]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><a href="mailto:webmaster@sky-t.eu" class="bb-email">�rj nek�nk egy levelet!</a></p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Google keres�s</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy google keres�s linket.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[google]<i>A keresend� kulcsszavak</i>[/google]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[google]Pizza[/google]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><a href="http://www.google.com/search?hl=hu&q=Pizza" title="Google keres�s: Pizza" target="_blank" class="bb-url">pizza</a><sup><span style="font-size: 7pt;"><span style="color: #1645AE;">G</span><span style="color: #D62408;">o</span><span style="color: #EFBA00;">o</span><span style="color: #1645AE;">g</span><span style="color: #007D08;">l</span><span style="color: #D62408;">e</span></span></sup></p></td>

	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">Ne haszn�lj &amp; jelet a keresend� sz�vegben!</p></td>
	</tr>
	</table>
<br/>

<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">K�p (1.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy k�pet.</p></td>
	</tr>

	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[img=<i>URL</i>]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[img=http://kepfeltolto.hu/i/?57087]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><img border="0" src="http://kepfeltolto.hu/i/?57087" alt="http://kepfeltolto.hu/i/?57087" class="bb-image" /></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>

		<td><p class="left">A k�p csak <b>.gif</b>, <b>.jpg</b> vagy <b>.png</b> kiterjeszt�s� lehet!</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">

	<tr>
		<td colspan="2"><p class="tbl_colhead">K�p (2.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy k�pet.</p></td>
	</tr>

	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[img]<i>URL</i>[/img]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[img]http://kepfeltolto.hu/i/?57087[/img]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><img border="0" src="http://kepfeltolto.hu/i/?57087" alt="http://kepfeltolto.hu/i/?57087" class="bb-image" /></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>

		<td><p class="left">A k�p csak <b>.gif</b>, <b>.jpg</b> vagy <b>.png</b> kiterjeszt�s� lehet!</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">

	<tr>
		<td colspan="2"><p class="tbl_colhead">K�p (3.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r fix sz�less�g� egy k�pet.</p></td>
	</tr>

	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[imgw=<i>URL</i>]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[imgw=vmi]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><img border="0" width="550" src="Link" alt="link" class="bb-image"/><br/><span class="small">Ez egy �tm�retezett k�p, <a class="browser" href="link" target="_blank">kattints ide</a> az eredeti m�retben val� megjelen�t�s�hez.</span></p></td>
	</tr>

		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">A k�p csak <b>.gif</b>, <b>.jpg</b> vagy <b>.png</b> kiterjeszt�s� lehet!</p></td>
	</tr>

	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">K�p (4.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r fix sz�less�g� egy k�pet.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[imgw]<i>URL</i>[/img]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[imgw]Link[/imgw]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><img border="0" width="550" src="Link" alt="Link" class="bb-image"/><br/><span class="small">Ez egy �tm�retezett k�p, <a class="browser" href="Link" target="_blank">kattints ide</a> az eredeti m�retben val� megjelen�t�s�hez.</span></p></td>
	</tr>

		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">A k�p csak <b>.gif</b>, <b>.jpg</b> vagy <b>.png</b> kiterjeszt�s� lehet!</p></td>
	</tr>

	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">K�p (5.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy fix m�ret� k�pet.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[imgx='szeles'x'magas']<i>URL</i>[/imgx]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[imgx=400x20]Link[/imgx]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><img border="0" width="400" height="20" src="Link" alt="Link" class="bb-image" /></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>

		<td><p class="left">A k�p csak <b>.gif</b>, <b>.jpg</b> vagy <b>.png</b> kiterjeszt�s� lehet!</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">

	<tr>
		<td colspan="2"><p class="tbl_colhead">Id�zet (1.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy id�zetet.</p></td>
	</tr>

	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[quote]<i>Id�zet</i>[/quote]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[quote]Ilyen egy idezet....[/quote]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><div><p class="left"><b>Id�zet:</b></p><div class="bb-quote">Ilyen egy idezet....</div></div></p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Id�zet (2.)</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy id�zetet.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[quote=<i>Id�zett ember</i>]<i>Id�zett sz�veg</i>[/quote]</p></td>
	</tr>
	<tr>

		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[quote=Dzs� b�csi]Id�zet sz�vege.[/quote]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><div>
		    <p class="left"><b>Barbara &iacute;rta:</b></p><div class="bb-quote">Id�zet sz�vege.</div></div></p></td>

	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Lista</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>

		<td><p class="left">Besz�r egy list�t.</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[*]<i>Sz�veg</i></p></td>
	</tr>
	<tr>

		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[*]Els� sor<br/>[*]M�sodik sor</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left">&bull;&nbsp;Els� sor<br/>&bull;&nbsp;M�sodik sor</p></td>

	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Youtube video</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>

		<td><p class="left">Besz�r egy youtube videot.</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[youtube]<i>youtube video azonosito</i>[/youtube]</p></td>
	</tr>

	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[youtube]UBecXMTU2v4[/youtube]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><div align="center"><object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="flash" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="610" height="502"><param name="movie" value="http://www.youtube.com/v/UBecXMTU2v4" ><param name="quality" value="High"><param name="allowScriptAccess" value="never" /><param name="wmode" value="transparent" /><param name="bgcolor" value="#616161" /><embed allowScriptAccess="never" src="http://www.youtube.com/v/UBecXMTU2v4" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="flash" wmode="transparent" width="610" height="502"></object></div></p></td>

	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">Csak �s kiz�r�lag a 11 jegy&#369; video azonos�t�t kell be�rni se nem t�bbet, se kevesebbet!</p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Youtube video</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy youtube videot.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[youtube=youtube_video_azonosito]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[youtube=orSb10O_Bg8]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><div align="center"><object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="flash" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="610" height="502"><param name="movie" value="http://www.youtube.com/v/orSb10O_Bg8" ><param name="quality" value="High"><param name="allowScriptAccess" value="never" /><param name="wmode" value="transparent" /><param name="bgcolor" value="#616161" /><embed allowScriptAccess="never" src="http://www.youtube.com/v/orSb10O_Bg8" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="flash" wmode="transparent" width="610" height="502"></object></div></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>

		<td><p class="left">Csak �s kiz�r�lag a 11 jegy&#369; video azonos�t�t kell be�rni se nem t�bbet, se kevesebbet!</p></td>
	</tr>
	</table>
<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Youtube video</p></td>
	</tr>

	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy youtube videot ami 200 pixel sz�les �s 150 pixel magas lesz.</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[youtube=200x150]<i>youtube video azonosito</i>[/youtube]</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>
		<td><p class="left">[youtube=200x150]Rh7qwF23ijI[/youtube]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>

		<td ><p class="left"><div align="center"><object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="flash" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="200" height="150"><param name="movie" value="http://www.youtube.com/v/Rh7qwF23ijI"><param name="allowScriptAccess" value="never" /><param name="wmode" value="transparent" /><param name="quality" value="High"><param name="bgcolor" value="#616161" /><embed allowScriptAccess="never" src="http://www.youtube.com/v/Rh7qwF23ijI" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="flash" wmode="transparent" width="200" height="150"></object></div></p></td>
	</tr>
		<tr>
		<td><p class="left">&nbsp;Megjegyz�s:</p></td>
		<td><p class="left">Csak �s kiz�r�lag a 11 jegy&#369; video azonos�t�t kell be�rni se nem t�bbet, se kevesebbet!</p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Video</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy lej�tszhat� videot.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[wmp]<i>video url-je</i>[/wmp]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[wmp]Link[/wmp]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><div align="center"><object id="mediaPlayer" width="400" height="350" classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject"><param name="fileName" value="Link"><param name="animationatStart" value="true"><param name="transparentatStart" value="false"><param name="autoStart" value="false"><param name="showControls" value="true"><param name="stretchToFit" value="false"><param name="ShowStatusBar" value="false"><param name="loop" value="0"><embed type="application/x-mplayer2" pluginspage="http://microsoft.com/windows/mediaplayer/en/download/" src="Link" width="400" height="350" autostart="0" transparentatStart="0" showcontrols="1" stretchToFit="0" ShowStatusBar="0" loop="0"></embed>
  </object></div></p></td>
	</tr>
	</table>

<br/>
<table width="100%" style="border:1px; border-style:dashed;">
	<tr>
		<td colspan="2"><p class="tbl_colhead">Video</p></td>
	</tr>
	<tr>
		<td width="20%"><p class="left">&nbsp;Le�r�s</p></td>
		<td><p class="left">Besz�r egy lej�tszhat� videot, ami 250x200 pixelen fog megjelenni.</p></td>

	</tr>
	<tr>
		<td><p class="left">&nbsp;Haszn�lata:</p></td>
		<td><p class="left">[wmp=250x200]<i>video url-je</i>[/wmp]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;P�lda:</p></td>

		<td><p class="left">[wmp=250x200]Link[/wmp]</p></td>
	</tr>
	<tr>
		<td><p class="left">&nbsp;Eredm�ny:</p></td>
		<td ><p class="left"><div align="center"><object id="mediaPlayer" width="250" height="200" classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject"><param name="fileName" value="Link"><param name="animationatStart" value="true"><param name="transparentatStart" value="false"><param name="autoStart" value="false"><param name="showControls" value="true"><param name="stretchToFit" value="false"><param name="ShowStatusBar" value="false"><param name="loop" value="0"><embed type="application/x-mplayer2" pluginspage="http://microsoft.com/windows/mediaplayer/en/download/" src="Link" width="250" height="200" autostart="0" transparentatStart="0" showcontrols="1" stretchToFit="0" ShowStatusBar="0" loop="0"></embed>
  </object></div></p></td>
	</tr>
	</table>

<br/>
</div></div></div>
	{'Mintak'|section_end}
	
	
	
	
</div>
{* a labresz csatolasa *}
{include file='labresz.tpl'}