{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	

	
	{'B�ng�sz�'|section_open}
		<div align="center">
			<table class="categories">
				<tr>
				{foreach from=$kategoriak item=kategoria}
					<td>
						<ul class="categories">{$kategoria}</ul>
					</td>
				{/foreach}
				</tr>
			<table>
			
			<div class="separator_center_long"></div>
			<form method="post" action="keresek.php"  >
			<table  cellpadding="5px" cellspacing="0" class="valasztok" align="center">
		        <tr>
					<td >Keres�s</td>
					<td >
						<input class="skinned" size="30" name="keres_text" id="keres_text" value="{$keres_text}" type="text" />
					</td>
					<td >
						<select name="keres_tipus" class="skinned" >
							{foreach from=$keres_tipusok item=k}
							<option value="{$k.value}" {if $k.selected==true}selected="selected"{/if}>{$k.text}</option>
							{/foreach}
						</select>							
					</td>	
					<td >
						<input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image" id="keres_btn" />
							
					</td>
					<td  >&nbsp;
					{if isset($keres_reset)}
						<input type="image" src="kinezet/{$ipanel.smink}/btn_delete.png" id="keres_reset" />
					{/if}					
					</td>
				</tr>
			</table>
			</form>	
			
			<div class="separator_center_long"></div>	
			
			<br />
			
			<a href="kerek.php" title="�j k�r�s bek�ld�se" class="pic" >
				<img src="kinezet/{$ipanel.smink}/btn_uj_keres.png" alt="�j k�r�s" border="0" />
			</a>
		</div>
	{'B�ng�sz�'|section_end}
		
		<div id="pagertab_upper">
			<div>
				{$betuvel.elozo}&nbsp;{$lapozo}&nbsp;{$betuvel.kovetkezo}&nbsp;&nbsp;
				<select class="skinned" size="1" name="page" id="lapozo_select_1">
						{$selectbe}
				</select>
			</div>
		</div>
		<table class="torrents">
			<tr class="t_head">
				<td class="t_head_icon"><a href="{$rendezlink[0]}" title="Rendez�s t�pus szerint">T�pus.</a></td>
				<td class="t_head_name"><a href="{$rendezlink[1]}" title="Rendez�s n�v szerint">N�v</a></td>
				<td class="t_head_down"><a href="{$rendezlink[3]}" title="Rendez�s a k�r�sek sz�ma szerint">K�rt�k</a></td>
				<td class="t_head_meret"><a href="{$rendezlink[5]}" title="Rendez�s a megszerezhet� Sky-Pontok sz�ma szerint">Jutalom</a></td>
				<td class="t_head_meret"><a href="{$rendezlink[2]}" title="Rendez�s a k�r�s d�tuma szerint">K�rve</a></td>
				<td class="t_head_sele"><a href="{$rendezlink[4]}" title="Rendez�s a k�r�s bek�ld�je szerint">K�rte</a></td>
			</tr>
			{if count($keresek) >0}
				{foreach from=$keresek item=t key=k}
					{include file='keres_tabi.tpl'}			
				{/foreach}
			{else}
			<tr>
				<td colspan="6"><br /><p class="red">Nincs tal�lat!</p><br /></td>
			</tr>
			{/if}
			
		</table>
		
		<div id="pagertab_lower">
			<div>
				{$betuvel.elozo}&nbsp;{$lapozo}&nbsp;{$betuvel.kovetkezo}&nbsp;&nbsp;
				<select class="skinned" size="1" name="page" id="lapozo_select_2">
						{$selectbe}
				</select>
			</div>
		</div>

</div>
<br /><br />


{literal}
<script type="text/javascript">

$('a.keres_del').click(function(){
	var torolKeresId=$(this).attr("href");
	$.prompt('Biztos, hogy v�glegesen t�rl�d a k�r�st?',{
		buttons: { Igen : true, Nem: false },
		callback: function(v,m){
			if(v==false)return;
			$.get('kerek.php', { modul: 'keres_del', kid: torolKeresId } );		
			$('#kicsi_'+torolKeresId).remove();		
			$('#nagy_'+torolKeresId).remove();
		}	     
	});	
	return false;
});


$('a.keres_csatlakozas').click(function(){
	var keresId=$(this).attr("href");
	txt='<div class="center">H�ny Sky-Pontall szeretn�l csatlakozni a k�r�shez?<br /><input class="skinned" type="text" id="csatPont" /></div>';
			
	$.prompt(txt,{
		buttons: { Ok : true, M�gsem: false },
		callback: function(v,m){
			if(v==false)return;
			
			pontok= parseInt( m.find('#csatPont').val() );
			
			if( pontok < 1 ){
				return simpleMsg('Egy Sky-Pontn�l kevesebbel nem lehet csatlakozni egy k�r�shez!');
			}
			
			$.get('kerek.php', { modul: 'keres_csat', kid: keresId, pont: pontok },function( txt ){
				return simpleMsg( txt );
			});		
						
		}	     
	});	
	return false;
});


function simpleMsg( msg ){
	$.prompt( msg,{ buttons: { Ok : true} });
}

</script>
{/literal}








<script language="javascript" src="scriptek/letolt.js"></script>



{* a labresz csatolasa *}
{include file='labresz.tpl'}