{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
{foreach from=$OLDAL key=i item=ertek}{$ertek}<br />{/foreach}
	
	<form action="profil.php" method="post">
	
	
	{'Szem�lyes be�ll�t�sok'|section_open}
		<table class="settings_sheet">
			<tr>
				<td class="left">PM-ek fogad�sa:</td>
				<td class="right">			
					{html_radios name='privat' options=$privat_uzi selected=$privat_uzi_old separator='&nbsp;'}
				</td>
			</tr>
			<tr>
				<td class="left">Nemed:</td>
				<td class="right">
					{html_radios name='nemed' options=$nem selected=$nem_old separator='&nbsp;'}				
				</td>
			</tr>
			<tr>
				<td class="left">Lak�helyed:</td>
				<td class="right">
					<label for="orszag">Orsz�g:</label>&nbsp;
					<select id="orszag" name="orszag" class="skinned">
						{html_options values=$orszag_ertek output=$orszag selected=$orszag_old}					
					</select>
					<label for="c14">V�ros/k�zs�g/falu:</label>&nbsp;<input type="text" id="c14" name="varos" value="{$varos_old}" size="22" class="skinned"/>&nbsp;
					<a href="http://www.frappr.com/?a=constellation_map&mapid=137440291277" target="_blank">Jel�ld be magad a t�rk�pen!</a>
				</td>
			</tr>
		</table>
	{'Szem�lyes be�ll�t�sok'|section_end}
	
	{'Avatarod'|section_open}
	<table>
		<tr>
			<td>
				<img id="avatar_kep" class="avatar" border="0" src="{$avatar_url}" alt="Avatarod"/>
			</td>
			<td class="avatardialog">
				�rd be az <span class="highlight">�j avatarod</span> URL-j�t, majd kattints az el�n�zet gombra:
				<br />
				<input id="avatar_url" class="skinned" type="text" name="avatar" value="{$avatar_text}" size="60"/>&nbsp;<a class="pic" href="#" id="avatarelol" title="El�n�zet"><img id="refreshavatar" border="0" src="kinezet/{$ipanel.smink}/refreshavatar.png" alt="El�n�zet"/></a><a class="pic" href="#" id="avatar_regi"  title="Jelenlegi vissza�ll�t�sa"><img id="restoreavatar" border="0" src="kinezet/{$ipanel.smink}/restoreavatar.png" alt="Jelenlegi vissza�ll�t�sa"/></a>
				<br />
				<br />
				<p class="justify">A k�ped ne legyen <span class="highlight">150</span> pixeln�l sz�lesebb, illetve <span class="highlight">300</span> pixeln�l magasabb. A t�mogatott form�tumok a k�vetkez�k: <span class="highlight">JPG</span>, <span class="highlight">GIF</span>, <span class="highlight">PNG</span>, <span class="highlight">BMP</span>. Avatarod ne tartalmazzon er�szakot, sz�ls�s�ges n�zeteket, pornogr�fi�t szeml�ltet� elemeket! Az avatar szab�lyok �th�g�s��rt <span class="highlight">kitilt�s</span> j�r!<br /><br />Ha nem megfelel� a k�ped m�rete, haszn�lj egy k�pszerkeszt� programot (pl. <a href="http://www.irfanview.com/" target="_blank">InfranView</a>) az �tm�retez�shez.</p>

				<div id="pre_warn" style="display: none"><br /><span class="red"><span class="italic">El�n�zet! Ment�s legalul!</span></span></div>
			</td>
		</tr>
	</table>
	{'Avatarod'|section_end}
	
	{'Alap�rtelemzet kateg�ri�k'|section_open}
		<div style="clear:both">
		{foreach from=$kategoriak item=k}
			<div style="width:20%;float:left;">
				<label for="kategoriak_{$k.id}">
					<input type="checkbox" class="skinned"  id="kategoriak_{$k.id}" name="kategoriak[]" value="{$k.id}" title="{$k.title}" {if $k.checked==true}checked="checked"{/if} />&nbsp;{$k.nev}
				</label>
			</div>
		{/foreach}
		</div>
		<br /><br /><br /><br /><br /><br />
	{'Alap�rtelemzet kateg�ri�k'|section_end}

	{'L�d�d tesztreszab�sa'|section_open}	
		A l�d�d c�me: <input class="skinned" type="text" name="ladad" value="{$ladad}" size="133"/>&nbsp;
		<br />
		<br />
		A l�d�d tartalma: (haszn�lhatsz <a href="bbcode_teszt.php" title="BB k�dok ismertet�je" target="_blank">BB k�dokat</a> �s <a href="smilies.php" title="Smileyk list�ja" target="_blank">smileykat</a> is, max 1024 karakter.)
		<br />
		
		{include file='bbcode.tpl'}
		<div class="textarea"><textarea name="ladad_text" id="box_content" rows="15" cols="144" style="width: 905px; height: 250px;">{$ladad_text}</textarea></div>
	{'L�d�d tesztreszab�sa'|section_end}
	
	
	
	
	{'Oldal be�ll�t�sai'|section_open}
		{html_checkboxes name='megjelen' options=$megjelen  selected=$megjelen_old separator='&nbsp;'}
		<br />
		<br />
		<label for="c5">Torrentek sz�ma egy oldalon:</label>&nbsp;<input type="text" id="c5" name="torrperold" value="{$perold.torr}" size="2" class="skinned"/>&nbsp;
		<label for="c6">Hozz�sz�l�sok sz�ma egy oldalon:</label>&nbsp;<input type="text" id="c6" name="hszperold" value="{$perold.hsz}" size="2" class="skinned"/>&nbsp;
		<label for="c20">Levelek sz�ma egy oldalon:</label>&nbsp;<input type="text" id="c20" name="mailperold" value="{$perold.mail}" size="2" class="skinned"/>&nbsp;
	
		<span class="small">&nbsp;A mez�kbe 10 �s 100 k�z�tti sz�mot �rhatsz.</span>
	{'Oldal be�ll�t�sai'|section_end}
	
	
	{* 'Oldal st�lus - Kattints a neked legink�bb tetsz�re!'|section_open}
	<table class="stylepreviews">

		<tr>
			{foreach from=$sminkek_tomb key=i item=smink}
			<td>
				<img class="stylepreview" border="0" src="kinezet/{$smink.ert}/style_preview.png" alt="{$smink.olv}" /><br /><br />
				<span class="highlight"><label for="smink_{$i}" ><input type="radio" name="smink" id="smink_{$i}" value="{$smink.ert}" {if $smink.check==true} checked="checked" {/if} />&nbsp;{$smink.olv}</label></span>
			</td>
			{/foreach}
		</tr>

	</table>
	{'Oldal st�lus - Kattints a neked legink�bb tetsz�re!'|section_end *}
	
	{*
	{'Alap�rtelmezett kateg�ri�k (ezek jelennek meg alapb�l a let�lt�s oldalon)'|section_open}
	<table  class="categories">
		<tr>

			<td>
				<ul class="categories_settings">
				</ul>
			</td>
			<td>
				<ul class="categories_settings">
				</ul>
			</td>
			<td>

				<ul class="categories_settings">
				</ul>
			</td>
			<td>
				<ul class="categories_settings">
				</ul>
			</td>
			<td>
				<ul class="categories_settings">

				</ul>
			</td>
			<td>
				<ul class="categories_settings">
				</ul>
			</td>
		</tr>
	</table>	
	{'Alap�rtelmezett kateg�ri�k (ezek jelennek meg alapb�l a let�lt�s oldalon)'|section_end}
	*}
	
	{'Biztons�gi �s fi�k be�ll�t�sok'|section_open}
	<table class="settings_sheet">
		<tr>
			<td class="left">e-mail c�med:</td>
			<td class="right">

				<input type="text" id="c15" name="email" value="{$email_cim}" size="54" class="skinned"/>&nbsp;
			</td>
		</tr>
		<tr>
			<td class="left"></td>
			<td class="right">
				<span class="small"><span class="red">Figyelem!</span> A jelenlegi �s az �j c�medre egyar�nt k�ld�nk meger�s�t� e-mailt. C�med <span class="hightlight">csak</span> akkor v�ltozik meg, ha mindk�t meger�s�t�st visszaigazolod a k�ld�tt levelekben l�v� hivatkoz�ssal!</span>

			</td>
		</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
		<tr>
			<td class="left">�j jelsz�:</td>
			<td class="right">

				<input type="password" id="c16" name="pw1" size="54" onkeyup="pw_sec_check('{$ipanel.name}','{$ipanel.smink}')" class="skinned"/>&nbsp;
			</td>
		</tr>
		<tr>
			<td class="left">Meger�s�t�s:</td>
			<td class="right">
				<input type="password" id="c17" name="pw2" size="54" onkeyup="pw_sec_check('{$ipanel.name}','{$ipanel.smink}')" class="skinned"/>&nbsp;
				<img id="pwflag1" border="0" src="kinezet/{$ipanel.smink}/pw_offline.png" alt=""/>

			</td>
		</tr>
		<tr>
			<td class="left">Jelsz� biztons�gi szintje:</td>
			<td class="right">
				<input type="text" id="pw_sec_lev" name="-" value="" size="54" disabled="disabled" class="skinned"/>&nbsp;
				<img id="pwflag2" border="0" src="kinezet/{$ipanel.smink}/pw_offline.png" alt=""/>
			</td>

		</tr>
		<tr>
			<td class="left"></td>
			<td class="right">
				<span class="small"><span class="red">Figyelem!</span> Jelenlegi e-mail c�medre meger�s�t� e-mailt k�ld�nk. Jelszavad <span class="hightlight">csak</span> akkor v�ltozik meg ha meg�rkezik a meger�s�t�s! Jelszavadnak minimum 5 karakter hossz�nak kell lennie! A "Jelsz� biztons�gi szintje" t�j�koztat� jelleg�! </span>
			</td>

		</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
		<tr>
			<td class="left">Passkey csere:</td>
			<td class="right">
				<input type="checkbox" id="c18" name="newpasskey" value="yes"/>&nbsp;<label for="c18">�j azonos�t�t (passkey-t) k�rek!</label>&nbsp;

			</td>
		</tr>
		<tr>
			<td class="left"></td>
			<td class="right">
				<span class="small"><span class="red">Figyelem!</span> Az azonos�t�d megv�ltoz�sa miatt minden le- illetve felt�lt�s alatt �ll� .torrent f�jlt �jra le kell t�ltened!</span>
			</td>

		</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
		<tr>
			<td class="left">Fi�k hibern�l�sa:</td>
			<td class="right">
				<input type="checkbox" id="c19" name="hibernate" value="yes"/>&nbsp;<label for="c19">Fi�kom hibern�l�st k�rem!</label>&nbsp;

			</td>
		</tr>
		<tr>
			<td class="left"></td>
			<td class="right">
				<span class="small"><span class="red">Figyelem!</span> Mialatt fi�kod hibern�lva van, nem f�rhetsz hozz�, csak ha feloldod. A felold�shoz a jelszavad sz�ks�ges. Ha a fi�kod hibern�lva van, h�rom h�nap inaktivit�s ut�n sem t�rli a rendszer.</span>
			</td>

		</tr>
	</table>
	{'Biztons�gi �s fi�k be�ll�t�sok'|section_end}
	
	{'Meger�s�t�s'|section_open}
		<div style="text-align:center">
			<span class="highlight"><span class="big">A v�ltoz�sok ment�s�hez k�rlek, �rd be a <span class="red">jelenlegi</span> jelszavad!</span></span>
			<div class="confirm"><input type="password" name="confirmation" size="22"/></div>
			<input  type="image"  border="0" src="kinezet/{$ipanel.smink}/btn_save.png" alt="Ment�s" class="profile_btn" />
			<img class="profile_btn" border="0" src="kinezet/{$ipanel.smink}/btn_cancel.png" alt="M�gsem" onclick="window.location='index.php'"/>
		</div>
	{'Meger�s�t�s'|section_end}
	</form>
</div>








<script language="javascript" src="scriptek/profil.js"></script>		

{* a labresz csatolasa *}
{include file='labresz.tpl'}