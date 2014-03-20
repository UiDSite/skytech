{if empty($fejlecek_torles)}{include file='fejresz.tpl'}
{* a fejlec csatolasa *}


{* infopanel csatol�sa *}
{include file='infopanel.tpl'}
{/if}
	{foreach from=$OLDAL key=i item=ertek}
		{$ertek}
	{/foreach}



{* szavazasok megjelen�t�se *}
{if $szavazasok}
	
	{'Szavaz�s'|section_open}
	{foreach from=$szavazasok key=i item=szavaz}
		<div class="center">
			<div class="poll">				
				<p><span class="big">{$szavaz.cim}</span><br><sup>{$szavaz.datum}</sup></p>
				<p><a href="szavazas.php" title="Kor�bbi szavaz�sok"><i>Kor�bbi szavaz�sok</i></a></p>
				<br>				
				{$szavaz.text}									
				<br>
			</div>
		</div>
		{if $szavaz.link}<div class="center">{$szavaz.link}</div>{/if}
		<br /><br />
	{/foreach}
	{'Szavaz�s'|section_end}

{/if}

{if empty($fejlecek_torles)}
{* a labresz csatolasa *}
{include file='labresz.tpl'}
{/if}