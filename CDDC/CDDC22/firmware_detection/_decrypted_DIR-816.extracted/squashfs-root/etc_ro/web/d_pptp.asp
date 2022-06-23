<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<title><#wan_eth_base_000#></title>
<SCRIPT>


var lanip="<% getLanIp(); %>";
var lanmask="<% getCfgGeneral(1, "lan_netmask"); %>";

function validateIP(ip, msg) {
 if (ip.value == "") {
  alert(msg + ' cannot be empty! It should be filled with 4 digit numbers as xxx.xxx.xxx.xxx.');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 var str = ip.value;
 var count = 0;
 for (var i = 0; i < str.length; i++) {
  if ((str.charAt(i) >= '0' && str.charAt(i) <= '9')) continue;
  if (str.charAt(i) == '.') {
   count++;
   continue;
  }
  alert('Invalid '+ msg+'value ! It should be the decimal number (0-9).');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (count != 3) {
  alert('Invalid '+ msg+'value. It should be filled with 4 digit numbers as xxx.xxx.xxx.xxx.');
  ip.focus();
  return false;
 }
 if (IsLoopBackIP(ip.value) == 1) {
  alert(msg + 'is invalid');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 1, 1, 223)) {
  alert(msg + 'has an invalid IP address range in 1st digit. It should be 1-223.');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 2, 0, 255)) {
  alert(msg + 'has an invalid IP address range in 2nd digit. It should be 0-255.');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 3, 0, 255)) {
  alert(msg + 'has an invalid IP address range in 3rd digit. It should be 0-255.');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 4, 1, 254)) {
  alert(msg + 'has an invalid IP address range in 4th digit. It should be 1-254.');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 return true;
}

function saveChanges()
{
	if(document.getElementById('pptp_enable').checked == true)
	{
		if ( !validateIP(document.pptp.pptp_server,"<#wan_pptp_004#>"))
		{
		       document.pptp.pptp_server.focus();
			    return false;
		}
		if(document.pptp.pptp_username.value == "") 
		{
			alert("<#wan_pptp_022#>");
			return false;
		}
		if(document.pptp.pptp_password.value == "" )
		{
			alert("<#wan_pptp_023#>");
			return false;
		}
	}
	if(document.getElementById('pptp_enable').checked == true)
	{
		document.pptp.pptp_enable.value= "1";
	}
	else
	{
		document.pptp.pptp_enable.value = "0";
	}

	if (!checkDigitRange(document.pptp.pptp_mtu.value, 1, 616, 1500))
	{
		alert("<#wan_l2tp_037#>"); //need to modify
		document.pptp.pptp_mtu.focus();
		return false;
	}

	/* not support now 
	if(document.getElementById('pptp_gw').checked == true)
	{
		document.pptp.pptp_gw.value= "1";
	}
	else
	{
		document.pptp.pptp_gw.value = "0";
	}
	 if (document.pptp.pptp_contype.selectedIndex == 0)
	 	document.pptp.pptp_contype.value = "auto";
	 else if(document.pptp.pptp_contype.selectedIndex == 1)
	 	document.pptp.pptp_contype.value = "pap";
	 else if(document.pptp.pptp_contype.selectedIndex == 2)
	 	document.pptp.pptp_contype.value = "chap";
	 else if(document.pptp.pptp_contype.selectedIndex == 3)
	 	document.pptp.pptp_contype.value = "chapmsv2";
	*/
	return true;
}
function resetClick()
{
 
}

function enableChanges()
{
	if(document.getElementById('pptp_enable').checked == true)
	{
		document.getElementById('pptp_block').style.display = '';
	}
	else
	{
		document.getElementById('pptp_block').style.display = 'none';
	}
}

function initValue()
{
	 var wmode = "<% getCfgGeneral(1, "wanConnectionMode"); %>";
	 var def_gw = "<% getCfgGeneral(1, "wan_pptp_defgw"); %>";
	 var contype= "<% getCfgGeneral(1, "wan_pptp_automode"); %>";
	if (wmode == "PPTP")
	{
		document.pptp.pptp_enable.checked = true;
		document.getElementById('pptp_status').style.display = '';
	}
	else
	{
		document.pptp.pptp_enable.checked = false;
		document.getElementById('pptp_status').style.display = 'none';
	}

	/* not support now 
	if (def_gw == "1")
	{
		document.pptp.pptp_gw.checked = true;
	}
	else
	{
		document.pptp.pptp_gw.checked = false;	
	}
	 if (contype == "auto")
	 	document.pptp.pptp_contype.selectedIndex = 0;
	 else if (contype == "pap")
	 	document.pptp.pptp_contype.selectedIndex = 1;
	 else if (contype == "chap")
	 	document.pptp.pptp_contype.selectedIndex = 2;
	 else if (contype == "chapmsv2")
	 	document.pptp.pptp_contype.selectedIndex = 3;
	*/
		enableChanges();
}
</SCRIPT>

