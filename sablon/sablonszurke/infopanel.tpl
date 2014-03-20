{* ez az infopanel �s az alatta l�v� div megjelen�t� *}
<script language="javascript">
var SMINK='{$ipanel.smink}';
var SECTION_COOKIE = '{$smarty.const.SECTION_COOKIE}';
var INFOPANEL_COOKIE = '{$smarty.const.INFOPANEL_COOKIE}';
</script>

	<div id="infopanel" style="overflow: visible; display: {$ipanel.display};">
		<ul>
			<li id="ip_myavatar">
				<div id="myavatarwrapper"><img id="myavatar" src="{$ipanel.avatar}" alt="Avatarom" title="Ugr�s a profilomhoz" onclick="window.location='userinfo.php?uid={$ipanel.uid}'" border="0" /></div>
			</li>
			<li id="ip_adataim">
				<div class="ip_title">�dv �jra!</div>
				<table>
					<tr>
	                	<td class="jel"><img src="kinezet/{$ipanel.smink}/ip_people.png" alt="Felhaszn�l� neved" title="Felhaszn�l� neved"border="0" height="27" width="22" ></td>
	                    <td class="nicknev"><span id="myname">{$ipanel.name}</span><br /><br /></td> 
					</tr>
					<tr>
	                	<td class="jel"><img src="kinezet/{$ipanel.smink}/ip_rank.png" alt="Rangod" title="Rangod" border="0" height="27" width="22" /></td>
	                    <td class="rang"><span id="myrank"><span class="rank{$ipanel.rang}">{$ipanel.rang_text}</span></span></td>
					</tr>
					<tr style="display:none;">
	                	<td class="jel"><img src="kinezet/{$ipanel.smink}/ip_rank.png" alt="Rangod" title="Rangod" border="0" height="27" width="22" /></td>
	                    <td class="rang">{$ipanel.pontok} Sky-Pont</td>
					</tr>
				</table>
			</li>
			<li id="ip_mytraffic">
				<div class="ip_title">Adatforgalmad, ar�nyod</div>
				<div id="ratio_meter">
					<img src="kinezet/{$ipanel.smink}/rm_dn.png" alt="Let�lt�sed m�rt�ke" title="Let�lt�sed m�rt�ke" border="0" height="17" width="{$ipanel.letolt_csik}">
					<img src="kinezet/{$ipanel.smink}/rm_up.png" alt="Felt�lt�sed m�rt�ke" title="Felt�lt�sed m�rt�ke" border="0" height="17" width="{$ipanel.feltolt_csik}">
				</div>
				<div id="mytraffic">
					Let�lt�sed: <span class="highlight">{$ipanel.letolt|b_to_s}</span>, felt�lt�sed: <span class="highlight">{$ipanel.feltolt|b_to_s}</span>, ar�nyod: <span class="{$ipanel.arany|aranyszin}">{$ipanel.arany_text}</span>
				</div>
			</li>
			<li id="ip_bookmarks">
				<div id="bookmarks_div">
					<div class="ip_title">K�nyvjelzoid</div>
					<div id="bookmarks">{$ipanel.konyvjelzok}</div>
				</div>
			</li>
		</ul>
		<div id="others_nav">
			<ul>
				<li><a class="helpdesk" href="helpdesk.php" target="_self" title="Ha valami nemsiker�l egyed�l...">Helpdesk</a></li>
				<li><a class="chat" href="chat.php" target="_self" title="�l�ben besz�lgess a felhazsn�l�kkal...">Chat</a></li>
				<li><a class="topten" href="top10.php" target="_self" title="No commnet...">Top 10</a></li>
	            <li class="other_nav_space_left"></li>
	            <li><a class="kijelentkezem" href="belep.php?logout=true" title="Kijelentkezem!">Kijel!</a></li>
				<li><a class="beallitasaim" href="profil.php" title="Be�ll�t�saim">Be�ll�t</a></li>
				<li><a class="torrentjeim" href="letolt.php?uid={$ipanel.uid}" title="Torrentjeim">torrent</a></li>
				<li><a class="leveleim" href="levelezes.php" title="Leveleim (Nincs �j)">level</a></li>
				<li><a class="barataim" href="barat.php" title="Bar�taim">barat</a></li>
				<li><a class="atadok" href="atadas.php" title="�tadok!">atad</a></li>
				<li><a class="meghivok" href="meghivo.php" title="Megh�vok!">megh</a></li>   
	            <li class="other_nav_space_right"></li>
				<li><a class="linkek" href="dokumentacio.php?mit=link" target="_self" title="No commnet...">Linkek</a></li>
				<li><a class="felhasznalok" href="users.php" target="_self" title="No commnet...">Felhaszn�l�k</a></li>
				<li><a class="radio" href="radio.php" target="_self" title="No commnet...">R�di�</a></li>
			</ul> 
		</div>	
	</div>
<div id="toggle"><a id="togglebutton" href="#"  title="Kinyit/Becsuk!">&nbsp;</a></div><br /><br />
	 
<script language="javascript" src="scriptek/thickbox.js"></script>

<script type="text/javascript">
{if $ipanel.uj_level==true}
var ujUzenet=true;
{elseif $ipanel.uj_szavazas==true}
var ujSzavazas=true;
{/if}

{if $ipanel.gui=='gui'}
var GUI=true;
{else}
var GUI=false;
{/if}


</script>