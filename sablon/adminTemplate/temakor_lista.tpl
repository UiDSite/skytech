{$modulnev|section_open}
<div align="center">

	
	{foreach from=$data item=row}
		<h2>{$row.cim}</h2>
		<table class="skinned" style="width:700px;">
			{foreach from=$row.childen item=topik key=i}
				{if $i is even}
					<tr class="t_even">
				{else}
					<tr class="t_odd">
				{/if}
					<td>
						<img src="kinezet/{$ipanel.smink}/topik_{if $topik.status=='n'}nyitot.gif{else}zart.gif{/if}"  alt="{$topik.status}" style="border:0px;padding:0px;"/>
					</td>
					<td>
						<a href="forum_hsz.php?id={$topik.tid}" target="_blank" class="pic" title="Ugr�s a topikba">
							{$topik.tema}
						</a>
					</td>
					<td>{$topik.ismerteto}</td>
					<td>
						<a href="{$lap_cime}?modul=topik_del&id={$topik.tid}" class="confirm pic" title="Topik t�rl�se">
							<img src="kinezet/{$ipanel.smink}/t_delete.png" alt="" class="inline" border="0">
						</a>
						&nbsp;&bull;&nbsp;
						<a href="{$lap_cime}?modul=topik_mod&id={$topik.tid}" class="pic" title="Topik m�dos�t�sa">
							<img src="kinezet/{$ipanel.smink}/t_edit.png" alt="" class="inline" border="0">
						</a>						
					</td>
				</tr>
			{foreachelse}
				<tr>
					<td colspan="3">
						<a href="{$lap_cime}?modul=temakor_del&id={$row.fid}" class="confirm" >T�mak�r t�rl�se</a>
					</td>
				</tr>
			{/foreach}
			
		</table>
		<br />
			<a href="{$lap_cime}?modul=temakor_mod&id={$row.fid}">[ t�mak�r szerkeszt�se ]</a>&nbsp;&bull;&nbsp; 
			<a href="{$lap_cime}?modul=temakor_uj">[ �j t�mak�r ]</a>&nbsp;&bull;&nbsp; 
			<a href="{$lap_cime}?modul=topik_uj">[ �j topik ]</a> 
		<br /><br />
		<div class="separator_center_long" ></div>	<br />	
	{/foreach}	
	
	
	







</div>
{$modulnev|section_end}