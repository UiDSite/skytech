{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}
		{$ertek}<br /><br />
	{/foreach}
	
	{if $adminlink==true}
		{'Torrent m�dos�t�s'|section_open}		
		<form method="post" action="letolt_admin.php" enctype="multipart/form-data">
			
			<table>
				<tr>
					<td>Torrent n�v:</td>
					<td><input id="tname" name="tname" size="72" class="skinned" type="text" value="{$name}" /></td>
				<tr>
				<tr>
					<td>Kateg�ria:</td>
					<td>
						<select id="tcategory" name="tcategory" class="skinned" >
							{foreach from=$tipusok key=id  item=t}
								<option value="{$t.kid}" {if $t.kid==$kategoria}selected="selected"{/if} >{$t.nev}</option>
							{/foreach}									
						</select>
					</td>
				<tr>
				<tr>
					<td>NFO f�jl:</td>
					<td><input id="mezo1" name="tnfo" size="61" class="skinned"  type="file"></td>
				<tr>
				<tr>
					<td>Els� k�p:</td>
					<td><input  name="kep1" size="72" class="skinned" type="text" value="{$kep1}" /></td>
				<tr>
				<tr>
					<td>M�sodik k�p:</td>
					<td><input  name="kep2" size="72" class="skinned" type="text" value="{$kep2}" /></td>
				<tr>
				<tr>
					<td>Harmadik k�p:</td>
					<td><input  name="kep3" size="72" class="skinned" type="text" value="{$kep3}" /></td>
				<tr>
				<tr>
					<td colspan="2">Torrent le�r�s:</td>
				<tr>
				<tr>
					<td colspan="2">
						{include file='bbcode.tpl'}
						<div class="textarea"><textarea name="megj" id="box_content" rows="15" cols="144" style="width: 905px; height: 250px;">{$megj}</textarea></div>
					</td>
					
				<tr>
			</table>
			<input type="hidden" name="tid" value="{$tid}" />			
			<br /><br />
			<div class='dialog_content'><input name="submit" value="Ok" type="image" src="kinezet/{$ipanel.smink}/btn_ok.png"/></div>
		</form>	
		
		{'Felt�lt�tsi seg�dlet'|section_end}	
	{/if}
	
	{if $adminlink2==true}
		{$name|section_open}		
		<form method="post" action="letolt_admin.php">			
			<table>
				<tr>
					<td colspan="2">Admin megjegyz�s:</td>
				<tr>
				<tr>
					<td colspan="2">
						{include file='bbcode.tpl'}
						<div class="textarea"><textarea name="admin_megj" id="box_content" rows="15" cols="144" style="width: 905px; height: 250px;">{$admin_megj}</textarea></div>
					</td>
					
				<tr>
			</table>
			<input type="hidden" name="tid" value="{$tid}" />			
			<br /><br />
			<div class='dialog_content'><input name="submit" value="Ok" type="image" src="kinezet/{$ipanel.smink}/btn_ok.png"/></div>
		</form>				
		{'Felt�lt�tsi seg�dlet'|section_end}	
	{/if}
</div>
{* a labresz csatolasa *}
{include file='labresz.tpl'}