{* ez az infopanel �s az alatta l�v� div megjelen�t� *}
<script language="javascript" type="text/javascript">
var SMINK='{$ipanel.smink}';
var SECTION_COOKIE = '{$smarty.const.SECTION_COOKIE}';
var INFOPANEL_COOKIE = '{$smarty.const.INFOPANEL_COOKIE}';
{literal}
//var COOKIE_CONFIG = { expires: 7, path: '/', domain: 'sky-tech.hu', secure: true };
//var COOKIE_CONFIG = { expires: 7, secure: true };
var COOKIE_CONFIG = {expires: 365 };
{/literal}
</script>


<div id="infopanel" style="overflow: visible; display: {$ipanel.display}; height: 174px;">
        <div id="myavatarwrapper"><img id="myavatar" src="{$ipanel.avatar}" alt="Avatarom" title="Ugr�s a profilomhoz" onclick="window.location='userinfo.php?uid={$ipanel.uid}'" border="0" /></div>
        <span id="myname">{$ipanel.name}</span>
        <span id="myrank"><span class="rank{$ipanel.rang}">{$ipanel.rang_text}</span></span>
        
        <div id="ratio_meter">
                <img src="kinezet/{$ipanel.smink}/rm_dn.png" alt="Let�lt�sed m�rt�ke" title="Let�lt�sed m�rt�ke" border="0" height="18" width="{$ipanel.letolt_csik}" />
                <img src="kinezet/{$ipanel.smink}/rm_up.png" alt="Felt�lt�sed m�rt�ke" title="Felt�lt�sed m�rt�ke" border="0" height="18" width="{$ipanel.feltolt_csik}" />
        </div>
        <div id="mytraffic">Let�lt�sed: <span class="highlight">{$ipanel.letolt|b_to_s}</span>, felt�lt�sed: <span class="highlight">{$ipanel.feltolt|b_to_s}</span>, ar�nyod: <span class="{$ipanel.arany|aranyszin}">{$ipanel.arany_text}</span></div>

        <div id="others">
                <a href="helpdesk.php" target="_self" title="Ha valami nem siker�l egyed�l...">Helpdesk</a>&nbsp;-
                <a href="top10.php" target="_self" title="No comment...">Top 10</a>&nbsp;-
                <a href="dokumentacio.php?mit=link" target="_self" title="No comment...">Linkek</a>&nbsp;-
                <a href="users.php" target="_self" title="No comment...">Felhaszn�l�k</a>&nbsp;-
                <a href="hitnrun.php" target="_self" title="No comment...">Seedk�telezetts�g</a>&nbsp;&nbsp;
        </div>
        <div id="options">
                <a class="pic" href="belep.php?logout=true" title="Kijelentkezem!"><img src="kinezet/{$ipanel.smink}/ip_logout.png" alt="" border="0" /></a>

                <a class="pic" href="profil.php" title="Be�ll�t�saim"><img src="kinezet/{$ipanel.smink}/ip_settings.png" alt="" border="0" /></a>
                <a class="pic" href="letolt.php?uid={$ipanel.uid}" title="Torrentjeim"><img src="kinezet/{$ipanel.smink}/ip_mytorrents.png" alt="" border="0" /></a>
                <a class="pic" href="levelezes.php" title="Leveleim({$ipanel.level_text})"><img src="kinezet/{$ipanel.smink}/ip_mailer.png" alt="" border="0" /></a>
                <a class="pic" href="barat.php" title="Bar�taim"><img src="kinezet/{$ipanel.smink}/ip_friends.png" alt="" border="0" /></a>
                <a class="pic" href="atadas.php" title="�tadok!"><img src="kinezet/{$ipanel.smink}/ip_transfer.png" alt="" border="0" /></a>
                <a class="pic" href="meghivo.php" title="Megh�vok!"><img src="kinezet/{$ipanel.smink}/ip_invite.png" alt="" border="0" /></a>
        </div>
        <div id="bookmarks">
                        {$ipanel.konyvjelzok}
        </div>
        <div id="ponts" >
                <a href="pontok.php" title="Pontok megtekint�se">{$ipanel.pont} B�nuszpont</a>
        </div>
        
</div>
<div id="toggle"><a id="togglebutton" href="#"  title="Kinyit/Becsuk!">&nbsp;</a></div>
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
