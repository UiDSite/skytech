{include file='fejresz.tpl'}
{* a fejlec csatolasa *}

{* infopanel csatol?sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	
	{'Opci?k'|section_open}
		<a href="?showall=true">?sszes torrent</a> | <a href="?showall=false">Seed k?telezett torrentek</a>
	{'Opci?k'|section_end}
	
	{'Statisztika'|section_open}
		<table>
			<tr>
				<td>Napi helyez?s:</td>
				<td>N/A</td>
				<td>* A napi helyez?s ?r?nk?nt friss?l, ?jf?lkor pedig null?z?dik.</td>
			</tr>
			<tr>
				<td>Heti helyez?s:</td>
				<td>N/A</td>
				<td>* A heti helyez?s ?r?nk?nt friss?l, vas?rnaponk?nt 23 ?ra 59 perckor pedig null?z?dik.</td>
			</tr>
			<tr>
				<td>Havi helyez?s:</td>
				<td>N/A</td>
				<td>* A havi helyez?s ?r?nk?nt friss?l, h?nap els? napj?n 0 ?ra 1 perckor pedig null?z?dik.</td>
			</tr>
			<tr>
				<td>Elm?lt havi helyez?s:</td>
				<td>N/A</td>
				<td>* Az el?z? h?napban el?rt helyez?s. Minden h?nap els? napj?n friss?l? adat.</td>
			</tr>
			<tr>
				<td>Lehets?ges hit'n'runok sz?ma:</td>
				<td>{$hrdb}</td>
				<td>* Ha minden ?gy maradna h?nap v?g?ig, akkor ennyi hit'n'runolt torrented lenne.</td>
			</tr>
			<tr>
				<td>Hit'n'runolhat? torrentek sz?ma:</td>
				<td>-</td>
				<td>* Ennyi torrentn?l nincs seed-k?telezetts?ged. Rangonk?nt elt?r? mennyis?g.</td>
			</tr>
			<tr>
				<td>Hit'n'runolt torrentek sz?ma:</td>
				<td>-</td>
				<td>* E h?napban jelenleg ennyi torrentn?l nem tett?l eleget seed-k?telezetts?gednek.</td>
			</tr>
		</table>
	{'Statisztika'|section_end}
	
	{"Elm?lt id?szakban futtatott torrentek ($osszdb)"|section_open}
		<table class="skinned">
			<tr class="head">
				<td style="width: 341px"><a href="{$rendezlink[0]}" title="Rendez?s n?v szerint">N?v</a></td>
				<td><a href="{$rendezlink[1]}" title="Rendez?s kezd?s ideje szerint">Start</a></td>
				<td><a href="{$rendezlink[2]}" title="Rendez?s utols? friss?t?s ideje szerint">Friss?tve</a></td>
				<td><a href="{$rendezlink[3]}" title="Rendez?s ?llapot szerint">Status</a></td>
				<td><a href="{$rendezlink[4]}" title="Rendez?s felt?lt?tt adatmennyis?g szerint">Fel</a></td>
				<td><a href="{$rendezlink[5]}" title="Rendez?s let?lt?tt adatmennyis?g szerint">Le</a></td>
				<td><a href="{$rendezlink[6]}" title="Rendez?s h?tral?v? id? szerint">H?travan</a></td>
				<td><a href="{$rendezlink[7]}" title="Rendez?s ar?ny szerint">Ar?ny</a></td>
			</tr>		
			{if $db > 0}
				{foreach from=$seed key=k item=s }
				<tr class="flash">
					<td align=left><a href="adatlap.php?id={$s.tid}" target="_blank">
						{if $s.name|count_characters > 50}
							{$s.name|substring:1:50}...
						{else}
							{$s.name}
						{/if}
					</a></td>
					<td>{$s.kezdes|d_to_s}</td>
					<td>{$s.frissitve|d_to_s}</td>
					<td>{if $s.status == '0'}Stopped{elseif $s.status == '1'}Leech{else}Seed{/if}</td>
					<td>{$s.feltoltve|b_to_s}</td>
					<td>{$s.letoltve|b_to_s}</td>
					<td>{$s.hatravan|t_to_i}</td>
					<td>{if $s.feltoltve/$s.letoltve == 0}nincs{else}{$s.feltoltve/$s.letoltve|string_format:"%.3f"}{/if}</td>
				</tr>
				{/foreach}
			{else}
				<tr class="flash">
					<td colspan="8"><br /><FONT STYLE='font-size: 11px'>Az ?ltalad let?lt?tt anyagokat a szab?lyoknak megfelel?en visszaosztottad, a list?d ennek k?sz?nhet?en ?res.</FONT></td>
				</tr>
			{/if}
		</table>
	{'Elm?lt id?szakban futtatott torrentek (109)'|section_end}
	

</div>

{* a labresz csatolasa *}
{include file='labresz.tpl'}