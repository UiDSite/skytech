{$modulnev|section_open}
	<div align="center">	
		
		<h2>�sszes oldal let�lt�s</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Let�lt�s(db)</td>
			</tr>
			{foreach from=$osszes_oldal item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />
		
		<h2>�sszes l�togat�</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Let�lt�s(db)</td>
			</tr>
			{foreach from=$osszes_latogato item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num}</td>
				</tr>
			{/foreach}
		</table>
		
	<br /><div class="separator_center_long"></div><br />
		
		<h2>L�togatott f�jlok</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>F�jlok</td>
				<td>Let�lt�s(db)</td>
			</tr>
			{foreach from=$osszes_fajl item=s}
				<tr>
					<td>{$s.fajl}</td>
					<td>{$s.num}</td>
				</tr>
			{/foreach}
		</table>
		
	<br /><div class="separator_center_long"></div><br />
		
		<h2>L�togatok b�ng�sz�je</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>B�ng�sz�</td>
				<td>DB</td>
			</tr>
			{foreach from=$osszes_bongeszok item=s}
				<tr>
					<td>{$s.nev}</td>
					<td>{$s.ert}</td>
				</tr>
			{/foreach}
		</table>
		
	<br /><div class="separator_center_long"></div><br />
		
		<h2>L�togatok OS-e</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>OS</td>
				<td>DB</td>
			</tr>
			{foreach from=$osszes_os item=s}
				<tr>
					<td>{$s.nev}</td>
					<td>{$s.ert}</td>
				</tr>
			{/foreach}
		</table>
	</div>
{$modulnev|section_end}