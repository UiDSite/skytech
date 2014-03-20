{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	
	{'Staff'|section_open}
		{foreach name=rangokrabont from=$staff item=rang key=cim}
			<h2>{$cim}</h2>
			<div class="rights">
				{foreach name=userrebont from=$rang key=i item=user}
					
					<div class="staff_block">
						<a href="userinfo.php?uid={$user.uid}" title="{$user.statusz}">
							<img src="kinezet/{$ipanel.smink}/{$user.kep}" border='0' alt="S" />&nbsp;&nbsp;{$user.nev}
						</a>
					</div>					
				
				{/foreach}
			</div>
			<br /><br />
		{/foreach}		
	{'Staff'|section_end}
	
	{'Lev�l�r�s'|section_open}
		<br /><br />
			<div class="rights">
				<table width="100%">
					<tr>
						<td><img src="kinezet/{$ipanel.smink}/warned.png" border='0' alt="Figyelem" /></td>
						<td>
							Nem v�laszolunk, olyan k�rd�sekre, ami megtal�lhat� a 
							<a href="dokumentacio.php?mit=szab">Szab�lyzatban</a>, a 
							<a href="dokumentacio.php?mit=gyik">Gy.I.K.-ben</a>, a 
							<a href="dokumentacio.php?mit=link">Linkek k�z�tt</a>, vagy a 
							<a href="forum.php">f�rumban!</a>
						</td>
					</tr>
				</table>
			</div><br /><br />
			<form method="post" action="staff.php">
			<div class="center"><h1>Lev�l sz�vege</h1></div><br />
				<div class="textarea"><textarea name="text" id="box_content" rows="15" cols="144" style="width: 905px; height: 250px;"></textarea></div>
				<br />
				<div class='dialog_content'><input name="submit" value="Ok" type="image" src="kinezet/{$ipanel.smink}/btn_ok.png"/></div>
			</form>
	{'Lev�l�r�s'|section_end}
	
</div>
{* a labresz csatolasa *}
{include file='labresz.tpl'}