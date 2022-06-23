<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#dmz_000#></title>
<script>
function IP2Num(ip)
{
    var num = 0;
    ip = ip.split(".");
    num = Number(ip[0]) * 256 * 256 * 256 + Number(ip[1]) * 256 * 256 + Number(ip[2]) * 256 + Number(ip[3]);
    num = num >>> 0;
    return num;
}
function saveClick()
{
    if (!document.formDMZ.DMZEnabled.checked)
	{
		create_backmask();
		document.getElementById("loading").style.display="";
		return true;
    }
   if (document.formDMZ.DMZIPAddress.value=="") {
  alert("<#dmz_001#>");
  document.formDMZ.DMZIPAddress.value = document.formDMZ.DMZIPAddress.defaultValue;
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
   if ( validateKey( document.formDMZ.DMZIPAddress.value ) == 0 ) {
  alert("<#dmz_002#>");
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
   var str=document.formDMZ.DMZIPAddress.value;
   var count=0;
   for (var i=0; i<str.length; i++)
  {
   if (str.charAt(i) == '.')
   {
    count++;
   }
 }
 if(count!=3)
 {
  alert("<#dmz_003#>");
  document.formDMZ.DMZIPAddress.focus();
  return false;
 }
   if ( !checkDigitRange(document.formDMZ.DMZIPAddress.value,1,1,223) ) {
   alert('<#dmz_004#>');
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
   if( IsLoopBackIP(document.formDMZ.DMZIPAddress.value))
   {
  alert('<#dmz_005#>');
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
   if ( !checkDigitRange(document.formDMZ.DMZIPAddress.value,2,0,255) ) {
   alert('<#dmz_006#>');
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
   if ( !checkDigitRange(document.formDMZ.DMZIPAddress.value,3,0,255) ) {
   alert('<#dmz_007#>');
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
   if ( !checkDigitRange(document.formDMZ.DMZIPAddress.value,4,1,254) ) {
   alert('<#dmz_008#>');
  document.formDMZ.DMZIPAddress.focus();
  return false;
   }
  var ip = IP2Num(document.formDMZ.DMZIPAddress.value);
  var gw = IP2Num(document.formDMZ.gateway_addr.value);
  var mask = IP2Num(document.formDMZ.gateway_mask.value);
  if(ip == gw)
  {
   alert('<#dmz_009#>');
   document.formDMZ.DMZIPAddress.focus();
   return false;
  }
  if((ip & mask) != (gw & mask))
  {
   alert('<#dmz_010#>');
   document.formDMZ.DMZIPAddress.focus();
   return false;
  }
	if (document.formDMZ.DMZEnabled.checked == true) {
		document.formDMZ.DMZEnabled.value = 1;
	}else {
		document.formDMZ.DMZEnabled.value = 0;
	}
  create_backmask();
  document.getElementById("loading").style.display="";
  return true;
}
function updateState()
{
	if (document.formDMZ.DMZEnabled.checked) {
		enableTextField(document.formDMZ.DMZIPAddress);
	}else {
		disableTextField(document.formDMZ.DMZIPAddress);
	}
}

function init()
{
	if (document.formDMZ.DMZEnabled.value == 1) {
		document.formDMZ.DMZEnabled.checked = true;
		enableTextField(document.formDMZ.DMZIPAddress);
	}
	else {
		document.formDMZ.DMZEnabled.checked = false;
		disableTextField(document.formDMZ.DMZIPAddress);
	}
}
</script>
<link href="d_stylemain.css" rel="stylesheet" type="text/css">
</head>
<body>
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_127#>";
 SideItem="DMZ";
 HelpItem="Dmz";
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
  <td class="topheader"><#dmz_011#></td>
 </tr>
 <tr>
  <td class="content">
   	<p>	<#dmz_012#>
		</p>
  </td>
 </tr>
</table>
<form action="/goform/formDMZ.cgi" method=POST name="formDMZ">
<table id="body_header" border="0" cellSpacing="0">
 <tr>
  <td class="topheader"><#dmz_013#></td>
 </tr>
 <tr>
  <td class="content" align="left">
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
   <tr>
     <td class="form_label_left">
      <input type="checkbox" name="DMZEnabled" value="<% getCfgGeneral(1,"DMZEnable"); %>" onclick="updateState()">
     </td>
     <td class="form_label_right"><#dmz_014#></td>
    </tr>
    <tr>
     <td class="form_label_left"><#dmz_015#></td>
     <td class="form_label_right">
      <input type="text" name="DMZIPAddress" size="15" maxlength="15" value="<% getCfgGeneral(1,"DMZIPAddress"); %>"></td>
    </tr>
    <tr>
     <td>
      <input style="display:none;" type="text" name="gateway_addr" size="15" maxlength="15" value="<% getCfgZero(1, "lan_ipaddr"); %>">
      <input style="display:none;" type="text" name="gateway_mask" size="15" maxlength="15" value="<% getCfgZero(1, "lan_netmask"); %>">
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<p align=center>
<INPUT TYPE="hidden" NAME="submit.asp?d_fw-dmz.asp" VALUE="Send">
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
<input class="input_submit" type="submit" value="<#dmz_016#>" name="save" onClick="return saveClick()">&nbsp;&nbsp;
<input class="input_reset" type="reset" value="<#dmz_017#>" name="reset">
</p>

<script>
	init();
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
