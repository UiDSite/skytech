{include file='fejresz.tpl'}
{* a fejlec csatolasa *}

<br />

<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	
	
		{'Vez�rl�pult'|section_open}
		<table class="categories">
			<tr>				
				<td>
					<ul class="categories">
						<li><a href="{$lap_cime}?modul=oldal_stats" >Oldal statisztika</a></li>						
						<li><a href="{$lap_cime}?modul=user_stats" >User statisztika</a></li>
						<li><a href="{$lap_cime}?modul=user_kovetes" >User K�vetes</a></li>
						<li><a href="{$lap_cime}?modul=tracker_stats" >Tracker statisztika</a></li>
						<li><a href="{$lap_cime}?modul=cron_stats" >Cron statisztika</a></li>
						<li><a href="{$lap_cime}?modul=cheat_stats" >Cheat statisztika</a></li>
						<li><a href="{$lap_cime}?modul=cheat_user" >Cheat Users</a></li>						
						<li><a href="{$lap_cime}?modul=syslog" >Sytem Log</a></li>						
						<li><a href="{$lap_cime}?modul=pontlog" >Pont Log</a></li>						
						<li><a href="{$lap_cime}?modul=chat_log" >Chat Log</a></li>						
						<li><a href="{$lap_cime}?modul=falidLoginLog" >falidLogin Log</a></li>						
						<li><a href="{$lap_cime}?modul=uzenofal" style="color:red;" >�zen�fal</a></li>	
					</ul>
				</td>
				
				
				
				
				
				<td>
					<ul class="categories">
						
						{if  $admin_level == 'tulcsi'}
						<li><a href="{$lap_cime}?modul=level_uj" >K�rlev�l admin</a></li>
						<li><a href="{$lap_cime}?modul=hir_lista" >H�r admin</a></li>
						<li><a href="{$lap_cime}?modul=doc_lista" >Dokumentum admin</a></li>
						<li><a href="{$lap_cime}?modul=szavazas_lista" >Szavazas admin</a></li>
						
						
						{/if}
						
						{if $admin_level == 'admin' || $admin_level == 'tulcsi'}
						<li><a href="{$lap_cime}?modul=chat_szoba" >Chat admin</a></li>
						<li><a href="{$lap_cime}?modul=temakor_lista" >F�rum admin</a></li>
						<li><a href="{$lap_cime}?modul=ban_lista" >BAN admin</a></li>
						{/if}
						<li><a href="{$lap_cime}?modul=warn_lista" >Warn admin</a></li>
					</ul>
				</td>
				<td>
					<ul class="categories">
						{if $admin_level == 'admin' ||  $admin_level == 'tulcsi'}
						<li><a href="{$lap_cime}?modul=user_add" >�j user hozz�ad�sa</a></li>
						<li><a href="{$lap_cime}?modul=user_mod" >User adatm�dos�t�s</a></li>
						<li><a href="{$lap_cime}?modul=regfalid_lista" >Megerositetlen regek</a></li>
						<li><a href="{$lap_cime}?modul=csoportos_meghivas" >Csoportos megh�v�s</a></li>
						<li><a href="{$lap_cime}?modul=pont_edit" >Jutalom pontok</a></li>
						<li><a href="{$lap_cime}?modul=pont_list" >TOP 100 pont tulajdonos</a></li>
						<li><a href="{$lap_cime}?modul=flush_cache" >Flush Cache</a></li>
						{/if}
					</ul>
				</td>
				
				<td>
					<ul class="categories">
						{if  $admin_level == 'tulcsi'}
							<li><a href="{$lap_cime}?modul=torrent_setting" >Torrent be�ll�t�sok</a></li>
							<li><a href="{$lap_cime}?modul=oldal_setting" >Oldal be�ll�t�sok</a></li>
							<li><a href="{$lap_cime}?modul=tracker_setting" >Tracker be�ll�t�sok</a></li>
							<li><a href="{$lap_cime}?modul=cron_setting" >Cron be�ll�t�sok</a></li>
							<li><a href="{$lap_cime}?modul=rang_setting" >Rang be�ll�t�sok</a></li>
							<li><a href="{$lap_cime}?modul=jog_setting" >Jogosults�g be�ll�t�sok</a></li>
						{/if}
					</ul>
				</td>					
			</tr>			
			
		</table>
	
	{'Tartalom bek�ld�s'|section_end}
	
	
	{if $modul=='oldal_stats' || $modul=='user_stats' || $modul=='tracker_stats'|| $modul=='cron_stats'}
	{'Tal�latok sz�k�t�se'|section_open}
		<form method="post" action="{$lap_cime}">
			<div align="center">
				<table  cellpadding="30px" cellspacing="0" class="valasztok" align="center">
			       <tr>
						<td>
							D�tum t�l:&nbsp;<input type="text" name="tol" class="skinned" value="{$tol}" /><br /><br />
							D�tum ig&nbsp;:&nbsp;<input type="text" name="ig" class="skinned" value="{$ig}" />
						</td>
						<td>
							<label for="napi"><input type="radio" name="bontas" value="napi" id="napi"   />&nbsp;Napi bont�s</label><br />
							<label for="heti"><input type="radio" name="bontas" value="heti" id="heti" checked="checked"/>&nbsp;Heti bont�s</label><br />
							<label for="havi"><input type="radio" name="bontas" value="havi" id="havi"  	/>&nbsp;Havi bont�s</label><br />					
						</td>
					</tr>
				</table>	
				<input type="hidden" name="modul" value="{$modul}" />
				<input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image"  />						
			</div>		
		</form>		
		{'Tal�latok sz�k�t�se'|section_end}
	{/if}
	
	{* $subtemplate *}
	{include file= $subtemplate}
	
	
</div>

<script type="text/javascript">
var AJAXURL='{$lap_cime}';
{literal}
 function cheatInfo( fileId ){

	$.post( AJAXURL,
		{
			modul:'cheat_stats_reszletes',
			tid: fileId,
			datumtol: $('#datumtol').val(),
			datumig: $('#datumig').val()
		},
		function( html ){
			$('#div_'+fileId).html(html);
			
		}
	);
	
	$('#tr_'+fileId).css("display",'');	
	$('#div_'+fileId).slideDown('slow');
	
 }
 
 function becsuk( fileId ){
	$('#div_'+fileId).slideUp('slow', function(){
		$('#tr_'+fileId).css("display",'none');	
	});	
 }
 
 
$('.confirm').bind('click', function(){
	var confirmText=$(this).attr('title');
	var confirmHref=$(this).attr('href');
	$.prompt('Biztos ezt szeretn�d: ' + confirmText ,{
		buttons: { Igen : true, Nem: false },
		callback: function(v,m){
			if(v==false) return;
			window.location.href=confirmHref;
		}	     
	});
	return false;
});
 
 
</script>
{/literal}

<script language="javascript" src="scriptek/skytech2.js"></script>
{* a labresz csatolasa *}
	{include file='labresz.tpl'}
	