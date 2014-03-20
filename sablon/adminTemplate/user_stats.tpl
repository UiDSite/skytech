{$modulnev|section_open}
<div align="center">	
		
		<h2>Regisztr�lt felhaszn�l�k sz�ma</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Felhaszn�l�k(db)</td>
			</tr>
			{foreach from=$regek item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />
	
		<h2>Megh�v�sok sz�ma</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Megh�v�sok(db)</td>
			</tr>
			{foreach from=$meghivok item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />
		
		<h2>Megh�v�sokb�l val� regisztr�l�s</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Regisztr�lsok(db)</td>
			</tr>
			{foreach from=$meghivo_reg item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />
		
		<h2>Rangok eloszl�sa</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Rang</td>
				<td>Felhaszn�l�(db)</td>
			</tr>
			{foreach from=$rangok item=s}
				<tr>
					<td>{$s.nev}</td>
					<td>{$s.ert}</td>
				</tr>
			{/foreach}
		</table>			


</div>
{$modulnev|section_end}