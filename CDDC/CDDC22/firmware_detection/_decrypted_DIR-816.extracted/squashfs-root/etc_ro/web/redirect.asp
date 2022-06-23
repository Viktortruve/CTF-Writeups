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
var ModemVer='<% getCfgGeneral(1, "ProductModemVersion"); %>';
var HardwareVer='<% getCfgGeneral(1, "HardwareVersion"); %>';
var FirmwareVer='<% getCfgGeneral(1, "FirmwareVersion"); %>';
var statuscheckpppoeuser=<% GetStatusCheckPPPOEser(); %>;
var statusconnect = '<% getCfgGeneral(1, "wanConnectionMode"); %>';
var statuslink = '<% getPortStatus(); %>'.split(',');
</script>


<style type="text/css">
.wizard_step{
 background: #404343;
    width: 842px;
 margin: 0 auto;
}
.wizard_main{
 padding-bottom: 10px;
}
.wizard_main h2{
 text-align: left;
 color: #fff;
 font-size: 18px;
 padding: 0 60px;
 font-weight: normal;
}
.wizard_main h2 span{
 color: #ccc;
 font-size: 14px;
 padding-right: 10px;
}
.wizard_main h2 img{
 background: url(../images/line.jpg) repeat-x;
 width: 360px;
 height: 1px;
 padding-left: 10px;
}
.wizard_main h2 i{
 background: #ccc;
 width: 50px;
 height:20px
}
.image_01{
 background:url(../images/pc.jpg) 10px 0 no-repeat;
 width: 134px;
 height: 117px;
}
.image_02{
 background:url(../images/connect_yes.jpg) 5px 15px no-repeat;
 width: 114px;
 height: 117px;
}
.image_03{
 background:url(../images/route.jpg) no-repeat;
 width: 136px;
 height: 117px;
}
.image_04{
 background:url(../images/connect_no.jpg) 5px 15px no-repeat;
 width: 114px;
 height: 117px;
}
.image_05{
 background:url(../images/global_no.jpg) 10px 0 no-repeat;
 width: 136px;
 height: 117px;
}
.image_06{
 background:url(../images/global_yes.jpg) 10px 0 no-repeat;
 width: 136px;
 height: 117px;
}
.setting_title{
 background-color: #F56D23;
    color: #000;
 font-size: 14px;
    font-weight: bold;
    height: 25px;
    padding-left: 10px;
}
.setting_table_save{
 margin: 20px auto;
    width: 500px;
 text-align: left;
}
.setting_table_save tr{
 text-align: right;
}
.setting_table_save td{
 text-align: center;
}
.setting_table_save a{
 text-decoration: none;
 color: #fff;
 font-size: 14px;
}
.setting_table_save input{
 padding: 5px 20px;
 font-size: 14px;
}
.wizard_step{
 background: #404343;
    width: 842px;
 margin: 0 auto;
}
.setting_table_local{
 background: #d4d4d4;
 margin: 0 auto;
    width: 720px;
 text-align: left;
}
.setting_client{
 padding-left: 15px;
}
.wizard_title{
 background: #F56D23;
}
</style>
<script language="javascript">
function updateChanX()
{
 document.getElementById("id_checkpppoeuser").style.display = 'none';
 if(document.getElementById("connect_select").value=="PPPOE")
 {
  document.getElementById("connect_PPPoE").style.display = 'block';
  document.getElementById("connect_static").style.display = 'none';
  document.getElementById("wantype").innerText = 'PPPoE';
  document.getElementById("id_checkpppoeuser").style.display = 'block';
 }
 else if(document.getElementById("connect_select").value=="STATIC")
 {
  document.getElementById("connect_static").style.display = 'block';
  document.getElementById("connect_PPPoE").style.display = 'none';
  document.getElementById("wantype").innerText = 'Static';
 }
 else
 {
  document.getElementById("connect_PPPoE").style.display = 'none';
  document.getElementById("connect_static").style.display = 'none';
  document.getElementById("wantype").innerText = 'DHCP';
 }

	if ("<% getWPAEncode2g(1, "WPAPSK1"); %>" != "")
	{
		document.form2WizardSetup.tmp_wizardstep4_pskpwd_2.value = Base64.Decode("<% getWPAEncode2g(1, "WPAPSK1"); %>");
	}
	if ("<% getWPAEncode5g(1, "WPAPSK1"); %>" != "")
	{
		document.form2WizardSetup.tmp_wizardstep4_pskpwd_5.value = Base64.Decode("<% getWPAEncode5g(1, "WPAPSK1"); %>");
	}
}
function updateChan()
{
if(statusconnect == 'PPPOE')
{
	if ( '<% getCfgGeneral(1, "wan_pppoe_user_encode"); %>' != '')
	{
		document.form2WizardSetup.show_pppoe_usrname.value = Base64.Decode('<% getCfgGeneral(1, "wan_pppoe_user_encode"); %>');
	}
	
	document.form2WizardSetup.pppoe_psword.value = '<% getPPPoePass(); %>';
}else if(statusconnect == 'STATIC'){
	document.form2WizardSetup.staip_ipaddr.value = "<% getWanIp(); %>";
	document.form2WizardSetup.staip_netmask.value = "<% getWanNetmask(); %>";
	document.form2WizardSetup.staip_gateway.value = "<% getWanGateway(); %>";
	document.form2WizardSetup.wan_dns1.value = "<% getDns(1); %>";
	document.form2WizardSetup.wan_dns2.value = "<% getDns(2); %>";
}
 document.getElementById("connect_select").value = statusconnect;
 updateChanX();
}
var lanip="<% getLanIp(); %>";
var lanmask="<% getLanNetmask(); %>";
function validateIP(ip, msg) {
 msg=msg.replace("IP Address",'<#redirect_036#>')
		.replace("Default Gateway",'<#redirect_037#>')
		.replace("DNS Server 1",'<#redirect_038#>')
		.replace("DNS Server 2",'<#redirect_039#>');
 if (ip.value == "") {
  alert(msg + '<#redirect_040#>');
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
  alert('<#redirect_041#>'+ msg+'<#redirect_042#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (count != 3) {
  alert('<#redirect_041#>'+ msg+'<#redirect_043#>');
  ip.focus();
  return false;
 }
 if (IsLoopBackIP(ip.value) == 1) {
  alert('<#redirect_041#>'+msg);
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 1, 1, 223)) {
  alert('<#redirect_041#>'+ msg + '<#redirect_044#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 2, 0, 255)) {
  alert('<#redirect_041#>'+ msg + '<#redirect_045#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 3, 0, 255)) {
  alert('<#redirect_041#>'+ msg + '<#redirect_046#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if (!checkDigitRange(ip.value, 4, 1, 254)) {
  alert('<#redirect_041#>'+ msg + '<#redirect_047#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 return true;
}
function includeSpace(str)
{
  for (var i=0; i<str.length; i++) {
   if ( str.charAt(i) == ' ' ) {
   return true;
 }
  }
  return false;
}

function includeChinese(str)
{
 for (var i=0; i<str.length; i++) {
  if (str.charCodeAt(i) > 128) {
   return true;
  }
 }
 return false;
}
function saveChanges()
{
 with(document.form2WizardSetup)
 {
  if(document.getElementById("connect_select").value=="STATIC")
  {
   if (!validateIP(staip_ipaddr, "IP Address")) {
    staip_ipaddr.focus();
    return false;
   }
   if (Lan1EqLan2(staip_ipaddr.value, lanmask, lanip, lanmask)) {
    alert("<#redirect_048#>");
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
     alert("<#redirect_049#>");
     staip_netmask.focus();
     return false;
    }
   }
   if (!validateIP(staip_gateway, "Default Gateway")) {
    staip_gateway.focus();
    return false;
   }
   if (!Lan1EqLan2(staip_ipaddr.value, staip_netmask.value, staip_gateway.value, staip_netmask.value)) {
    alert("<#redirect_050#>");
    staip_gateway.focus();
    return false;
   }
   if (staip_ipaddr.value == staip_gateway.value) {
    alert("<#redirect_051#>");
    staip_gateway.focus();
    return false;
   }
   if (!validateIP(wan_dns1, "DNS Server 1")) {
    wan_dns1.focus();
    return false;
   }
   if (wan_dns1.value == staip_ipaddr.value) {
    alert("<#redirect_052#>");
    wan_dns1.focus();
    return false;
   }
   if (Lan1EqLan2(wan_dns1.value, lanmask, lanip, lanmask)) {
    alert("<#redirect_053#>");
    wan_dns1.focus();
    return false;
   }
   if (wan_dns2.value != "0.0.0.0") {
    if (!validateIP(wan_dns2, "DNS Server 2")) {
     wan_dns2.focus();
     return false;
    }
    if (wan_dns2.value == wan_dns1.value) {
     alert("<#redirect_054#>");
     wan_dns2.focus();
     return false;
    }
    if (wan_dns2.value == staip_ipaddr.value) {
     alert("<#redirect_055#>");
     wan_dns2.focus();
     return false;
    }
    if (Lan1EqLan2(wan_dns2.value, lanmask, lanip, lanmask)) {
     alert("<#redirect_056#>");
     wan_dns2.focus();
     return false;
    }
   }
  }
  else if(document.getElementById("connect_select").value=="PPPOE")
  {
   if(show_pppoe_usrname.value.length == 0)
   {
    alert("<#redirect_057#>");
    show_pppoe_usrname.focus();
    return false;
   }
   else
   {
    if(!checkSpecialChar(show_pppoe_usrname.value, 1))
    {
     alert('<#redirect_058#>');
     show_pppoe_usrname.focus();
     return false;
    }
   }
   if(pppoe_psword.value.length == 0)
   {
    alert("<#redirect_059#>");
    pppoe_psword.focus();
    return false;
   }
   else
   {
    if(!checkSpecialChar(pppoe_psword.value, 1))
    {
     alert('<#redirect_060#>');
     pppoe_psword.focus();
     return false;
    }
   }
  }

  if(includeSpecialKey(wizardstep4_ssid_2.value))
  {
   alert('<#redirect_061#>');
   wizardstep4_ssid_2.focus();
   return false;
  }
	if(includeChinese(wizardstep4_ssid_2.value))
	{
		alert('<#redirect_071#>');
		wizardstep4_ssid_2.focus();
		return false;
	}
  var str = tmp_wizardstep4_pskpwd_2.value;
  if (str.length != 64)
  {
   if (str.length > 0 && str.length < 8)
   {
    alert('<#redirect_062#>');
    tmp_wizardstep4_pskpwd_2.focus();
    return false;
   }
   if (str.length > 63)
   {
    alert('<#redirect_063#>');
    tmp_wizardstep4_pskpwd_2.focus();
    return false;
   }
   if(includeSpecialKey(str))
   {
    alert('<#redirect_065#>');
	tmp_wizardstep4_pskpwd_2.focus();
    return false;
   }
   if(includeChinese(str))
   {
    alert('<#redirect_072#>');
	tmp_wizardstep4_pskpwd_2.focus();
    return false;
   }
  }
  else
  {
   for (var i=0; i<str.length; i++)
   {
    if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) >= 'a' && str.charAt(i) <= 'f') || (str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
    {
     continue;
    }
    alert("<#redirect_064#>");
    tmp_wizardstep4_pskpwd_2.focus();
    return false;
   }
  }

  //5g
  if(includeSpecialKey(wizardstep4_ssid_5.value))
  {
   alert('<#redirect_061#>');
   wizardstep4_ssid_5.focus();
   return false;
  }
	if(includeChinese(wizardstep4_ssid_5.value))
	{
		alert('<#redirect_071#>');
		wizardstep4_ssid_5.focus();
		return false;
	}

  var str = tmp_wizardstep4_pskpwd_5.value;
  if (str.length != 64)
  {
   if (str.length > 0 && str.length < 8)
   {
    alert('<#redirect_062#>');
    tmp_wizardstep4_pskpwd_5.focus();
    return false;
   }
   if (str.length > 63)
   {
    alert('<#redirect_063#>');
    tmp_wizardstep4_pskpwd_5.focus();
    return false;
   }
   if(includeSpecialKey(str))
   {
    alert('<#redirect_065#>');
	tmp_wizardstep4_pskpwd_5.focus();
    return false;
   }
   if(includeChinese(str))
   {
    alert('<#redirect_072#>');
	tmp_wizardstep4_pskpwd_5.focus();
    return false;
   }
  }
  else
  {
   for (var i=0; i<str.length; i++)
   {
    if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) >= 'a' && str.charAt(i) <= 'f') || (str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
    {
     continue;
    }
    alert("<#redirect_064#>");
    tmp_wizardstep4_pskpwd_5.focus();
    return false;
   }
  }
  
   if ( tmp_wizardstep4_pskpwd_2.value != "")
   {
		wizardstep4_pskpwd_2.value = Base64.Encode(tmp_wizardstep4_pskpwd_2.value);
   }
   if (tmp_wizardstep4_pskpwd_5.value != "")
   {
		wizardstep4_pskpwd_5.value = Base64.Encode(tmp_wizardstep4_pskpwd_5.value);
   }
   
   if ( show_pppoe_usrname.value != "")
   {
		pppoe_usrname.value = Base64.Encode(show_pppoe_usrname.value);
   }
   
	if (pppoe_psword.value != "" && pppoe_psword.value != "********" )
	{
		pppoe_psword.value = Base64.Encode(pppoe_psword.value);
	}

	show_pppoe_usrname.disabled = true;
	tmp_wizardstep4_pskpwd_2.disabled = true;
	tmp_wizardstep4_pskpwd_5.disabled = true;
  }

 document.form2WizardSetup.statuscheckpppoeuser.value = "0";
 document.form2WizardSetup.submit();
 return true;
}
var wtime;
function timerStart()
{
 if (wtime >= 0)
 {
  document.form2WizardSetup.checkpppoeuser.value = '<#redirect_069#>'+wtime+'<#redirect_070#>';
        document.form2WizardSetup.connecttype.disabled = true;
        document.form2WizardSetup.show_pppoe_usrname.disabled = true;
        document.form2WizardSetup.pppoe_psword.disabled = true;
        document.form2WizardSetup.wizardstep4_ssid_2.disabled = true;
        document.form2WizardSetup.tmp_wizardstep4_pskpwd_2.disabled = true;
        document.form2WizardSetup.wizardstep4_ssid_5.disabled = true;
        document.form2WizardSetup.tmp_wizardstep4_pskpwd_5.disabled = true;
        document.form2WizardSetup.checkpppoeuser.disabled = true;
  document.form2WizardSetup.save.disabled = true;
  wtime--;
  setTimeout("timerStart()",1000);
 }
 else
 {
        document.form2WizardSetup.connecttype.disabled = false;
        //document.form2WizardSetup.show_pppoe_usrname.disabled = false;
        document.form2WizardSetup.pppoe_psword.disabled = false;
        document.form2WizardSetup.wizardstep4_ssid_2.disabled = false;
        //document.form2WizardSetup.tmp_wizardstep4_pskpwd_2.disabled = false;
        document.form2WizardSetup.wizardstep4_ssid_5.disabled = false;
        //document.form2WizardSetup.tmp_wizardstep4_pskpwd_5.disabled = false;
		document.form2WizardSetup.checkpppoeuser.disabled = false;
  document.form2WizardSetup.save.disabled = false;
  document.form2WizardSetup.checkpppoeuser.value = "Account Check";
  document.form2WizardSetup.statuscheckpppoeuser.value = "2";

  if ( document.form2WizardSetup.tmp_wizardstep4_pskpwd_2.value != "")
   {
		document.form2WizardSetup.wizardstep4_pskpwd_2.value = Base64.Encode(document.form2WizardSetup.tmp_wizardstep4_pskpwd_2.value);
   }
   if (document.form2WizardSetup.tmp_wizardstep4_pskpwd_5.value != "")
   {
		document.form2WizardSetup.wizardstep4_pskpwd_5.value = Base64.Encode(document.form2WizardSetup.tmp_wizardstep4_pskpwd_5.value);
   }
   
   if ( document.form2WizardSetup.show_pppoe_usrname.value != "")
   {
		document.form2WizardSetup.pppoe_usrname.value = Base64.Encode(document.form2WizardSetup.show_pppoe_usrname.value);
   }
   if (document.form2WizardSetup.pppoe_psword.value != "" && document.form2WizardSetup.pppoe_psword.value != "********")
   {
		document.form2WizardSetup.pppoe_psword.value = Base64.Encode(document.form2WizardSetup.pppoe_psword.value);
   }
    	
  document.form2WizardSetup.submit();
 }
}
function pppoeSaveChanges()
{
 if(document.form2WizardSetup.show_pppoe_usrname.value.length == 0)
 {
  alert("<#redirect_066#>");
  document.form2WizardSetup.show_pppoe_usrname.focus();
  return false;
 }
 else
 {
  if(!checkSpecialChar(document.form2WizardSetup.show_pppoe_usrname.value, 1))
  {
   alert('<#redirect_067#>');
   document.form2WizardSetup.show_pppoe_usrname.focus();
   return false;
  }
 }
 if(document.form2WizardSetup.pppoe_psword.value.length == 0)
 {
  alert('<#redirect_066#>');
  document.form2WizardSetup.pppoe_psword.focus();
  return false;
 }
 else
 {
  if(!checkSpecialChar(document.form2WizardSetup.pppoe_psword.value, 1))
  {
   alert('<#redirect_068#>');
   document.form2WizardSetup.pppoe_psword.focus();
   return false;
  }
 }
 /*
 if(statuslink[0] == '0')
 {
  document.getElementById("id_noconnected").style.display = 'block';
  return false;
 }*/
 return true;
}
function onClickCheckPppoeUser()
{
 if(true == pppoeSaveChanges())
 {
  document.form2WizardSetup.statuscheckpppoeuser.value = "1";
  
  document.form2WizardSetup.pppoe_usrname.value = Base64.Encode(document.form2WizardSetup.show_pppoe_usrname.value);
  if (document.form2WizardSetup.pppoe_psword.value != "")
  {
	document.form2WizardSetup.pppoe_psword.value = Base64.Encode(document.form2WizardSetup.pppoe_psword.value);
  }
  
  document.form2WizardSetup.show_pppoe_usrname.disabled = true;
  document.form2WizardSetup.tmp_wizardstep4_pskpwd_2.disabled = true;
  document.form2WizardSetup.tmp_wizardstep4_pskpwd_5.disabled = true;
  
  document.form2WizardSetup.submit();
  
  return true;
 }
 else
 {
  return false;
 }
}
function postload()
{
 if('1' == document.form2WizardSetup.statuscheckpppoeuser.value)
 {
  wtime = 15;
  timerStart(); 
 }
// else if('11' == document.form2WizardSetup.statuscheckpppoeuser.value)
 else if('2' == document.form2WizardSetup.statuscheckpppoeuser.value)
 {
	if(statuslink[0] == '0')
	{  
		document.getElementById("id_noconnected").style.display = 'block';
	}				
 }
 else if('12' == document.form2WizardSetup.statuscheckpppoeuser.value)
 {
  document.getElementById("id_noack").style.display = 'block';
 }
 else if('13' == document.form2WizardSetup.statuscheckpppoeuser.value)
 {
  document.getElementById("id_notpass").style.display = 'block';
 }
 else if('14' == document.form2WizardSetup.statuscheckpppoeuser.value)
 {
  document.getElementById("id_wanclass").className = 'image_02';
  document.getElementById("id_pass").style.display = 'block';
 }
 else
 {
  document.form2WizardSetup.statuscheckpppoeuser.value = "0";
 }
 var internetip = document.getElementById("id_internetip").innerText;
 if(internetip.indexOf("0.0.0.0") < 0 )
 {
  document.getElementById("id_wanclass").className = 'image_02';
  document.getElementById("id_wanclass_global").className = 'image_06';
 }
 else
 {
  document.getElementById("id_wanclass").className = 'image_04';
  document.getElementById("id_wanclass_global").className = 'image_05';
 }

}
</script>
</head>
<body onload="updateChan()">
<div class="wizard_step">

<table border="0" cellpadding="0" cellspacing="0" width="980">
<table border="0" cellpadding="0" cellspacing="0">
	<tr class="top_product">
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
	<tr>
		<td align="left"><a href="http://www.dlink.com.tw/" target="_blank"><img src="../images/head_01.gif" border="0"></a></td>
        <td background="../images/head_02.gif" width="600"></td>
        <td align="right"><img src="../images/head_03.gif"></td>
	</tr>
</table>

<div class="wizard_main">
    <h2><#redirect_034#> <span><#redirect_035#></span><img src="../images/line.jpg"/></h2>
 <form action="/goform/dir_setWanWifi" method=POST name="form2WizardSetup">
    <table class="setting_table_local">
         <tr>
             <td align="center" width="134" class="setting_client" height="30"><#redirect_000#></td>
    <td align="center" width="114"> </td>
             <td align="center" width="136"><#redirect_001#></td>
    <td align="center" width="114"> </td>
             <td align="center" width="136"><#redirect_002#></td>
         </tr>
     </table>
     <table class="setting_table_local">
         <tr>
             <td class="image_01"></td>
             <td class="image_02"></td>
             <td class="image_03"></td>
             <td id="id_wanclass" class="image_04"></td>
             <td id="id_wanclass_global" class="image_05"></td>
         </tr>
     </table>
     <table class="setting_table_local">
         <tr>
             <td class="setting_client" width="280" height="30"><#redirect_003#>
<% getLanIp(); %>
</td>
             <td id="id_internetip" width="300"><#redirect_004#>
			 <!-- 192.168.0.1 0.0.0.0 -->
<% getWanIp(); %>
</td>
             <td id="wantype"><#redirect_005#></td>
         </tr>
     </table>
  <br>
     <table width="500" cellpadding="0" cellspacing="0" class="setting_table_local">
         <tr>
             <td class="setting_title"><#redirect_006#></td>
         </tr>
         <tr>
             <td class="wizard_main">
                 <table width="490" border="0" align="center" class="space">
                     <tr>
                         <br>
                         <td width="105"><#redirect_007#></td>
                         <td>
                             <select size="1" name="connecttype" onchange="updateChanX(this);" id="connect_select">
                                 <option value="PPPOE"><#redirect_008#></option>
                                 <option value="DHCP"><#redirect_009#></option>
                                 <option value="STATIC"><#redirect_010#></option>
                             </select>
                         </td>
                     </tr>
                 </table>
                 <table width="490" border="0" align="center" class="space" id="connect_PPPoE" style="display:block">
                     <tr>
                         <td width="105"><#redirect_011#></td>
                         <td>
        <input type="text" name="show_pppoe_usrname" maxlength="64" size="25" value="">
		<input type="hidden" name="pppoe_usrname" maxlength="64" size="25">
                         </td>
                     </tr>
                     <tr>
                         <td><#redirect_012#></td>
                         <td>
        <input type="password" name="pppoe_psword" maxlength="64" size="25" value="">
                         </td>
                     </tr>
     </table>
     <table width="490" border="0" align="center" id="id_checkpppoeuser" >
      <tr style="display:none">
       <td>
        <script>
        document.writeln('<input type=\"text\" name=\"statuscheckpppoeuser\" maxlength=\"64\" size=\"25\" value=\"'+statuscheckpppoeuser+'\">');
        </script>
       </td>
      </tr>
      <tr>
       <td>
        <input type="button" name="checkpppoeuser" value="<#redirect_013#>" onClick="return onClickCheckPppoeUser()">
       </td>
       <td id="id_noconnected" style="display:none">
        <p style="color:red"><#redirect_014#></p>
       </td>
       <td id="id_noack" style="display:none">
        <p style="color:red"><#redirect_015#></p>
       </td>
       <td id="id_notpass" style="display:none">
        <p style="color:red"><#redirect_016#></p>
       </td>
       <td id="id_pass" style="display:none">
        <p style="color:red"><#redirect_017#></p>
       </td>
      </tr>
     </table>
                 <table width="500" cellspacing="0" cellpadding="0" border="0" align="center" id="connect_static" style="display:none;">
                     <tr>
                         <td colspan="2">
                             <table width="500" cellspacing="0" cellpadding="0" border="0">
                                 <tr>
                                     <td colspan="2">
                                         <table width="490" align="center" border="0" class="space">
                                             <tr>
                                                 <td width="105">
                                                     <#redirect_018#>
                                                 </td>
                                                 <td>
              <input type="text" name="staip_ipaddr" maxlength="15" size="16" value="
0.0.0.0">
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                    <#redirect_019#>
                                                 </td>
                                                 <td>
              <input type="text" name="staip_netmask" maxlength="15" size="16" value="
0.0.0.0">
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td>
													<#redirect_020#>
                                                 </td>
                                                 <td>
              <input type="text" name="staip_gateway" maxlength="15" size="16" value="
0.0.0.0">
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td height="21">
                                                     <#redirect_021#>
                                                 </td>
                                                 <td>
<input type="text" name="wan_dns1" size="15" maxlength="15" disabled="true" value="
0.0.0.0"> 
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td>
                                                     <#redirect_022#>
                                                 </td>
                                                 <td>
<input type="text" name="wan_dns2" size="15" maxlength="15" disabled="true" value="
0.0.0.0"> <#redirect_023#>
                                                 </td>
                                             </tr>
                                         </table>
                                         <br>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                 </table>
             </td>
         </tr>
     </table>
  <br>
  <table width="500" cellspacing="0" cellpadding="0" class="setting_table_local setting_bottom">
         <tr>
             <td class="setting_title"><#redirect_024#></td>
         </tr>
         <tr>
             <td class="wizard_main">
                 <br>
                 <table width="490" border="0" align="center" style="display:block" id="connect_PPPoE" class="space">
                     <tr>
                         <td width="105" id="basicSSID2">
                             <#redirect_025#>
                         </td>
                         <td>
                             <input type="text" maxlength="118" size="25" id="DIR_WIZ_BASIC_CFG_SSID"  tid="DIR_WIZ_BASIC_INPUT_CFG_SSID" name="wizardstep4_ssid_2" 
value="<% getCfgGeneral(1, "SSID1"); %>"
>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <#redirect_026#>
                         </td>
                         <td>
							<input type="hidden" maxlength="118" size="25" name="wizardstep4_pskpwd_2" id="DIR_WIZ_2G_BASIC_CFG_PWD"  tid="DIR_WIZ_2G_BASIC_INPUT_CFG_PWD" >
                             <input type="text" maxlength="118" size="25" name="tmp_wizardstep4_pskpwd_2" id="TMP_DIR_WIZ_2G_BASIC_CFG_PWD"  tid="TMP_DIR_WIZ_2G_BASIC_INPUT_CFG_PWD" ><#redirect_027#>
                         </td>
                     </tr>
                     <tr>
                         <td><br></td>
                     </tr>
                 </table>
    </td>
   </tr>
  </table>
  <br>
  <table width="500" cellspacing="0" cellpadding="0" class="setting_table_local setting_bottom">
         <tr>
             <td class="setting_title"><#redirect_028#></td>
         </tr>
         <tr>
             <td class="wizard_main">
                 <br>
                 <table width="490" border="0" align="center" style="display:block" id="connect_PPPoE" class="space">
                     <tr>
                         <td width="105" id="basicSSID5">
                             <#redirect_029#>
                         </td>
                         <td>
                             <input type="text" maxlength="118" size="25" id="DIR_WIZ_5G_BASIC_CFG_SSID"  tid="DIR_WIZ_5G_BASIC_INPUT_CFG_SSID"  name="wizardstep4_ssid_5"
value="<% getCfg2ToHTML(1, "SSID1"); %>"
>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <#redirect_030#>
                         </td>
                         <td>
						 <input type="hidden" maxlength="118" size="25" name="wizardstep4_pskpwd_5"  id="DIR_WIZ_5G_BASIC_CFG_PWD"  tid="DIR_WIZ_5G_BASIC_INPUT_CFG_PWD" >
                             <input type="text" maxlength="118" size="25" name="tmp_wizardstep4_pskpwd_5"  id="TMP_DIR_WIZ_5G_BASIC_CFG_PWD"  tid="TMP_DIR_WIZ_5G_BASIC_INPUT_CFG_PWD" ><#redirect_031#>
                         </td>
                     </tr>
                     <tr>
                         <td><br></td>
                     </tr>
                 </table>
    </td>
   </tr>
  </table>
  <table width="500" cellspacing="0" cellpadding="0" class="setting_table_save">
   <tr>
                <td width=25%></td>
    <td width=50%>
     <input type="button" name="save" value="<#redirect_033#>" onClick="return saveChanges()">
    </td>
    <td width=25%><a href="d_wan.asp"><font size="1"><#redirect_032#></font></a></td>
   </tr>
  </table>
  <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>">
 </form>
</div>
<div class="copywright"><#copyright#></div>
</div>
<script>
enableTextField(document.form2WizardSetup.wan_dns1);
enableTextField(document.form2WizardSetup.wan_dns2);
postload();
</script>
</body>
</html>
