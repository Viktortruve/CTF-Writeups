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
	if(document.l2tp.l2tp_session[0].checked == false) {
		 if ( !validateIP(document.l2tp.l2tp_lns_ip,"<#wan_l2tp_007#>"))
		{
		       document.l2tp.l2tp_lns_ip.focus();
			    return false;
		}
		if(document.l2tp.l2tp_username.value == "") 
		{
			alert("<#wan_l2tp_035#>");
			return false;
		}
		if(document.l2tp.l2tp_password.value == "" )
		{
			alert("<#wan_l2tp_036#>");
			return false;
		}
		/*
		if (!checkDigitRange(document.l2tp.l2tp_lns_port.value, 1, 1, 65535))
	       {
		        alert("<#wan_l2tp_039#>");
		        document.l2tp.l2tp_lns_port.focus();
		        return false;
	       }
	       if (!checkDigitRange(document.l2tp.l2tp_idle_time.value, 1, 1, 65535))
	       {
		        alert("<#wan_l2tp_038#>");
		        document.l2tp.l2tp_idle_time.focus();
		        return false;
	       }
		   */
		   if (!checkDigitRange(document.l2tp.l2tp_mtu.value, 1, 616, 1500))
	       {
		        alert("<#wan_l2tp_037#>");
		        document.l2tp.l2tp_mtu.focus();
		        return false;
	       }

       }
	   /*
	 if (document.l2tp.l2tp_authcontype.selectedIndex == 0)
	 	document.l2tp.l2tp_authcontype.value = "auto";
	 else if(document.l2tp.l2tp_authcontype.selectedIndex == 1)
	 	document.l2tp.l2tp_authcontype.value = "pap";
	 else if(document.l2tp.l2tp_authcontype.selectedIndex == 2)
	 	document.l2tp.l2tp_authcontype.value = "chap";
	 else if(document.l2tp.l2tp_authcontype.selectedIndex == 3)
	 	document.l2tp.l2tp_authcontype.value = "none";

	 if (document.l2tp.l2tp_contype.selectedIndex == 0)
	 	document.l2tp.l2tp_contype.value = "0";
	 else 
	 	document.l2tp.l2tp_contype.value = "1";
	*/
	if(document.l2tp.l2tp_session[0].checked == true) {
		document.l2tp.l2tp_session.value = 0;
	} else {
		document.l2tp.l2tp_session.value = 1;
	}
	/*
	if(document.l2tp.l2tp_NAPT[0].checked == true) {
		document.l2tp.l2tp_NAPT.value = 0;
	} else {
		document.l2tp.l2tp_NAPT.value = 1;
	}

	if(document.l2tp.l2tp_df_route[0].checked == true) {
		document.l2tp.l2tp_df_route.value = 0;
	} else {
		document.l2tp.l2tp_df_route.value = 1;
	}
	*/
	 return true;
}
function resetClick()
{
  
}



function OnRefresh()
{
	document.location.href='d_l2tp.asp';
}


