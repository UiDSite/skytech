{include file='fejresz.tpl'}
{* a fejlec csatolasa *}


<div id="body"><br />
	{foreach from=$OLDAL key=i item=ertek}
		{$ertek}
	{/foreach}
</div>




<div id="content" >
	
	{if $modul=='emlekez'}
	
	{'Eml�keztet�'|section_open}
		<form action="belep.php" method="post" >
			<div class="center">
				<p>Ha elfelejtetted volna jelszavad itt k�rhetsz �jat</p><br /> 
				<table class="stats skinned">
					<tr>
						<td>Felhaszn�l�i n�v:</td>
						<td><input type="text" name="{$formtoken}" size="20" class="skinned" /></td>
					</tr>
					<tr>
						<td>Email c�m:</td>
						<td><input type="text" name="emailcim"  size="20" class="skinned" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input name="submit" value="Ok" type="image" src="kinezet/alap/btn_ok.png"/></td>
					</tr>
				</table>
			</div>
		</form>
		
		<!--div class="center">
			Technikai okok miatt sz�netel minden e-mail k�ld�s.<br />
Legk�s�bb 2009.01.01. -re kijav�tjuk a hib�t.<br />

Meg�rt�seteket k�sz�nj�k: Sky-Tech Staff 
		</div-->
			
	{'Eml�keztet�'|section_end}
	
	{else}
	<div class="section" >
		<div class="section_header"><span class="section_expanded">Nem vagy bejelentkezve!</span></div>
		<div class="section_content" >
			<table style="width: 900px;">
				<tr>
					<td style="padding: 20px;">
						<div class="center">
							<h1>�dv�zl�nk a {$smarty.const.OLDAL_NEVE} oldal�n!</h1>
							<br/><br/>
							<p class="justify">Ez egy priv�t k�z�ss�gi oldal.<br/>
							Megtekint�se �s haszn�lata kiz�r�lag a k�z�ss�g tagjainak r�sz�re enged�lyezett!<br/><br/>
							Elfelejtetted a jelszavad? <a href="belep.php?emlekez=teto">Itt k�rhetsz �jat!</a> Az oldal haszn�lat�hoz a Cookie-kat enged�lyezned kell!<br/><br/></p>
						</div>
					</td>
					<td>
						<div class="dialog" style="width:270px;">
							<div class="dialog_header">
								<span class="dialog_title">Bejelentkez�s</span>
							</div>
							{if $hiba != ''}<span class="red">{$hiba}</span>{/if}
							<div class="dialog_contet" style="padding:7px;">
								<form method="post" action="belep.php" name="login" >
									<div class="leftcolumn" style="width: 97px;">Felhaszn�l�n�v:</div>
									<div class="rightcolumn"><input type="text" name="nev" size="20" class="skinned"/></div>
									<div class="leftcolumn" style="width: 97px;">Jelsz�:</div>
									{* <div class="rightcolumn"><input type="password" name="{$formtoken}" size="20" class="skinned" /></div> *}
									<div class="rightcolumn"><input type="password" name="jelszavacska" size="20" class="skinned" /></div>
									Cs�kkentett biztons�g� bejelentkez�s: <input type="checkbox" name="lowsecu"/><br /><br />
									<input value="Bejelentkez�s" name="submit" type="image" src="kinezet/alap/btn_login.png" />
									<a class="pic" href="regisztracio.php"><img border="0" src="kinezet/alap/btn_signup.png" alt="Regisztr�ci�" /></a>
								</form>
							</div>
						</div>						
					</td>
				</tr>
			</table>
		</div>
	</div>
	{/if}
	
	
	
</div>































<br>







{*
<script type="text/javascript" src="scriptek/belep.js"></script>
 a labresz csatolasa *}
{include file='labresz.tpl'}