{include file='fejresz.tpl'}
{* a fejlec csatolasa *}



{* infopanel csatol�sa *}
{include file='infopanel.tpl'}


<div id="body">
	<div id="content">
	{foreach from=$OLDAL key=i item=ertek}{$ertek}{/foreach}
	{*
		{'Felt�lt�tsi seg�dlet'|section_open}
			<h2 >Felt�lt�tsi seg�dlet</h2>
			<div class="rights">
				{$segedlet.text}
			</div>
			{if adminlink==true}
			<div class="right">
				[ <a href="dokumentacio.php?mit=felt&mod=mod&id={$segedlet.cid}" >szerkeszt�s</a> ]
			</div>
			{/if}
		{'Felt�lt�tsi seg�dlet'|section_end}
	*}
	
	{'Felt�lt�s'|section_open}
	<div id="upload_left">
		<form method="post" action="feltolt.php" enctype="multipart/form-data" name="uploadform">
			<h2 >�ltal�nos</h2>
			<div class="tenpx">
				<table>
					{if $keresName}
					<tr>
						<td colspan="3"><span class="red">A "{$keresName}" nev� k�r�s teljes�t�se!</span></td>
					</tr>
					{/if}
					<tr>
						<td><span id="req10" class="req">*</span></td>
						<td class="right"><label for="mezo10">Torrent n�v:</label></td>
						<td class="left">
							<input id="mezo10" name="tname" size="72" class="skinned" type="text" {if $keresName} value="{$keresName}" readonly="readonly"{/if} />
							{if $keresId}<input  name="keresId" type="hidden"  value="{$keresId}" />{/if}
						</td>
					</tr>

					<tr>
						<td><span  class="req">*</span></td>
						<td class="right"><label for="tcategory">Kateg�ria:</label></td>
						<td class="left">
							<select id="tcategory" name="tcategory" class="skinned" >
								{foreach from=$tipusok key=id  item=t}
								<option value="{$t.kid}">{$t.nev}</option>
								{/foreach}									
							</select>
							<span class="small">&nbsp;&nbsp;V�laszd a legink�bb a torrenthez ill� kateg�ri�t!</span>		
						</td>
					</tr>
					<tr>
						<td><span class="req">*</span></td>
						<td class="right">Scene torrent:</td>
						<td class="left">
							<label for="tsceneyes"><input id="tsceneyes" name="tcene" value="yes" checked="checked"  type="radio">Igen, eredeti, scene release</label>&nbsp;&nbsp;&nbsp;
							<label for="tsceneno"><input id="tsceneno" name="tcene" value="no"  type="radio">Nem scene release</label>
						</td>
					</tr>	
					<tr>
						<td colspan="3">						
							<span class="small">Eredeti "kiad�st" (scene release) tartalmaz-e a torrented? Ha nem v�ltoztattad meg a f�jlok szerkezet�t, t�m�r�t�s�t, illetve rendelkezel eredeti NFO f�jllal, v�laszd az <span class="highlight">igen</span>t, ellenkez� esetben a <span class="highlight">nem</span>et!</span>
						</td>
					<tr>
				</table>		
			</div>
			<br>
			
			<h2>F�jlok megad�sa</h2>	
			<div class="tenpx">						
				<table>
					<tr>
						<td><span id="req12"  class="req">*</span></td>
						<td class="right"><label for="tfile">Torrent f�jl:</label></td>
						<td class="left"><input id="mezo12" name="tfile" size="61" class="skinned"  type="file"></td>
					</tr>
					<tr>
						<td><span id="req1" class="req">*</span></td>		
						<td class="right"><label for="mezo1">NFO f�jl:</label></td>
						<td class="left"><input id="mezo1" name="tnfo" size="61" class="skinned"  type="file"></td>
					</tr>
					{*
						<tr>
							<td><span id="req2" class="notreq">*</span></td>
							<td class="right"><label for="ttinfo">Techinfo:</label></td>
							<td class="left"><input id="ttinfo" name="ttinfo" size="61" class="skinned" onchange="checkfilebyext('ttinfo','ntf')" type="file"></td>
						</tr>
					*}
					<tr>
						<td colspan="3">
							<span class="small">Az NFO mez�be csak eredeti .nfo kiterjeszt�s� f�jlt t�lts fel! </span>
						</td>
					<tr>							
				</table>
			</div>
			<br>
			
			<h2>Egy�b inform�ci�k</h2>
			<div class="tenpx">
				<table>
					<tr>
						<td><span id="req3" class="notreq">*</span></td>
						<td class="right"><label for="mezo3">Honlap vagy ismertet�:</label></td>
						<td class="left"><input id="mezo3" name="homepage" size="63" class="skinned" type="text"></td>
					</tr>
					<tr>
						<td><span id="req4" class="notreq">*</span></td>		
						<td class="right"><label for="mezo4">Megjelen�si �v/d�tum:</label></td>
						<td class="left"><input id="mezo4" name="year" size="63" class="skinned" type="text"></td>
					</tr>
					<tr>
						<td colspan="3">
							<span class="small">Amennyiben a torrented filmet tartalmaz, <a href="http://www.imdb.com/" target="_blank" title="Ugr�s">IMDB</a> linket adj meg (pl.: <a href="http://imdb.com/title/tt0121403/" target="_blank">http://imdb.com/title/tt0121403/</a>), minden m�s torrent t�pus eset�n megadhatsz hivatalos honlapot, inform�ci�s oldalt, stb..</span>
						</td>
					<tr>							
				</table>
			</div>
			<br>
			
			<h2>K�pek</h2>	
			<div class="tenpx">					
				<table>
					<tr>
						<td><span id="req5" class="notreq">*</span></td>
						<td class="right"><label for="mezo5">Els� k�p:</label></td>

						<td class="left"><input id="mezo5" name="pic1" size="72" class="skinned" type="text"></td>
					</tr>
					<tr>
						<td><span id="req6" class="notreq">*</span></td>
						<td class="right"><label for="mezo6">M�sodik k�p:</label></td>
						<td class="left"><input id="mezo6" name="pic2" size="72" class="skinned" type="text"></td>
					</tr>
					<tr>

						<td><span id="req7" class="notreq">*</span></td>
						<td class="right"><label for="mezo7">Harmadik k�p:</label></td>
						<td class="left"><input id="mezo7" name="pic3" size="72" class="skinned" type="text"></td>
					</tr>
					<tr>
						<td colspan="3">
							<span class="small">A mez�kbe egy-egy k�p <a href="http://hu.wikipedia.org/wiki/Webc%C3%ADm" target="_blank" title="Mi az az URL?">URL</a>-j�t �rd. K�peidet felt�ltheted az al�bbi k�pt�rhelyek egyik�re: <a href="http://www.imageshack.us/" target="_blank" title="Ugr�s">http://www.imageshack.us/</a>, <a href="http://upload.georgeownsme.com/" target="_blank" title="Ugr�s">http://upload.georgeownsme.com/</a> Mindh�rom mez�t t�ltsd ki!!</span>
						</td>
					<tr>							
				</table>
			</div>
			<br>
			
			<h2>N�vtelen felt�lt�s</h2>	
			<div class="tenpx">
				<table>
					<tr>
						<td>
							<input type="checkbox" name="anonymous" value="igen" id="anonymous" />
						</td>
						<td>
							<label for="anonymous">
								Ha ezt az opci�t v�lasztod, akkor a neved nem fog megjelenni a torrentn�l!
							</label>
						</td>
					</tr>
				</table>
			</div>
			<br />
			
		</div>
		<div id="upload_right">
			<h2 >Felt�lt�si seg�dlet</h2>
			<div class="tenpx">
				{$segedlet.text}
			</div>
			{* 
			{if adminlink==true}
			<div class="tenpx">
				[ <a href="dokumentacio.php?mit=felt&mod=mod&id={$segedlet.cid}" >szerkeszt�s</a> ] 
			</div>
			{/if}
			*}
		</div>


		<div style="clear:both"> &nbsp; </div>

			
		
		<h2>Megjegyz�sek</h2>
			<span class="small"><span class="red">Figyelem!</span> A torrent megjegyz�snek meg kell felelnie a <a href="/dokumentacio.php?mit=szab#cim_90" target="_blank" >szab�lyzatban le�rtaknak!</a></span> 
			<br />
			{include file='bbcode.tpl'}
			<div class="textarea"><textarea name="tnotes" id="box_content" rows="15" cols="144" style="width: 905px; height: 250px;">{$dat.text}</textarea></div>
			
			
			<br /><br />

			
		<h2>Kijelentem, hogy:</h2>
		<div class="rights">					
			<input class="required" id="rulesread" name="rulesread" value="yes" type="checkbox">&nbsp;<label for="rulesread">Elolvastam a <a href="dokumentacio.php?mit=szab" target="_blank">szab�lyzatot</a></label><br>
			<input class="required" id="rightsread" name="rightsread" value="yes" type="checkbox">&nbsp;<label for="rightsread">Elolvastam a <a href="dokumentacio.php?mit=gyik" target="_blank">jogi nyilatkozatot</a></label><br>
			<input class="required" id="illseed" name="illseed" value="yes" type="checkbox">&nbsp;<label for="illseed">A seedel�st azonnal megkezdem, �s legal�bb plusz egy seederig folytatom</label><br>
			<br />
			<div class="center"><img class="button" id="formkuld" src="kinezet/{$ipanel.smink}/btn_upload.png" alt="Felt�lt�s"></div>	
		</div>
	</form>	
	
	{'Felt�lt�s'|section_end}
	
	</div>
</div>
<script language="javascript" src="scriptek/feltolt.js"></script>
{* a labresz csatolasa *}
{include file='labresz.tpl'}