<tr id="nagy_{$t.tid}" {if $k is even}class="t_even"{else}class="t_odd"{/if}>
	<td class="t_icon">
		<a href="letolt.php?tipus={$t.kid}" title="{$t.leir}" class="pic">
			<img src="kinezet/{$ipanel.smink}/category_icons/{$t.kep}.png" alt="" border="0"/>
		</a>
	</td>
	<td class="t_name">
		<div class="t_name">
			<span class="tn_part1">
				<a href="#" rel="{$t.tid}"  title="{$t.name} -- B�vebb inform�ci��rt klikk ide!" class="torrent_link"> 
					{if $t.name|count_characters > 50}
						{$t.name|substring:1:50}...
					{else}
						{$t.name}
					{/if}
					{if $t.keres_id}
					&nbsp;[&nbsp;<a href="keresek.php?id={$t.keres_id}" >K�r�sre</a>&nbsp;]
					{/if}
				</a>
				<!--a href="letolt.php?ingyen=yes"  class="pic" style="display:{if $t.ingyen=='yes'}inline{else}none{/if};color:#ff0000;" id="ingyen_{$t.tid}">
					<span class="tooltip" title="Ingyenes torrent! Ezt a torrentet ha let�lt�d nem adja hozz� a let�lt�sedhez, csak a felt�lt�st sz�molja!">[Ingyenes]</span>
				</a-->
			</span>
			<div class="tn_part2">
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_bookmarkit.png" alt="{$t.tid}" style="display:{if $t.konyv>0}none{else}block{/if}" id="addk_{$t.tid}" class="addkonyv" title="Hozz�ad�s a k�nyvjelz�kh�z" />
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_delbookmark.png" alt="{$t.tid}" style="display:{if $t.konyv>0}block{else}none{/if}" id="delk_{$t.tid}" class="delkonyv" title="T�rl�s a k�nyvjelz�kb�l" />
			</div>
			<div class="tn_part3">
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_new.png" 						  			style="display:{if $t.uj_torrent==true}inline{else}none{/if}" class="flag_new" title="�j jelz�s(ek) elt�ntet�se." />
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_hidden.png"	id="hidden_{$t.tid}"		style="display: {if $t.hidden=='yes'}inline{else}none{/if};"  title="Rejtett torrent" />
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_locked.png" 	id="hsz_tiltva_{$t.tid}"	style="display:{if $t.hsz_lezarva=='yes'}inline{else}none{/if};"  title="Z�rolt hozz�sz�l�sok"/>
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_checked_0.png" id="noellen_{$t.tid}"		style="display:{if empty($t.admin_id)}inline{else}none;{/if};"  title="Ellen�rizetlen torrent"/>
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_checked_1.png" id="ellen_{$t.tid}"			style="display:{if !empty($t.admin_id) && empty($t.admin_megj)}inline{else}none{/if};"  title="A torrent megfelel a szab�lyoknak"/>
				<img border="0" src="kinezet/{$ipanel.smink}/torrent_checked_2.png" id="erellen_{$t.tid}"		style="display:{if !empty($t.admin_megj)}inline{else}none{/if};"  title="A torrent nem felel meg a szab�lyoknak"/>
				<a href="letolt.php?ingyen=yes" class="pic"><img border="0" src="kinezet/{$ipanel.smink}/torrent_free.png" style="display:{if $t.ingyen=='yes'}inline{else}none{/if}" id="ingyen_{$t.tid}"  title="Ingyen torrent" /></a>
			</div>
		</div>
	</td>
	<td class="t_down">
		<a href="letoltes.php?id={$t.tid}" title="Torrent let�lt�se" class="pic">
			<img border="0" src="kinezet/{$ipanel.smink}/torrent_download.png" alt="" title="Let�lt�s"/>
		</a>
	</td>
	<td class="t_meret">
		{$t.meret|b_to_s}
	</td>
	<td class="t_down">
		<a href="peerlista.php?id={$t.tid}" title="Peer lista megtekint�se">
			<span class="peers1">{$t.letoltve}</span>
		</a>
	</td>
	<td class="t_down">
		<a href="peerlista.php?id={$t.tid}" title="Peer lista megtekint�se">
			<span class="peers1">{$t.seed}</span>
		</a>
	</td>
	<td class="t_down">
		<a href="peerlista.php?id={$t.tid}" title="Peer lista megtekint�se">
			<span class="peers1">{$t.leech}</span>
		</a>
	</td>
	<td class="t_upby">
		<a title="Profil megtekint�se" href="userinfo.php?uid={$t.uid}">
			<span class="rank{$t.rang}">{$t.username}</span>
		</a>
	</td>
