<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>

<title><#wlrepeater_step3_000#></title>
<script>
var lanip="<% getLanIp(); %>";
var lanmask="<% getLanNetmask(); %>";
function saveChanges()
{
	if (!checkIP(document.WlRepeaterFinish.ip))
	{
		alert("<#wlrepeater_step3_001#>");
		return false;
	}

	if (!checkMaskSpecial(document.WlRepeaterFinish.mask))
	{
		alert("<#wlrepeater_step3_002#>");
		return false;
	}
	if(document.WlRepeaterFinish.ip.value != lanip || document.WlRepeaterFinish.mask.value != lanmask)
	{	
		var msg="<#wlrepeater_step3_003#>";
		
		if (!confirm(msg))
			return false;
	}
	else
	{
		document.WlRepeaterFinish.action = "goform/form2RepeaterFinish.cgi";	
	}
	create_backmask();
	document.getElementById("loading").style.display="";	
	return true;
}
</script>

</head>
<body>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_126#>";
	SideItem="<#menu.ap_078#>";
	HelpItem="wlrepeater";
</script>
<script type='text/javascript'>
	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>

<form action="goform/form2lansetup.cgi" method=POST name="WlRepeaterFinish">
<table id="body_header" border=0 cellSpacing=0>
	<tr>
		<td class="topheader"><#wlrepeater_step3_000#></td>
	</tr>
	<tr>
		<td class=content>
			<p><#wlrepeater_step3_004#></p>
		</td>
	</tr>
	<tr>
		<td>
			<p style="color:red">
<#wlrepeater_step3_005#>
			</p>
		</td>
	</tr>
    <tr>
    	<td class="content" align="left">
        	<table class=formarea border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class=form_label_left><#wlrepeater_step3_006#></td>
					<td class=form_label_right><input type="text" name="ip" size="15" maxlength="15" value="<% getLanIp(); %>" ></td>
				</tr>
				<tr>
					<td class=form_label_left><#wlrepeater_step3_007#></td>
					<td class=form_label_right><input type="text" readonly="1"  name="mask" size="15" maxlength="15" value="<% getLanNetmask(); %>" ></td>
				</tr> 
			</table>
		</td>
	</tr>
</table>

	<p align=center>
	<input type=submit value="<#wlrepeater_step3_008#>" name=wlrepeaterfinish onClick="return saveChanges()">&nbsp;
	</p>
	 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
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

