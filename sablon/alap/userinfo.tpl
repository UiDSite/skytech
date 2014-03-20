{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	
{if isset($user_neve)}
	
	
	{$user_neve|section_open}
		
		{include file='userinfo_tabi.tpl'}
		
	{'userinfo'|section_end}
	
	{if $warn }
		
		{'Figyelmeztet�s'|section_open}
		
			<div class="center">
				<table style="text-align:left;">
					<tr>
						<td rowspan="3" width="100"><img src="kinezet/{$ipanel.smink}/warned.png" class="pic" /></td>
						<td width="100" >Kiosztva</td>
						<td >{$warn.datum}</td>
					</tr>
					<tr>
						<td>Lej�r</td>
						<td>{$warn.lejar}</td>
					</tr>
					<tr>
						<td>Ok</td>
						<td>{$warn.text}</td>
					</tr>
				
				</table>
			</div>
		
		{'figyu'|section_end}
	{/if}
	
	
	{if !empty($ladad.ladad)}
		{$ladad.ladad|section_open}
		<br />
		{$ladad.ladad_text}
		<br />
		{'ladad'|section_end}
	{/if}
	
	
	
	{if count($aktivtorrent)>0}
	<h2>&nbsp;&nbsp;Akt�v torrentek</h2>
	<table class="torrents" >
		<tr class="t_head">
			<td class="t_head_icon"><a href="#" title="Rendez�s t�pus szerint">T�pus</a></td>
			<td class="t_head_name"><a href="#" title="Rendez�s n�v szerint">N�v</a></td>
			<td class="t_head_down"><a href="#" title="Rendez�s a befejezett let�lt�sek sz�ma szerint">DL</a></td>
			<td class="t_head_meret"><a href="#" title="Rendez�s a m�rete szerint">M�ret</a></td>
			<td class="t_head_sele"><a href="#" title="Rendez�s a seederek sz�ma szerint">S</a>/<a href="#" title="Rendez�s a leecherek sz�ma szerint">L</a></td>
			<td class="t_head_upby"><a href="#" title="Rendez�s a felt�lt� neve szerint">Felt�lt�tte</a></td>
		</tr>	
		{foreach from=$aktivtorrent item=t key=k}
				{include file='torrent_tabi.tpl'}			
		{/foreach}
	</table><br /><br />
	{/if}
	
	{if count($sajattorrent)>0}	
	<h2>&nbsp;&nbsp;Felt�lt�tt torrentek</h2>
	<table class="torrents" >
		<tr class="t_head">
			<td class="t_head_icon"><a href="#" title="Rendez�s t�pus szerint">T�pus</a></td>
			<td class="t_head_name"><a href="#" title="Rendez�s n�v szerint">N�v</a></td>
			<td class="t_head_down"><a href="#" title="Rendez�s a befejezett let�lt�sek sz�ma szerint">DL</a></td>
			<td class="t_head_meret"><a href="#" title="Rendez�s a m�rete szerint">M�ret</a></td>
			<td class="t_head_sele"><a href="#" title="Rendez�s a seederek sz�ma szerint">S</a>/<a href="#" title="Rendez�s a leecherek sz�ma szerint">L</a></td>
			<td class="t_head_upby"><a href="#" title="Rendez�s a felt�lt� neve szerint">Felt�lt�tte</a></td>
		</tr>	
		{foreach from=$sajattorrent item=t key=k}
				{include file='torrent_tabi.tpl'}			
		{/foreach}
	</table><br /><br />	
	{/if}
	
	
{/if}
</div>


<script language="javascript" src="scriptek/letolt.js"></script>
{* a labresz csatolasa *}
{include file='labresz.tpl'}