{$modulnev|section_open}
<div align="center">
{foreach from=$szavazasok key=i item=szavaz}
	<div class="poll">				
		<p><span class="big">{$szavaz.cim}</span><br><sup>{$szavaz.datum}</sup></p>
		<br>				
		{$szavaz.text}									
		<br /><br />

		<a href="{$lap_cime}?modul=szavazas_mod&id={$szavaz.id}">[ Szavaz�s szerkeszt�se ]</a> 
		&nbsp;&bull;&nbsp;
		<a href="{$lap_cime}?modul=szavazas_del&id={$szavaz.id}" class="confirm" title="Szavaz�s t�rl�se" >[ Szavaz�s t�rl�se ]</a>
		&nbsp;&bull;&nbsp;
		<a href="{$lap_cime}?modul=szavazas_uj">[ �j szavaz�s ]</a>
	</div>
<br /><br />
<div class="separator_center_long" ></div>	<br />	
{/foreach}
</div>
{$modulnev|section_end}