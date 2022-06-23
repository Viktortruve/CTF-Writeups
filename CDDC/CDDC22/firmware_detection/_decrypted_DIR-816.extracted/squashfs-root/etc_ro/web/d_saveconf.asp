<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<title><#saveconf_000#></title>
<script>
var uploadClick=0;
function resetClick()
{
   if ( !confirm('<#saveconf_001#>') ) {
	return false;
  }
  else
	return true;
}
function sendClicked()
{
	if (document.getElementById("file").value == "") {
		alert('<#saveconf_002#>');
		return false;
	}
	
	if (!confirm('<#saveconf_003#>'))
		return false;
	else
	{
		if(uploadClick==0)
		{
			uploadClick=1;
		}
		else
		{
			alert("<#saveconf_004#>");
			return false;
		}
		return true;
	}
}

</script>

</head>
<body>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_128#>";
	SideItem="<#menu.ap_112#>";
	HelpItem="backuprestore";
</script>
<script type='text/javascript'>
	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>	

<table id=box_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#saveconf_000#></td>
	</tr>
	<tr>
		<td class=content>
			<p><#saveconf_005#>
            </p>
		</td>
	</tr>
</table>
<br>

<form action="/cgi-bin/ExportSettings.cgi" method=POST name="saveConfig">
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#saveconf_006#></td>
	</tr>
	<tr>
		<td class="content" align="center">
			<input type="submit" value="<#saveconf_007#>" name="submit.htm?saveconf.htm">
			<input type="hidden" name="tokenid" id="tokenid0" value="" >
		</td>
	</tr>
</table>  
</form>

<form action="/cgi-bin/upload_settings.cgi" method=POST enctype="multipart/form-data" name="upload">
<table id=body_header border=0 cellSpacing=0>
    <tr>
		<td class=topheader><#saveconf_008#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<input type="file" name="download image file" id='file'size=30>
			<input type="submit" value="<#saveconf_009#>" name="send" onClick="return sendClicked()">
			<INPUT TYPE="hidden" NAME="submit" VALUE="Send">
			<input type="hidden" name="tokenid" id="tokenid1" value="" >
		</td>
	</tr>
</table> 
<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_saveconf] tokenid ="+tokenid);
	
	for(var i=0;i<2;i++)
	    document.getElementById("tokenid"+i).setAttribute("value",tokenid);
</script>
</form>

<script type='text/javascript'>
	mainBodyEnd();
	ThirdRowEnd();
	Footer()
	mainTableEnd()
</script>

</blockquote>
</body>
</html>

