{include file='fejresz.tpl'}
{* a fejlec csatolasa *}

{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	
	{'Opci�k'|section_open}
		<a href="?showall=true">�sszes torrent</a> | <a href="?showall=false">Seed k�telezett torrentek</a>
	{'Opci�k'|section_end}
	
	{'Statisztika'|section_open}
		<table>
			<tr>
				<td>Napi helyez�s:</td>
				<td>1</td>
				<td>* A napi helyez�s �r�nk�nt friss�l, �jf�lkor pedig null�z�dik.</td>
			</tr>
			<tr>
				<td>Heti helyez�s:</td>
				<td>1</td>
				<td>* A heti helyez�s �r�nk�nt friss�l, vas�rnaponk�nt 23 �ra 59 perckor pedig null�z�dik.</td>
			</tr>
			<tr>
				<td>Havi helyez�s:</td>
				<td>1</td>
				<td>* A havi helyez�s �r�nk�nt friss�l, h�nap els� napj�n 0 �ra 1 perckor pedig null�z�dik.</td>
			</tr>
			<tr>
				<td>Elm�lt havi helyez�s:</td>
				<td>1</td>
				<td>* Az el�z� h�napban el�rt helyez�s. Minden h�nap els� napj�n friss�l� adat.</td>
			</tr>
			<tr>
				<td>Lehets�ges hit'n'runok sz�ma:</td>
				<td>0</td>
				<td>* Ha minden �gy maradna h�nap v�g�ig, akkor ennyi hit'n'runolt torrented lenne.</td>
			</tr>
			<tr>
				<td>Hit'n'runolhat� torrentek sz�ma:</td>
				<td>0</td>
				<td>* Ennyi torrentn�l nincs seed-k�telezetts�ged. Rangonk�nt elt�r� mennyis�g.</td>
			</tr>
			<tr>
				<td>Hit'n'runolt torrentek sz�ma:</td>
				<td>0</td>
				<td>* E h�napban jelenleg ennyi torrentn�l nem tett�l eleget seed-k�telezetts�gednek.</td>
			</tr>
		</table>
	{'Statisztika'|section_end}
	
	{"Elm�lt id�szakban futtatott torrentek ($db)"|section_open}
		<table class="torrents" style="width:900px;">
			<tr class="t_head">
				<td>N�v</td>
				<td>Start</td>
				<td>Friss�tve</td>
				<td>Status</td>
				<td>Fel</td>
				<td>Le</td>
				<td>H�travan</td>
				<td>Ar�ny</td>
			</tr>			
			{foreach from=$seed key=k item=s }
			<tr {if $k is even}class="t_even"{else}class="t_odd"{/if}>
				<td align=left>{$s.name}</td>
				<td>{$s.kezdes}</td>
				<td>{$s.frissitve|d_to_s}</td>
				<td>{if $s.status == '0'}Stopped{elseif $s.status == '1'}Leech{else}Seed{/if}</td>
				<td>{$s.feltoltve|b_to_s}</td>
				<td>{$s.letoltve|b_to_s}</td>
				<td>{$s.hatravan|t_to_i}</td>
				<td>{if $s.feltoltve/$s.letoltve ==0}nincs{else}{$s.feltoltve/$s.letoltve|string_format:"%.3f"}{/if}</td>
			<tr>
			{/foreach}
		</table>
	{'Elm�lt id�szakban futtatott torrentek (109)'|section_end}
	

</div>

{* a labresz csatolasa *}
{include file='labresz.tpl'}