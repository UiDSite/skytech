{$modulnev|section_open}
	<div class="center">
		<form method="post" action="{$lap_cime}" >			
			<h1 style="color:#ff0000;">Figyelem!<br />A hib�s be�ll�t�sok, az oldal TELJES �sszeoml�s�hoz vezethet!!</h1>
		
			<br />
			<table  class="skinned" >
					<tr class="head">
						<td>V�ltoz�</td>
						<td>Jelenleg</td>
						<td width="250px">�j �rt�k</td>
					</tr>
					{foreach from=$vars item=v name=foo}
						<tr class="{if $smarty.foreach.foo.index is even}t_even{else}t_odd{/if}" >
							<td class="left"><span class="tooltip" title="{$v.leiras}">{$v.name}</span></td>
							
								{if $v.type == 'radio' }
									radio
								{elseif $v.type == 'select'}
									<td class="left">{$rangok[$v.value]}</td>
									<td class="left">
										<select id="{$v.var}" name="param[{$v.var}]" class="skinned" style="width:250px;" >
											{foreach from=$rangok item=rang_nev key=rang}
												<option value="{$rang}" {if $rang==$v.value}selected="selected" {/if}>{$rang_nev}</option> 
											{/foreach}									
										</select>
									</td>
								{else}
									<td class="left">{$v.value}</td>
									<td class="left">
										<input type="text" id="{$v.var}" name="param[{$v.var}]" class="skinned" style="width:250px;" />
									</td>
								{/if}
							
						</tr>
					{/foreach}					
			</table><br /><br />
			<input type="hidden" name="modul" value="varsave" />
			<input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image"  />	
		</form>
	</div>		
{$modulnev|section_end} 