<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>


<title><#wlwps_step2_000#></title>

<script>
var is_WPSEnabled="<% getCfgZero(1, "WscModeOption"); %>";
var is_WlanDisabled = '<% getCfgZero(1, "RadioOff"); %>';
var wscmethods = "<% getCfgGeneral(1, "WscConfMethods"); %>";
function check_pin_code(str)
{
	var i;
	var code_len;
		
	code_len = str.length;
	if (code_len != 8 && code_len != 4)
		return 1;

	for (i=0; i<code_len; i++) {
		if ((str.charAt(i) < '0') || (str.charAt(i) > '9'))
			return 2;
	}
	/*
	if (code_len == 8) {
		var code = parseInt(str, 10);
		if (!validate_pin_code(code))
			return 3;
		else
			return 0;
	}
	else
	*/
	return 0;
}
function setPinClicked(form)
{
	var ret;

	if(form.elements["peerPin"].disabled == true)
	{	
		alert('<#wlwps_step2_001#>');
		return false;
	}
	ret = check_pin_code(form.elements["peerPin"].value);
	if (ret == 1) {
		alert('<#wlwps_step2_002#>');
		form.peerPin.focus();		
		return false;
	}
	else if (ret == 2) {
		alert('<#wlwps_step2_003#>');
		form.peerPin.focus();		
		return false;
	}
	else if (ret == 3) {
		if ( !confirm('<#wlwps_step2_004#>') ) {
			form.peerPin.focus();
			return false;
  		}
	}	
	return true;
}
</script>

</head>


<body>

<blockquote>


<script language="JavaScript">

	TabHeader="<#menu.ap_126#>";
	SideItem="<#menu.ap_076#>";
	HelpItem="wlwps";
</script>

<script type='text/javascript'>

	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>


<form action="/goform/form2Wsc.cgi" method=POST name="formWsc">

	<table id=box_header border=0 cellSpacing=0>

		<tr>

			<td class=topheader>

				<#wlwps_step2_005#>
			</td>

		</tr>

		<tr>

			<td class=content>

				<p>

				  <#wlwps_step2_006#>
				</p>

			</td>

		</tr>

	</table>


	<table id=body_header border=0 cellSpacing=0>

	<tr>

		<td class=topheader>

			<#wlwps_step2_007#>
		</td>

	</tr>

	<tr>

		<td class=content align=center>

			<table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>	

				<tr>

					<td>

						<input type="radio" value="enable" name="pinmode" checked><#wlwps_step2_008#> 

					</td>

				</tr>

				<tr>

					<td width="60%" style="padding-left:25px;"><#wlwps_step2_009#></td>

					<td>

                        &nbsp&nbsp&nbsp&nbsp
					</td>

					<td>

						<span><#wlwps_step2_010#></span>

						<input type="text" name="peerPin" size="12" maxlength="8" value="">

					</td>

				</tr>

			</table>

		</td>

	</tr>

	</table>


	<p align=center>

	<input type="submit" value="<#wlwps_step2_011#>" name="setPIN"  onClick="return setPinClicked(document.formWsc)">

	</p>
   <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</form>


<script>
	if ((is_WPSEnabled == "0") || (is_WlanDisabled == "1") ||((wscmethods !="0x268c") &&(wscmethods !="0x238c")) )
	{
		disableTextField(document.formWsc.peerPin);disableButton(document.formWsc.setPIN);
	}
		

</script>


<script type='text/javascript'>

	mainBodyEnd();
	ThirdRowEnd();
	Footer();
	mainTableEnd();
</script>


</blockquote>

</body>


</html>



