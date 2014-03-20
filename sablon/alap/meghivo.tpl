{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}
		{$ertek}
	{/foreach}
	
	
	{'Megh�v�'|section_open}
		<h2>{$meghivotext.cim}</h2> 		
		<br />
		{$meghivotext.text}
		<br /><br /><br />
		<div class="separator_center_long"></div>
		
		{if $kuldhet==true}
			<br />
			<form method="post" action="meghivo.php">
				<table >
					<tr>
						<td>Email c�m:</td>
						<td><input type="text" name="meghivo" class="skinned"/></td>
						<td><input value="Ok"  src="kinezet/{$ipanel.smink}/btn_ok.png" type="image" id="keres_btn" /></td>
					</tr>
				</table>
			</form>
			<br />
			<p>3 nap eltelt�vel a felhaszn�latlan meghiv�k �rv�nytelenn� v�lnak �s t�rl�dnek a rendszerb�l mintha el sem k�ldted volna.</p>
		{else}
			<br />
			<p>Jelenleg nem k�ldhetsz megh�v�t.</p>
		{/if}
		<br /><br />
		{if $adminpanel==true}
		<div style="width:100%;text-align:right;">
			[ <a href="dokumentacio.php?mit=meghivo&mod=mod&id={$meghivotext.cid}" >szerkeszt�s</a> ]
		</div>
		{/if}
	{'Megh�v�'|section_end}

	{'Statisztika'|section_open}
	
		<br />
		Utols� megh�v�d elk�ldve: {$s_datum}<br />
		Utols� megh�v�d �ta felt�lt�tt�l: {$s_up|b_to_s}-t
		<br /><br />

		{if !empty($meghivott)}
			<div class="center">
				<table class="skinned" >
					<tr class="head">
						<td>Megh�vott emali c�m</td>
						<td>D�tum</td>
						<td>Felhaszn�lva</td>
					</tr>
					{foreach from=$meghivott item=m}
						<tr>
							<td>{$m.email}</td>
							<td>{$m.datum}</td>
							<td>{$m.link}</td>
						</tr>
					{/foreach}
				</table>
			</div>					
		{else}
			<p>M�g nem h�vt�l meg senkit!</p>
		{/if}

	{'Statisztika'|section_end}





	
	
	
	
	
	

</div>
{* a labresz csatolasa *}
{include file='labresz.tpl'}