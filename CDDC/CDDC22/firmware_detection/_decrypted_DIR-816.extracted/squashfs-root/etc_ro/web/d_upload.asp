<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<title><#upload_000#></title>
<script>
var uploadClick=0;
function sendClicked()
{
	var upgrade_name = document.getElementById('download_image_file').value;
	if ( upgrade_name == "")
	{
		alert('<#upload_009#>');
		return false;
	}
	
	if (!confirm('<#upload_001#>'))
		return false;
	else
	{
		if(uploadClick==0)
		{
			uploadClick=1;
		}
		else
		{
			alert("<#upload_002#>");
			return false;
		}
		return true;
	}
}

</script>
</head>
<BODY>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_128#>";
	SideItem="<#menu.ap_111#>";
	HelpItem="firmwareupdate";
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
		<td class=topheader><#upload_000#></td>
	</tr>
	<tr>
		<td class=content>
			<p><#upload_003#>

 <p><#upload_004#>
            </p>
		</td>
	</tr>
</table>
<br>

<form action="/cgi-bin/upload.cgi" method=POST enctype="multipart/form-data" name="password">
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#upload_005#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<input type="file" id="download_image_file" name="download_image_file" size=60>
		</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;<input type="checkbox" name="resetdefault" value="nop" ><#upload_006#>
		</td>
	</tr>	
</table>
<br>
<p align=center>
<input type="submit" value="<#upload_007#>" name="send" onClick="return sendClicked()">&nbsp;&nbsp;
<input type="reset" value="<#upload_008#>" name="reset">
<INPUT TYPE="hidden" NAME="submit" VALUE="Send"> 
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</p>
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

