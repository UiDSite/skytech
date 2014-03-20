<div align="center">
	<table>
		<tr>
			<td class="dlgcell" rowspan="16" width="190">
				<p><a href="userinfo.php?uid={$uinfo.uid}" class="pic"><img class="avatar" border="0" src="{$uinfo.avatar}" alt=""/></a></p>

			</td>
			<td class="dlgcell"></td>
			<td class="dlgcell"></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>N�v:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.name}</p></td>
		</tr>

		<tr>
			<td class="dlgcell"><p class="right"><b>Rang:</b></p></td>
			<td class="dlgcell"><p class="left">{$RANGOK[$uinfo.rang]}
				{if $uinfo.egyedi_rang}
					&nbsp;( {$uinfo.rang_text} )
				{/if}
			</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Regisztr�lt:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.reg_date}</p></td>

		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Legut�bb itt j�rt:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.vizit}</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Hozz�sz�l�sok sz�ma:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.hszszam}&nbsp;db</p></td>
		</tr>
			<tr>
			<td class="dlgcell"><p class="right"><b>Torrent hozz�sz�l�sok:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.tor_hszszam}&nbsp;db</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Let�lt�tt:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.letolt|b_to_s}</p></td>
		</tr>
		<tr>

			<td class="dlgcell"><p class="right"><b>Felt�lt�tt:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.feltolt|b_to_s}</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Ar�ny:</b></p></td>
			<td class="dlgcell"><p class="left"><span class="{$uinfo.arany|aranyszin}">{$uinfo.arany_text}</span></p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Sky-Pont:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.pontok} pont</p></td>
		</tr>

		<tr>
			<td class="dlgcell"><p class="right"><b>Lak�hely:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.orszag} {$uinfo.varos}</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>St�lus:</b></p></td>
			<td class="dlgcell"><p class="left">{$uinfo.smink}</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Bar�tok:</b></p></td>
			<td class="dlgcell"><p class="left">
			{if $uinfo.barat==true}
				<a href="barat.php?akcio=del&uid={$uinfo.uid}" title="User t�rl�se a bar�taim k�z�l">{$uinfo.name} t�rl�se a bar�taim k�z�l</a>
			{else}
				<a href="barat.php?akcio=add&uid={$uinfo.uid}" title="User felv�tele a bat�taim k�z�">{$uinfo.name} felv�telel a bar�taim k�z�</a>
			{/if}			
			</p></td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>E-mail c�m:</b></p></td>
			<td class="dlgcell"><p class="left">
				{if $mailNoHidden==true}
					<a title="Lev�l �r�sa." href="mailto:{$uinfo.email}">{$uinfo.email}</a>
				{else}
					Rejtve!
				{/if}
				</p>
			</td>
		</tr>
		<tr>
			<td class="dlgcell"><p class="right"><b>Mailer:</b></p></td>

			<td class="dlgcell"><p class="left"><a href="levelezes.php?uid={$uinfo.uid}">Lev�l �r�sa {$uinfo.name} sz�m�ra</a></p></td>
		</tr>
	</table>
	<br/>
</div>	