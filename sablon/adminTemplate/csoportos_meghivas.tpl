{$modulnev|section_open}
<div align="center">
	<form method="post" action="{$lap_cime}" enctype="multipart/form-data">			
		<h2 style="color:#ff0000;">
			A f�jlban az e-mail c�meket k�l�n sorba rakj�tok! Maximum 50 db c�m lehet a list�ban!! 
		</h2>
	
		
		<input type="hidden" name="modul" value="csoportos_meghivas" />
		F�jl:&nbsp;&nbsp;<input type="file" name="lista" class="skinned" />
		<br /><br />
		<input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image"  />	
	</form>
</div>
{$modulnev|section_end}


	
{if $cimek}
{'C�mlista'|section_open}
	<div class="center">
		<form method="post" action="{$lap_cime}">
			<h2>C�mlista</h2>
			<table class="skinned stats">
				
				{foreach from=$cimek item=cim}
					<tr>
						<td><input type="checkbox" name="cimek[]" checked="checked" value="{$cim}" /></td>
						<td>{$cim}</td>
					</tr>
				{/foreach}
				<tr>
					<td colspan="2">
						<input type="hidden" name="modul" value="csoportos_send" />
						<input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image"  />
					</td>
				</tr>
			</table>
		</form>
	</div>		
{'C�mlista'|section_end}
{/if}