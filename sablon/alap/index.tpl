{include file='fejresz.tpl'}
{* a fejlec csatolasa *}

{* ez a sablon felel az index. php megjel�n�s�rt*}


{* infopanel csatol�sa *}
{include file='infopanel.tpl'}
{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}

{* hirek section *}
{'H�rek'|section_open}
        {if $uj_link}<p><img border="0" src="kinezet/{$ipanel.smink}/collapse.png" />&nbsp;{$uj_link}</p><br />{/if}
        {foreach from=$hirek key=i item=h}
                <div id="hirdiv_{$h.id}">
                        <p>     <img border="0" src="kinezet/{$ipanel.smink}/collapse.png" id="{$h.id}_kep" alt=""/>&nbsp;
                                <a href="#{$h.id}" class="al_section"><i>{$h.datum}</i>&nbsp;-&nbsp;<b>{$h.cim}</b></a>
                                {if $uj_link} &bull;    
                                        <a href="hirek.php?mit=mod&id={$h.id}&vissza=index.php" title="Szerkeszt�s">Szerkeszt�s</a> &bull; 
                                        <a href="#" title="T�rl�s" alt="{$h.id}" class="hirtorol">T�rl�s</a>
                                {/if}
                        </p>
                        <div class="layer" id="{$h.id}_div" style="display: {$h.disp};">{$h.text}</div><br />
                </div>
        {/foreach}
{'H�rek'|section_end}

{* �ltal�nos statisztika *}
{'�ltal�nos statisztika, bannerek'|section_open}

<table class="skinned">
  <tr class="head">
    <td>Felhaszn�l�k</td>
    <td>Ebb�l tag</td>
    <td>Torrentek</td>
    <td>Peerek</td>

    <td>Seederek</td>
    <td>Leecherek</td>
    {*<td>Seed/Leech ar�ny</td>*}
    <td>Let�lt�si sebess�g</td>
    <td>Let�lt�sek</td>
    <td>Ingyenes let�lt�sek</td>
    <td>�sszes let�lt�s</td>

  </tr>
  <tr>
    <td>{$stat.user_db}</td>
    <td>{$stat.user_tag}</td>
    <td>{$stat.torrent}</td>
    <td>{$stat.peers}</td>
    <td>{$stat.seeder}</td>

    <td>{$stat.leecher}</td>
    {*<td>{$stat.arany}%</td>*}
    <td>{$stat.sebesseg|b_to_s}/s</td>
    <td>{$stat.no_ingyen|b_to_s}</td>
    <td>{$stat.ingyen|b_to_s}</td>
    <td>{$stat.ossz|b_to_s}</td>
  </tr>
</table>


<p>&nbsp;</p>
<div class="bar_rect">

  <div class="option_text">
    <div align="left">
        <div align="center">A server fut : &nbsp;&nbsp;<span class="option_votes"> </span>({$stat.futasido})<br/> &nbsp;
        </div>

        A FrontEnd szerver terhelts&eacute;ge  : &nbsp;&nbsp;<span class="option_votes"> ({$cpu_arany}%)</span></div>
  </div>
  <div class="option_bar" style="width: {$cpu_width}px;"></div>
  <div class="option_votes">&nbsp;</div>
  <div class="option_text">Adatb&aacute;zis szerver terhel&eacute;se  : &nbsp;&nbsp;<span class="option_votes"> ({$ram_arany}%)</span></div>

  <div class="option_bar" style="width: {$ram_width}px;"></div>
  <div class="option_votes">&nbsp;</div>

</div>  

<br>


{'�ltal�nos statisztika, bannerek'|section_end}



{* a labresz csatolasa *}
{include file='labresz.tpl'}