function initValue()
{

	var wmode = "<% getCfgGeneral(1, "wanConnectionMode"); %>";
	var opmode = "<% getCfgGeneral(1, "wan_l2tp_opmode"); %>";
	var session_en= "<% getCfgGeneral(1, "wan_l2tp_session"); %>";
	var napt_en= "<% getCfgGeneral(1, "wan_l2tp_napt"); %>";
	var dfroute_en= "<% getCfgGeneral(1, "wan_l2tp_dfroute"); %>";
	var contype= "<% getCfgGeneral(1, "wan_l2tp_automode"); %>";

	if (wmode == "L2TP")
	{
		document.getElementById('l2tp_status').style.display = '';
	}
	else
	{
		document.getElementById('l2tp_status').style.display = 'none';
	}
	if(session_en == "1") {
		document.l2tp.l2tp_session[1].checked = true;
	} else {
	  document.l2tp.l2tp_session[0].checked = true;
	}
	
	/*
	if (opmode == "KeepAlive")
	{
		document.l2tp.l2tp_contype.value = "0";
	}
	else
	{
		document.l2tp.l2tp_contype.value = "1";	
	}

	if(napt_en == "1") {
		document.l2tp.l2tp_NAPT[1].checked = true;
	} else {
	  document.l2tp.l2tp_NAPT[0].checked = true;
	}
	if(dfroute_en == "1") {
		document.l2tp.l2tp_df_route[1].checked = true;
	} else {
	  document.l2tp.l2tp_df_route[0].checked = true;
	}

	 if (contype == "auto")
	 	document.l2tp.l2tp_authcontype.selectedIndex = 0;
	 else if (contype == "pap")
	 	document.l2tp.l2tp_authcontype.selectedIndex = 1;
	 else if (contype == "chap")
	 	document.l2tp.l2tp_authcontype.selectedIndex = 2;
	 else if (contype == "none")
	 	document.l2tp.l2tp_authcontype.selectedIndex = 3;
	*/
}
</SCRIPT>

</head>
<body onload="initValue();">
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_125#>";
 SideItem="<#menu.ap_135#>";
 HelpItem="l2tp";
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
  <td class="topheader"><#wan_l2tp_000#></td>
 </tr>
 <tr>
  <td class="content">
   <p><#wan_l2tp_001#></p>
  </td>
 </tr>
</table>
<form method=POST Action="/goform/form2Wanl2tp.cgi" name="l2tp">
<table id="body_header" border="0" cellSpacing="0">
 <tr>
  <td class="topheader"><#wan_l2tp_002#></td>
 </tr>
 <tr>
  <td class="content" align="left">
     <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="l2tp_block">
     <tr>
	     <td class="form_label_left"><#wan_l2tp_003#></td>
	     <td class="form_label_right">
	     		<input type="radio" name="l2tp_session" value="0"><#wan_l2tp_004#>&nbsp;&nbsp;
			<input type="radio" name="l2tp_session" value="1"><#wan_l2tp_005#></td>
	     </td>
     </tr>
     <tr>
	     <td class="form_label_left"><#wan_l2tp_006#></td>
	     <td class="form_label_right">
	      		<input type="text" name="l2tp_name" size="31" maxlength="31" value="<% getCfgGeneral(1, "wan_l2tp_nam"); %>">
	     </td>
     </tr>
     <tr>
	     <td class="form_label_left"><#wan_l2tp_007#></td>
	     <td class="form_label_right">
	      		<input type="text" name="l2tp_lns_ip" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_l2tp_server"); %>">
	     </td>
     </tr>
	<!--	
     <tr>
	     <td class="form_label_left"><#wan_l2tp_008#></td>
	     <td class="form_label_right">
	      		<input type="text" name="l2tp_lns_port" size="5" maxlength="5" value="<% getCfgGeneral(1, "wan_l2tp_lns_port"); %>">
	     </td>
     </tr>
	 <tr>
     		<td class="form_label_left"><#wan_l2tp_009#></td>
     		<td class="form_label_right">
	      		<select name="l2tp_authcontype">
			<option value="auto" selected ><#wan_l2tp_010#></option>
			<option value="pap" ><#wan_l2tp_011#></option>
			<option value="chap" ><#wan_l2tp_012#></option>
			<option value="none" ><#wan_l2tp_013#></option>
			</select>
     		</td>
    </tr>
	-->
    <tr>
	     <td class="form_label_left"><#wan_l2tp_014#></td>
	     <td class="form_label_right">
	      		<input type="text" name="l2tp_username" size="31" maxlength="31" value="<% getCfgGeneral(1, "wan_l2tp_user"); %>">
	     </td>
    </tr>
    <tr>
	     <td class="form_label_left"><#wan_l2tp_015#></td>
	     <td class="form_label_right">
	      		 <input type="password"  name="l2tp_password" size="31" maxlength="31" value="<% getCfgGeneral(1, "wan_l2tp_pass"); %>">
            </td>
    </tr>
	<!--
	<tr>
     		<td class="form_label_left"><#wan_l2tp_016#></td>
     		<td class="form_label_right">
	      		<select name="l2tp_contype">
			<option value="0" selected ><#wan_l2tp_017#></option>
			<option value="1" ><#wan_l2tp_018#></option>
			<option value="2" ><#wan_l2tp_019#></option>
			</select>
     		</td>
    </tr>
    <tr>
	     <td class="form_label_left"><#wan_l2tp_020#></td>
	     <td class="form_label_right">
	     	<input type="text"  name="l2tp_idle_time" size="5" maxlength="5" value="<% getCfgGeneral(1, "wan_l2tp_optime"); %>">
            </td>
    </tr>
    <tr>
     		<td class="form_label_left"><#wan_l2tp_021#></td>
     		<td class="form_label_right">
	      		<input type="radio" name="l2tp_NAPT" value="0"><#wan_l2tp_004#>&nbsp;&nbsp;
			<input type="radio" name="l2tp_NAPT" value="1"><#wan_l2tp_005#></td>
     		</td>
    </tr>
	-->
    <tr>
     		<td class="form_label_left"><#wan_l2tp_022#></td>
     		<td class="form_label_right">
	      		<input type="radio" name="l2tp_df_route" value="0"><#wan_l2tp_004#>&nbsp;&nbsp;
			<input type="radio" name="l2tp_df_route" value="1"><#wan_l2tp_005#></td>
     		</td>
    </tr>

    <tr>
	     <td class="form_label_left"><#wan_l2tp_023#></td>
	     <td class="form_label_right">
	     	<input type="text"  name="l2tp_mtu" size="5" maxlength="5" value="<% getCfgGeneral(1, "wan_mtu"); %>">
            </td>
    </tr>
    </table>
  </td>
 </tr>
