<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>


<title><#wlwps_step1_000#></title>

<script>

//WPS was disabled automatically because WPS2.0 has some restrictions to enable WPS
var encrypt=0;
var enable1x=0;
var wpa_auth=2;
var mode=0;
var is_adhoc=0;
var is_WPSLock=0;
var is_WPSEnabled="<% getCfg2Zero(1, "WscModeOption"); %>";
var isWPSLimit=0;
var is_WlanDisabled = '<% getCfg2Zero(1, "RadioOff"); %>';
var wscmethods = "<% getCfg2General(1, "WscConfMethods"); %>";

var warn_msg1='<#wlwps_step1_001#>';
var warn_msg2='<#wlwps_step1_002#>';
var warn_msg3="<#wlwps_step1_003#>";
var warn_msg4='<#wlwps_step1_004#>';				
var disable_all=0;

isClient=0;


if (mode == 0 || mode == 3)
	disable_all = check_wps_enc(encrypt, enable1x, wpa_auth);
if (disable_all == 0 && isWPSLimit == 1){
	disable_all = 4;
}else{
	disable_all = check_wps_wlanmode(mode, is_adhoc);
}

function showWPSEnable()
{	
	if (disable_all) {
		disableButton(document.formWsc.next);
	}
}
</script>

</head>


<body>

<blockquote>


<script language="JavaScript">

	TabHeader="<#menu.ap_130#>";
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


<form action="/goform/fform2Wl5Wsc.cgi" method=POST name="formWsc">

	<table id=box_header border=0 cellSpacing=0>

		<tr>

			<td class=topheader>

				<#wlwps_step1_005#>
			</td>

		</tr>

		<tr>

			<td class=content>

				<p>

				  <#wlwps_step1_006#>
				</p>

			</td>

		</tr>

	</table>


	<table id=body_header border=0 cellSpacing=0>

		<tr>

			<td class=topheader><#wlwps_step1_005#>

			</td>

		</tr>


		<tr>

			<td class=content>

				<b>

					<#wlwps_step1_007#>
				</b>

				<br>

				<p>

					<#wlwps_step1_008#>
				</p>

				<p>

					<#wlwps_step1_009#>
				</p>

				<p>

					<#wlwps_step1_010#>
				</p>

			</td>

		</tr>	

	</table>


	<p  align=center>

	<input type="button" value="<#wlwps_step1_011#>" name="next"  onclick="window.location.href='d_wl5wps_step2.asp'">

	</p>

	<script>

		if (disable_all) {
			document.write("<font size=2><em>");
			if (disable_all == 1)
				document.write(warn_msg1);
			else if (disable_all == 2)
				document.write(warn_msg2);
			else if (disable_all == 4)
				document.write(warn_msg4);
		}
		if ((is_WPSEnabled == "0") || (is_WlanDisabled == "1") ||((wscmethods !="0x268c") &&(wscmethods !="0x238c")) )
		{
			disableButton(document.formWsc.next);
		}
	</script>
	 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</form>


<script>

showWPSEnable();
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



