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

{*

{'Szavaz�s'|section_open}
                <div class="center">
                        <div class="poll">                              
                                <p><span class="big">{$szavaz.cim}</span><br><sup>{$szavaz.datum}</sup></p>
                                <p><a href="szavazas.php" title="Kor�bbi szavaz�sok"><i>Kor�bbi szavaz�sok</i></a></p>
                                <br>                            
                                {$szavaz.text}                                                                  
                                <br>
                        </div>
                </div>
                <br>
                {if $szavaz.link}<div class="center">{$szavaz.link}</div>{/if}


{'Szavaz�s'|section_end}

{ '�zen�fal'|section_open}
<div class="center"> 
        <div id="uzifal_doboz_nagy">
                <div id="uzifal_doboz">
                        <div id="uzifal">
                        </div>
                </div>
        </div>
        
        <div id="bevitel">
                <div style="width:100%;text-align:left;padding-left:10px;">
                        <h2>�zenet k�ld�s</h2>
                </div>
                <table width="95%">
                        <tr>
                                <td rowspan="2">
                                        <textarea id="chat_uzi" class="textarea" style="border:1px solid #726D5F;height:60px;width:330px;"></textarea>
                                </td>
                                <td colspan="2">
                                        <img src="kinezet/smilies/smile1.gif" title=":)" class="kat copy" />
                                        <img src="kinezet/smilies/wink.gif" title=";)" class="kat copy" />
                                        <img src="kinezet/smilies/grin.gif" title=":D" class="kat copy" />      
                                        <img src="kinezet/smilies/sad.gif" title=":(" class="kat copy" />       
                                        <img src="kinezet/smilies/cry.gif" title=":'(" class="kat copy" />      
                                        <img src="kinezet/smilies/laugh.gif" title=":lol:" class="kat copy" />
                                        <img src="kinezet/smilies/yes.gif" title=":yes:" class="kat copy" />    
                                        <img src="kinezet/smilies/no.gif" title=":no:" class="kat copy" />
                                        <img src="kinezet/smilies/question.gif" title=":?:" class="kat copy" /> 
                                        <img src="kinezet/smilies/excl.gif" title=":!:" class="kat copy" />                                             
                                </td>
                        </tr>   
                                
                                <td>
                                        <input  src="kinezet/{$ipanel.smink}/btn_send.png" type="image" id="kuldes" />
                                </td>
                        </table>
        </div>  
</div>
<script type="text/javascript">

var UZENOFAL_REFRESH_TIME = 4000;
</script>
<script language="javascript" type="text/javascript" src="scriptek/ajaxqueue.js"></script>
<script type="text/javascript" src="scriptek/uzifal.js"></script>

{'Chat'|section_end }


{$akt_user|section_open}

        <p>
                {foreach from=$user_list key=i item=u}
                        <a href="userinfo.php?uid={$u.uid}" title="Profil megtekint�se"><span class="rank{$u.rang}">{$u.name}</span>, </a>
                {/foreach}
        </p>



{'Akt�v user'|section_end}

*}
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