</table>
<br>
<p align=center>
<input type="submit" value="<#wan_l2tp_024#>" name="save" onClick="return saveChanges()">&nbsp;&nbsp;
<input type="reset" value="<#wan_l2tp_025#>" name="reset" onClick="resetClick()">

</p>
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#wan_l2tp_026#></td>
	</tr>
	<tr>
    	<td class="content" align="left">
        	<table class="formlisting" border="0" cellpadding="0" cellspacing="0" width="500">
            	<tr class="form_label_row">
                	<td class="form_label_col"><#wan_l2tp_027#></td>
                    <td class="form_label_col"><#wan_l2tp_028#></td>
                    <td class="form_label_col"><#wan_l2tp_029#></td>
                    <td class="form_label_col"><#wan_l2tp_030#></td>
                    <td class="form_label_col"><#wan_l2tp_031#></td> 
               </tr>
		<tr id="l2tp_status" style="display:none">
		<td align=center bgcolor="#C0C0C0"><b><% getCfgGeneral(1, "wan_l2tp_nam"); %></b></td>
		<td align=center bgcolor="#C0C0C0"><b>WAN</b></td>
		<td align=center bgcolor="#C0C0C0"><b><% getWanIp(); %></b></td>
		<td align=center bgcolor="#C0C0C0"><b><% getWanGateway(); %></b></td>
		<td align=center bgcolor="#C0C0C0"><b>
		<script language="javascript">	
		var L2TP="L2TP";
		var portStatus = "<% getPortStatus(); %>";
		  		var wanPort = new Array();
				wanPort = portStatus.split(",");
				if(wanPort[0] == "1")
					dw("<#wan_l2tp_034#>");
				else
					dw("<#wan_l2tp_033#>");
		</script>
		</b></td>
		</tr>
		</table>
	</td>
	</tr>
</table>
<br>
<p align=center>
<input type="button" value="<#wan_l2tp_032#>" name="refresh" onClick="OnRefresh();">&nbsp;&nbsp;
</p>
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
