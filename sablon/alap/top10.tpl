{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}
		{$ertek}
	{/foreach}
	
	
	{'Torrent TOP10'|section_open}
		{foreach from=$torrentek key=title item=sor}
			<h2>{$title} torrentek</h2>
			<div class="center">
				<table class="skinned" style="text-align:left;">
					<tr class="head">
						<td>Rang</td>
						<td >N�v</td>
						<td align="center">Let�ltve</td>
						<td>Adat</td>
						<td>Seed</td>
						<td>Leech</td>
						<td>Total</td>
						<td>Ratio</td>
						<td>Sebess�g</td>
					</tr>
						{foreach from=$sor key=i item=s}
							<tr><td>&nbsp;&nbsp;{$i+1}</td>{$s}</tr>
						{/foreach}
				</table>
			</div><br /><br />
		{/foreach}
	{'Torrent TOP10'|section_end}<br /><br />
	
	{'User TOP10'|section_open}
		{foreach from=$userek key=title item=sor}
			<h2>{$title} user</h2>
			<div class="center">
				<table class="skinned" style="text-align:left;">
					<tr class="head">
						<td>Rang</td>
						<td>N�v</td>
						<td >Felt�lt�tt</td>
						<td>Felt�lt. seb.</td>
						<td>Let�lt�tt</td>
						<td>Let�lt. seb.</td>
						<td>Ar�ny</td>
						<td>Csatlakozott</td>
					</tr>
						{foreach from=$sor key=i item=s}
							<tr><td>&nbsp;&nbsp;{$i+1}</td>{$s}</tr>
						{/foreach}
				</table>
			</div><br /><br />
		{/foreach}
	{'User TOP10'|section_end}
	
	
</div>











{* a labresz csatolasa *}
{include file='labresz.tpl'}