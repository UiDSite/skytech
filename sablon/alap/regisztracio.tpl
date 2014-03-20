{include file='fejresz.tpl'}
{* a fejlec csatolasa *}


{if isset($uzi)}
	<div id="content">
	{$uzi}<br />
	</div>
{else}
		<div id="content">
			<div class="dialog" style="width: 510px;">
				<div class="dialog_header"><span class="dialog_title">Regisztr�ci�</span></div>
				<div class="dialog_content">
					{if isset($hiba)}
						<div class="error">
						{foreach from=$hiba key=i item=h}
							<span class="red">{$h}</span><br />
						{/foreach}
						</div><br />
					{/if}
				{if empty($uzi)}
					<form method="post" action="regisztracio.php" name="signup">
						<div class="leftcolumn" style="width: 160px;">A k�v�nt felhaszn�l�n�v:</div>
						<div class="rightcolumn"><input class="skinned" name="nu_name" size="50" type="text" value="{$form_value.name}"></div>
						<div class="leftcolumn" style="width: 160px;">�rv�nyes e-mail c�m:</div>
						<div class="rightcolumn"><input class="skinned" name="nu_email" size="50" type="text" value="{$form_value.email}" {if $form_value.marad==true}readonly="readonly"{/if}></div>
						<br>
						<p class="justify">
						<span >Figyelem! �rv�nyes e-mail c�met adj meg! A jelszavadat az itt megadott e-mail c�mre k�ld�tt lev�lban kapod meg! </span><br />
						<span class="red">NE haszn�lj  vipmail-es, hotmail-es  c�meket, mivel nem megkapod meg a meger�s�t� e-mailt( mivel spamnak �rz�keli ). Haszn�lj helyette gmail-t, citromail-t , freemail-t!</span></p>
						<br>
						<div class="leftcolumn" style="width: 160px;">Olvastam �s meg�rtettem:</div>
						<div class="rightcolumn">
							<input name="rules_read" value="OK" type="checkbox"> <a href="szab.html" target="blank">Szab�lyzat</a>
							<input name="faq_read" value="OK" type="checkbox"> <a href="gyik.html" target="blank">GY.I.K</a>
							<input name="rights_read" value="OK" type="checkbox"> <a href="jogi.html" target="blank">Jogi nyilatkozat</a>
						</div>
						<br>
						<input name="submit" value="Regisztr�ci�" src="kinezet/alap/btn_signup.png" type="image">
					</form>
				{else}
					<span class="red">{$uzi}</span>
				
				{/if}
				</div>
			</div>
		</div><br /><br />
{/if}		
{* a labresz csatolasa *}
{include file='labresz.tpl'}