</tr>
<tr id="kicsi_{$t.tid}" style="display:none;">
	<td colspan="8" >
		<div class="t_info"  id="div_{$t.tid}" style="display:none;opacity:0;">
			{if $admin_panel==true}
			<div class="textlayer">
				<img src="kinezet/{$ipanel.smink}/t_edit.png" alt="" class="inline" border="0">&nbsp;<a  href="letolt_admin.php?modosit={$t.tid}">Szerkeszt�s</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_delete.png" alt="" class="inline" border="0">&nbsp;<a  href="{$t.tid}"  class="torrent_del">T�rl�s</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_hide.png" alt="" class="inline" border="0">&nbsp;<a  href="{$t.tid}" class="torrent_hidden" alt="{$t.hidden}">Torrent {if $t.hidden=='yes'}megjelen�t{else}elrejt{/if}</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_ingyen.gif" alt="" class="inline" border="0">&nbsp;<a  href="{$t.tid}" class="torrent_ingyen" alt="{$t.ingyen}">{if $t.ingyen=='yes'}Normal{else}Ingyen{/if} torrent</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_lock.png" alt="" class="inline" border="0">&nbsp;<a href="{$t.tid}"  {if $t.hsz_lezarva=='no'}class="hozzaszolas_letiltas">Hozz�sz�l�sok letilt�sa{else}class="hozzaszolas_enged">Hozz�sz�l�sok enged�lyez�se{/if}</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_check.png" alt="" class="inline" border="0">&nbsp;{if empty($t.adminname)}<a  href="{$t.tid}"  class="torrent_val" >Hitelesit</a>{else}Hiteles�tette:{$t.adminname}{/if}&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_modcomment.png" alt="" class="inline" border="0">&nbsp;<a  href="letolt_admin.php?komment={$t.tid}">Megjegyz�sek</a>
				{if $t.keres_id && $t.keres_jovairva == 'no'}
					<span><img src="kinezet/{$ipanel.smink}/t_check.png" alt="" class="inline" border="0">&nbsp;<a  href="{$t.tid}"  class="torrent_jovair" >Pont j�v��r�s</a><span>
				{/if}
			</div>
			{/if}
			<div class="textlayer">
				<img src="kinezet/{$ipanel.smink}/torrent_download.png" alt="" class="inline" border="0"/>&nbsp;<a href="letoltes.php?id={$t.tid}">Let�lt�s</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_nfo.png" alt="" class="inline" border="0">&nbsp;{if $t.nfo_name=='yes'}<a  href="{$t.tid}"   class="nfo_view" >NFO</a>{else}NFO nem el�rhet�{/if}&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_details.png" alt="" class="inline" border="0">&nbsp;<a  href="adatlap.php?id={$t.tid}">Adatlap</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_comments.png" alt="" class="inline" border="0">&nbsp;<a  href="adatlap.php?id={$t.tid}">Hozz�sz�l�sok ({$t.comment})</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_size.png" alt="" class="inline" border="0">&nbsp;M�ret: {$t.meret|b_to_s}&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_files.png" alt="" class="inline" border="0">&nbsp;<a class="torrent_files" href="{$t.tid}"  title="F�jlok megtekint�se">F�jlok sz�ma: {$t.fajldb}</a>&nbsp;&nbsp;
				<img src="kinezet/{$ipanel.smink}/t_datetime.png" alt="" class="inline" border="0">&nbsp;Felt�ltve: {$t.datum}
				{if $t.sajat_torrent==true && $admin_panel!=true}
					&nbsp;&nbsp;<img src="kinezet/{$ipanel.smink}/t_edit.png" alt="" class="inline" border="0">&nbsp;<a  href="letolt_admin.php?modosit={$t.tid}">Torrent szerkeszt�se</a>
				{/if}
			</div>
			<div class="textlayer" id="toltodiv_{$t.tid}" style="display:none;">								
				<br /><div class="center"><img src="kinezet/{$ipanel.smink}/loading.gif"  /></div><br />
			</div>
			
			<div   id="nfodiv_{$t.tid}" style="display:none;opacity:0;"></div>
			
			<div class="textlayer" id="tartalom_{$t.tid}">
				{if !empty($t.admin_megj)}
					<div id='admin_komment_{$t.tid}'>
						<h2>Moder�tori megjegyz�sek: 
						{if admin_panel==true}(<a  class="del" alt="{$t.tid}" href="#" title="Megjegyz�s t�rl�se">X</a>){/if}</h2>
						<div class="separator_left_long"></div><br>
						<div class="modcomment">{$t.admin_megj}
							<br><br><br><span style="font-style: italic;">�rta: <a  href="userinfo.php?uid={$t.admin_id}" >{$t.adminname}</a>, ekkor: {$t.admin_datum}.</span>
						</div>
						<br /><br />
					</div>
				{/if}
				
				<h2>Le�r�s:</h2>
				<div class="separator_left_long"></div>
					{if !empty($t.kep1) || !empty($t.kep2) || !empty($t.kep3)  }
					<div class="center">
						{if !empty($t.kep1)}
							<a href="{$t.kep1}" class="pic thickbox" target="_blank" rel="kepcsoport_{$t.tid}" ><img src="kinezet/{$ipanel.smink}/imgview.gif" border="0" /></a>
						{/if}
						{if !empty($t.kep2)}
							<a href="{$t.kep2}" class="pic thickbox" target="_blank" rel="kepcsoport_{$t.tid}" ><img src="kinezet/{$ipanel.smink}/imgview.gif" border="0" /></a>
						{/if}
						{if !empty($t.kep3)}
							<a href="{$t.kep3}" class="pic thickbox"target="_blank" rel="kepcsoport_{$t.tid}" ><img src="kinezet/{$ipanel.smink}/imgview.gif" border="0" /></a>
						{/if}
					</div><br />						
					{/if}
					{if !empty($t.megjelen) }
						<br />Megjelen�s:{$t.megjelen}
					{/if}
					{if !empty($t.honlap) }
						<br />Honlap:<a href="{$t.honlap}" target="_blank">{$t.honlap}</a>
					{/if}
					{if $t.eredeti=='y' }
						<br />Eredeti release 
					{/if}
					
				<br /><br />
				{$t.megjegyzes}
			</div>			
			<div class="center" style="padding-bottom: 15px; padding-top: 10px;">
				<a  href="#" rel="{$t.tid}" class="torrent_link_kep"><img src="kinezet/{$ipanel.smink}/t_closedetails.png" alt="" border="0"></a>
			</div>
			
		</div>						
	</td>
</tr>