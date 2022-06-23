<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<title>
 Wireless Router
</title>

<script>
var ModemVer="<% getCfgGeneral(1, "ModeName"); %>";
var HardwareVer="<% getCfgGeneral(1, "HardwareVer"); %>";
var FirmwareVer="<% getCfgGeneral(1, "FirmwareVer"); %>";
var lanip="192.168.1.1";
var lanmask="255.255.255.0";
function validateIP(ip, msg) {
 if (ip.value == "") {
  alert(msg + '<#wizard_step3_static_000#>');
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
  alert(msg + '<#wizard_step3_static_001#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (count != 3) {
  alert(msg + '<#wizard_step3_static_002#>');
  ip.focus();
  return false;
 }

 if (IsLoopBackIP(ip.value) == 1) {
  alert(msg + '<#wizard_step3_static_003#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }

 if (!checkDigitRange(ip.value, 1, 1, 223)) {
  alert(msg + '<#wizard_step3_static_004#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 2, 0, 255)) {
  alert(msg + '<#wizard_step3_static_005#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 3, 0, 255)) {
  alert(msg + '<#wizard_step3_static_006#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 4, 1, 254)) {
  alert(msg + '<#wizard_step3_static_007#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }

 return true;
}

function saveChanges()
{
 with(document.form2WizardStep3Static)
 {
  if (!validateIP(staip_ipaddr, "<#tcpiplan_dhcp_065#>")) {
   staip_ipaddr.focus();
   return false;
  }
  if (Lan1EqLan2(staip_ipaddr.value, lanmask, lanip, lanmask)) {
   alert("<#wizard_step3_static_008#>");
   staip_ipaddr.focus();
   return false;
  }
  if (staip_netmask.value != "") {
   if (!checkMask(staip_netmask)) {
    staip_netmask.focus();
    return false;
   }
   d1 = getDigit(staip_netmask.value, 1);
   d2 = getDigit(staip_netmask.value, 2);
   d3 = getDigit(staip_netmask.value, 3);
   d4 = getDigit(staip_netmask.value, 4);
   if ((d1 == 0) || (d4 == 254) || ((d1 == 255) && (d2 == 255) && (d3 == 255) && (d4 == 255))) {
    alert('<#wizard_step3_static_009#>');
    staip_netmask.focus();
    return false;
   }
  }

  if (!validateIP(staip_gateway, "默认路由地址")) {
   staip_gateway.focus();
   return false;
  }
  if (!Lan1EqLan2(staip_ipaddr.value, staip_netmask.value, staip_gateway.value, staip_netmask.value)) {
   alert("<#wizard_step3_static_010#>");
   staip_gateway.focus();
   return false;
  }

  if (staip_ipaddr.value == staip_gateway.value) {
   alert("<#wizard_step3_static_011#>");
   staip_gateway.focus();
   return false;
  }

  if (!validateIP(wan_dns1, "DNS 1")) {
   wan_dns1.focus();
   return false;
  }
  if (wantype.value == 0 && wan_dns1.value == staip_ipaddr.value) {
   alert("<#wizard_step3_static_012#>");
   wan_dns1.focus();
   return false;
  }
  if (Lan1EqLan2(wan_dns1.value, lanmask, lanip, lanmask)) {
   alert("<#wizard_step3_static_013#>");
   wan_dns1.focus();
   return false;
  }
  if (wan_dns2.value != "0.0.0.0") {

   if (!validateIP(wan_dns2, "DNS 2")) {
    wan_dns2.focus();
    return false;
   }
   if (wan_dns2.value == wan_dns1.value) {
    alert("<#wizard_step3_static_014#>");
    wan_dns2.focus();
    return false;
   }
   if (wantype.value == 0 && wan_dns2.value == staip_ipaddr.value) {
    alert("<#wizard_step3_static_015#>");
    wan_dns2.focus();
    return false;
   }
   if (Lan1EqLan2(wan_dns2.value, lanmask, lanip, lanmask)) {
    alert("<#wizard_step3_static_016#>");
    wan_dns2.focus();
    return false;
   }
  }
 }

 return true;
}
</script>
</head>
<body>
<div class="login">
<table class="productInfo" border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
  <td align="left" height="30" bgcolor="#404343" colspan="1">&nbsp;&nbsp;&nbsp;&nbsp;<#product_info_002#>
<script>
  document.write(ModemVer);
</script>
  </td>
  <td align="right" height="30" bgcolor="#404343" colspan="2"><#product_info_000#>
<script>
  document.write(HardwareVer);
</script>
&nbsp;&nbsp;&nbsp;&nbsp;<#product_info_001#>
<script>
  document.write(FirmwareVer);
</script>
  &nbsp;&nbsp;&nbsp;&nbsp;
  </td>
 </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
  <td align="left"><a href="http://www.dlink.com.tw/" target="_blank"><img src="d_head_01.gif" border="0"></a></td>
  <td background="d_head_02.gif" width="600"></td>
  <td align="right"><img src="d_head_03.gif"></td>
 </tr>
</table>
<br>
<br>
<br>
<form action="/goform/form2WizardStep3Static.cgi" method=POST name="form2WizardStep3Static">
<table width="502" cellspacing="0" cellpadding="0" border="0" align="center" class="setting_table">
 <tbody>
  <tr>
   <td width="500" valign="middle" align="left" class="wizard_title">
    <#wizard_step3_static_020#>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <table width="502" cellspacing="0" cellpadding="0" border="0">
     <tbody>
      <tr>
       <td colspan="2">
        <br>
        <table width="400" align="center" cellspacing="0" cellpadding="0" border="0"
        class="space">
         <tbody>
          <tr>
           <td>
            <#wizard_step3_static_021#>
           </td>
          </tr>
         </tbody>
        </table>
        <table width="400" align="center" border="0" class="space">
         <tbody>
          <tr>
           <td width="105">
            <#wizard_step3_static_022#>
           </td>
           <td width="285">
            <input type="text" maxlength="15" size="16" value="<% getWanIp(); %>" id="wanip" class="text" name="staip_ipaddr">
           </td>
          </tr>
          <tr>
           <td>
            <#wizard_step3_static_023#>
           </td>
           <td>
            <input type="text" maxlength="15" size="16" value="<% getWanNetmask(); %>" id="wanmask" class="text" name="staip_netmask">
           </td>
          </tr>
          <tr>
           <td>
            <#wizard_step3_static_024#>
           </td>
           <td>
            <input type="text" maxlength="15" size="16" value="<% getWanGateway(); %>" id="gateway" class="text" name="staip_gateway">
           </td>
          </tr>
          <tr>
           <td height="21">
            <#wizard_step3_static_025#>
           </td>
           <td>
<input type="text" name="wan_dns1" size="15" maxlength="15" disabled="true" value="<% getDns(1); %>"> 
           </td>
          </tr>
          <tr>
           <td>
            <#wizard_step3_static_027#>
           </td>
           <td>
<input type="text" name="wan_dns2" size="15" maxlength="15" disabled="true" value="<% getDns(2); %>"> 
            &nbsp;<#wizard_step3_static_026#>
           </td>
          </tr>
         </tbody>
        </table>
        <br>
       </td>
      </tr>
      <tr>
       <td width="207" height="30" class="wizard_tail">&nbsp;
        

       </td>
       <td width="293" align="right" class="wizard_tail">
        <input type="submit" name="wizardstep3static_back" value="<#wizard_step2_select_008#>">
        &nbsp;
        <input type="submit" name="wizardstep3static_next" value="<#wizard_step2_select_009#>" onClick="return saveChanges()">
        &nbsp;
       </td>
      </tr>
     </tbody>
    </table>
   </td>
  </tr>
 </tbody>
</table>
<input type="hidden" name="submit.htm?d_wizard_step3_static.asp" value="Send">
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</form>
<br>
<br>
<br>
<div class="loginBottom">
</div>
<div class="copywright">
<#copyright#></div>
</div>
<script>
enableTextField(document.form2WizardStep3Static.wan_dns1);
enableTextField(document.form2WizardStep3Static.wan_dns2);
</script>
</body>
</html>

