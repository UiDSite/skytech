{$modulnev|section_open}
	{foreach from=$data item=cikk}
		<div>
			<h1>{$cikk.cim}</h1>
			<i>M�dos�totta: {$cikk.mod_user_name} ( {$cikk.mod_date}) </i>
			<div class="rights">{$cikk.text}</div>
			<div class="right">
				<a href="{$lap_cime}?modul=uzenofal_del&id={$cikk.cid}" class="confirm pic" title="Bejegyz�s t�rl�se">
					<img src="kinezet/{$ipanel.smink}/t_delete.png" alt="" class="inline" border="0">
				</a>
				&nbsp;&bull;&nbsp;
				<a href="{$lap_cime}?modul=uzenofal_mod&id={$cikk.cid}" class="pic" title="Bejegyz�s szerkeszt�se">
					<img src="kinezet/{$ipanel.smink}/t_edit.png" alt="" class="inline" border="0">
				</a>			
			</div>
		</div>
		<div class="separator_center_long" ></div>
	{/foreach}
	<div class="center">
		<br />
		<a href="{$lap_cime}?modul=uzenofal_uj">[ �j bejegyz�s ]</a> 
		<br />
	</div>	
{$modulnev|section_end}