{$modulnev|section_open}
<div align="center">	
		
		<h2>Felt�t�sek</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Adat mennyis�g</td>
			</tr>
			{foreach from=$feltoltes item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num|b_to_s}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />	

		<h2>Let�t�sek</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Adat mennyis�g</td>
			</tr>
			{foreach from=$letoltes item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num|b_to_s}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />	

		<h2>Elt�r�s</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Id�szak{$ido}</td>
				<td>Adat mennyis�g</td>
			</tr>
			{foreach from=$elteres item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num|b_to_s}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />

		<h2>Felt�t�sek kategori�ra bontva</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Kateg�ria</td>
				<td>Adat mennyis�g</td>
			</tr>
			{foreach from=$feltoltes_kat item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num|b_to_s}</td>
				</tr>
			{/foreach}
		</table>
	
	
	<br /><div class="separator_center_long"></div><br />

		<h2>Let�t�sek kategori�ra bontva</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Kateg�ria</td>
				<td>Adat mennyis�g</td>
			</tr>
			{foreach from=$letoltes_kat item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num|b_to_s}</td>
				</tr>
			{/foreach}
		</table>
	
	<br /><div class="separator_center_long"></div><br />

		<h2>Elt�r�sek kategori�ra bontva</h2>
		<table  class="stats skinned" >
			<tr class="head">
				<td>Kateg�ria</td>
				<td>Adat mennyis�g</td>
			</tr>
			{foreach from=$elteres_kat item=s}
				<tr>
					<td>{$s.ido}</td>
					<td>{$s.num|b_to_s}</td>
				</tr>
			{/foreach}
		</table>
	
</div>
{$modulnev|section_end}