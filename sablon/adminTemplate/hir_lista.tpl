{$modulnev|section_open}
<div align="center">

	
	{foreach from=$data item=row}
		<h2>{$row.cim}</h2>
		<table class="skinned" style="width:700px;">
			<tr>
				<td>
					{$row.text}
				</td>
			</tr>
		</table>
		<br />
			<a href="{$lap_cime}?modul=hir_uj">[ �j h�r ]</a>&nbsp;&bull;&nbsp; 
			<a href="{$lap_cime}?modul=hir_mod&id={$row.hid}">[ hir szerkeszt�se ]</a>&nbsp;&bull;&nbsp; 
			<a href="{$lap_cime}?modul=hir_del&id={$row.hid}" class="confirm">[ h�r t�rl�se ]</a> 
		<br /><br />
		<div class="separator_center_long" ></div>	<br />	
	{foreachelse}
		<a href="{$lap_cime}?modul=hir_uj">[ �j h�r ]</a>
	{/foreach}	
	

</div>
{$modulnev|section_end}