</head>
<body onload="initValue();">
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_125#>";
 SideItem="<#menu.ap_134#>";
 HelpItem="pptp";
</script>
<script type='text/javascript'>
 mainTableStart();
 logo();
 TopNav();
 ThirdRowStart();
 Write_Item_Images();
 mainBodyStart();
</script>
<table id="box_header" border=0 cellSpacing=0>
 <tr>
  <td class="topheader"><#wan_pptp_000#></td>
 </tr>
 <tr>
  <td class="content">
   <p><#wan_pptp_001#></p>
  </td>
 </tr>
</table>
<form method=POST Action="/goform/form2Wanpptp.cgi" name="pptp">
<table id="body_header" border="0" cellSpacing="0">
 <tr>
  <td class="topheader"><#wan_pptp_002#></td>
 </tr>
 <tr>
  <td class="content" align="left">
     <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="pptp_on">
     <tr>
	     <td class="form_label_left"><#wan_pptp_003#></td>
	     <td class="form_label_right">
	     		<input type="checkbox" name="pptp_enable" id="pptp_enable" value="1" onClick="enableChanges()">
	     </td>
     </tr>
     </table>
     <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="pptp_block" style="display:none">
     <tr>
	     <td class="form_label_left"><#wan_pptp_004#></td>
	     <td class="form_label_right">
	      		<input type="text" name="pptp_server" size="31" maxlength="31" value="<% getCfgGeneral(1, "wan_pptp_server"); %>">
	     </td>
     </tr>
	 <!--
     <tr>
     		<td class="form_label_left"><#wan_pptp_005#></td>
     		<td class="form_label_right">
	      		<select name="pptp_contype">
			<option value="auto" selected ><#wan_pptp_009#></option>
			<option value="pap" ><#wan_pptp_010#></option>
			<option value="chap" ><#wan_pptp_011#></option>
			<option value="chapmsv2" ><#wan_pptp_012#></option>
			</select>
     		</td>
    </tr>
	-->
    <tr>
	     <td class="form_label_left"><#wan_pptp_006#></td>
	     <td class="form_label_right">
	      		<input type="text" name="pptp_username" size="31" maxlength="31" value="<% getCfgGeneral(1, "wan_pptp_user"); %>">
	     </td>
    </tr>
    <tr>
	     <td class="form_label_left"><#wan_pptp_007#></td>
	     <td class="form_label_right">
	      		 <input type="password"  name="pptp_password" size="31" maxlength="31" value="<% getCfgGeneral(1, "wan_pptp_pass"); %>">
            </td>
    </tr>
    <tr>
	     <td class="form_label_left"><#wan_pptp_008#></td>
	     <td class="form_label_right">
	     		<input type="checkbox" name="pptp_gw" value="1">
            </td>
    </tr>
    <tr>
	     <td class="form_label_left"><#wan_l2tp_023#></td>
	     <td class="form_label_right">
	     	<input type="text"  name="pptp_mtu" size="5" maxlength="5" value="<% getCfgGeneral(1, "wan_mtu"); %>">
            </td>
    </tr>

    </table>
  </td>
 </tr>
</table>
<br>
<p align=center>
<input type="submit" value="<#wan_pptp_018#>" name="save" onClick="return saveChanges()">&nbsp;&nbsp;
<input type="reset" value="<#wan_pptp_019#>" name="reset" onClick="resetClick()">

</p>
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#wan_pptp_013#></td>
	</tr>
	<tr>
    	<td class="content" align="left">
        	<table class="formlisting" border="0" cellpadding="0" cellspacing="0" width="500">
            	<tr class="form_label_row">
                	<td class="form_label_col"><#wan_pptp_014#></td>
                    <td class="form_label_col"><#wan_pptp_015#></td>
                    <td class="form_label_col"><#wan_pptp_016#></td>
                    <td class="form_label_col"><#wan_pptp_017#></td>
              </tr>
		<tr id="pptp_status" style="display:none">
		<td align=center bgcolor="#C0C0C0"><b>WAN</b></td>
		<td align=center bgcolor="#C0C0C0"><b>
		<script language="javascript">
		var PPTP="PPTP";
		var portStatus = "<% getPortStatus(); %>";
		  		var wanPort = new Array();
				wanPort = portStatus.split(",");
				if(wanPort[0] == "1")
					dw("<#wan_pptp_021#>(" + PPTP + ")");
				else
					dw("<#wan_pptp_020#>(" + PPTP + ")");
		</script>
		</b></td>
		<td align=center bgcolor="#C0C0C0"><b><% getWanIp(); %></b></td>
		<td align=center bgcolor="#C0C0C0"><b><% getWanGateway(); %></b></td>
		</tr>
		</table>
	</td>
	</tr>
</table>
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
 </form>
<script type="text/javascript">
   resetClick();
</script>
<script type='text/javascript'>
 mainBodyEnd();
 ThirdRowEnd();
 Footer()
 mainTableEnd()
</script>
</blockquote>
</body>
</html>

