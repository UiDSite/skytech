{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	
	{'Peerlista'|section_open}
	<div class="center">
		<h1><a href="adatlap.php?id={$torrent.tid}" >{$torrent.name}</a></h1>
	</div>
	<div class="separator_center_long"></div>
	<br />
	
		<h2>Seederek</h2>
	
			<table class="torrents" style="width:900px;">
				<tr class="t_head">
					<td>N�v</td>
					<td>M�d</td>
					<td>Felt�lt�tt</td>
					<td>Felt�lt seb.</td>
					<td>Let�lt�tt</td>
					<td>Let�lt seb.</td>
					<td>Ar�ny</td>
					<td>�llapot</td>
					<td>Kliens</td>
					<td>Csatlakozva</td>
					<td>Friss�tve</td>
				</tr>
				{foreach from=$seed key=k item=s }
					<tr {if $k is even}class="t_even"{else}class="t_odd"{/if}>
						<td>
							<a title="Profil megtekint�se" href="userinfo.php?uid={$s.uid}">
								<span class="rank{$s.rang}">{$s.name}</span>
							</a>
						</td>
						<td>
							{if $s.mod=='yes'}akt�v{else}pass�v{/if}
						</td>
						<td>{$s.feltolt|b_to_s}</td>
						<td>{$s.feltolt_seb|b_to_s}/s</td>
						<td>{$s.letolt|b_to_s}</td>
						<td>0 B/s</td>
						<td>{$s.arany}</td>
						<td>100%</td>
						<td>{$s.kliens}</td>
						<td>{$s.csat|t_to_s}</td>
						<td>{$s.fris|t_to_s}</td>
					<tr>
				
				{/foreach}
			</table>
			<br /><br /><br />
			
			<h2>Leecherek</h2>
	
			<table class="torrents" style="width:900px;">
				<tr class="t_head">
					<td>N�v</td>
					<td>M�d</td>
					<td>Felt�lt�tt</td>
					<td>Felt�lt seb.</td>
					<td>Let�lt�tt</td>
					<td>Let�lt seb.</td>
					<td>Ar�ny</td>
					<td>�llapot</td>
					<td>Kliens</td>
					<td>Csatlakozva</td>
					<td>Friss�tve</td>
				</tr>
				{foreach from=$leech key=k item=s }
					<tr {if $k is even}class="t_even"{else}class="t_odd"{/if}>
						<td>
							<a title="Profil megtekint�se" href="userinfo.php?uid={$s.uid}">
								<span class="rank{$s.rang}">{$s.name}</span>
							</a>
						</td>
						<td>
							{if $s.mod=='yes'}akt�v{else}pass�v{/if}
						</td>
						<td>{$s.feltolt|b_to_s}</td>
						<td>{$s.feltolt_seb|b_to_s}/s</td>
						<td>{$s.letolt|b_to_s}</td>
						<td>{$s.letolt_seb|b_to_s}/s</td>
						<td>{$s.arany}</td>
						<td>{$s.allapot}%</td>
						<td>{$s.kliens}</td>
						<td>{$s.csat|t_to_s}</td>
						<td>{$s.fris|t_to_s}</td>
					<tr>
				
				{/foreach}
			</table>
		
	{'Peerlista'|section_end}
	
	
	
	
</div>











{* a labresz csatolasa *}
{include file='labresz.tpl'}