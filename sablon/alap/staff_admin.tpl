{if $modul=='staffLevelBovebb'}
	
	{foreach from=$levelek item=h name=level}		
	
		<div class="comment" >
			<div class="h">
				<span class="h">elk�ldve
					
					{if $smarty.foreach.level.first}	
						<a title="Userinfo"	href="userinfo.php?uid={$h.partner}">{$h.partner_nev}</a> 
						�ltal, ekkor: {$h.datum}
						- [<a href="#" onClick="return staffLevelTorol({$h.lid});">T�rl�s</a>]
						- [<a href="#" onClick="return staffLevelValasz( {$h.lid} , '{$h.targy}' , '#eredeiLevel_{$h.lid}' );">V�lasz</a>]
						<div id="eredeiLevel_{$h.lid}" style="display:none;">{$h.torzs}</div>
					{else}
						<a title="Userinfo"	href="userinfo.php?uid={$h.rendszer}">{$h.partner_nev}</a>
						�ltal, ekkor: {$h.datum}
					{/if}
					  
					
					
					
				</span>
			</div>			
			<div class="l">
				<div align="center">
					{if $smarty.foreach.level.first}
					<a class="pic" title="Userinfo" href="userinfo.php?uid={$h.luser}">
						<img class="avatar" border="1" src="{$h.luser_avatar}" alt=""/>
					</a>
					{else}
					<a class="pic" title="Userinfo" href="userinfo.php?uid={$h.rendszer}">
						<img class="avatar" border="1" src="{$h.rendszer_avatar}" alt=""/>
					</a>
					{/if}
				</div>
			</div>
			<div class="r">
				<div class="c">{$h.torzsKonvert}</div>
			</div>
			<div class="f"></div>
		</div>
		<div class="separator_center_long"></div>
	
	{/foreach}

{/if}