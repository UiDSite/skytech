{$modulnev|section_open}
<div class="center">
	<form method="post" action="{$lap_cime}" >				
		<input type="hidden" name="modul" value="cheat_user" />
		
		<table style="margin:auto;">
			<tr>
				<td>UserId*:</td>
				<td><input type="text" name="uid"  class="skinned" value="{$uid}" /></td>
			</tr>
			<tr>
				<td>TorrentId*:</td>
				<td><input type="text" name="tid"  class="skinned" value="{$tid}" /></td>
			</tr>						
			<tr>
				<td>D?tumt?l:</td>
				<td><input type="text" name="datumtol" id="datumtol" class="skinned" value="{$datumtol}" /></td>
			</tr>
			<tr>
				<td>D?tumig:</td>
				<td><input type="text" name="datumig" id="datumig" class="skinned" value="{$datumig}" /></td>
			</tr>								
		</table>
						
		<br /><br />
		<input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image"  />	
	</form>

</div>		

{$modulnev|section_end}	
	{if $data}
		{'Tal?latok'|section_open}
			<div class="center">
				<table style="margin:auto;">
					<tr>
						<td>Torrent:</td>
						<td><a href="adatlap.php?id={$tid}" target="_blank">{$torrentName}</a></td>
					</tr>
					<tr>
						<td>User:</td>
						<td><a href="userinfo.php?uid={$uid}" target="_blank" >{$userName}</a></td>
					</tr>
				</table>
				<br /><br />
			
			
				<table class="skinned" style="text-align:left;">
					<tr class="head">
						<td>&nbsp;</td>
						<td>Felt?lt?s</td>
						<td>Sebess?g</td>
						<td>Let?lt?s</td>
						<td>Sebess?g</td>
						<td>IP</td>
						<td>R?gz?tve</td>						
					</tr>
					
					{foreach from=$data item=user key=i}
						<tr>
							<td>{$i+1}</td>
							<td>{$user.fel|b_to_s}</td>
							<td>{$user.felseb|b_to_s}/s</td>
							<td>{$user.le|b_to_s}</td>
							<td>{$user.leseb|b_to_s}/s</td>
							<td>{$user.ip}</td>
							<td>{$user.datum}</td>
						</tr>
					{foreachelse}	
						<tr>
							<td colspan="7">
								nincs talal?lat!
							</td>
						</tr>
					{/foreach}
				</table>
			</div>
		{'Tal?latok'|section_end}
	{/if}
	
	
	