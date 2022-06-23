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
function includeSpace(str)
{
  for (var i=0; i<str.length; i++) {
   if ( str.charAt(i) == ' ' ) {
   return true;
 }
  }
  return false;
}
function includeSpecialKey(str)
{
  for (var i=0; i<str.length; i++) {
   if (( str.charAt(i)== ' ' ) || ( str.charAt(i)== '%' )
 || ( str.charAt(i)== '\\' ) || ( str.charAt(i)== '\'' )
   || ( str.charAt(i)== '?' )
        ||( str.charAt(i)== '&' ) ||( str.charAt(i)== '"' )) {
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
 if(document.form2WizardStep3Pppoe.show_pppoe_usrname.value.length == 0)
 {
  alert("<#wizard_step3_pppoe_000#>");
  document.form2WizardStep3Pppoe.show_pppoe_usrname.focus();
  return false;
 }
 else
 {
  if(!checkSpecialChar(document.form2WizardStep3Pppoe.show_pppoe_usrname.value, 1))
  {
   alert("<#wizard_step3_pppoe_001#>");
   document.form2WizardStep3Pppoe.show_pppoe_usrname.focus();
   return false;
  }
 }
 if(document.form2WizardStep3Pppoe.pppoe_psword.value.length == 0)
 {
  alert("<#wizard_step3_pppoe_003#>");
  document.form2WizardStep3Pppoe.pppoe_psword.focus();
  return false;
 }
 else
 {
  if(!checkSpecialChar(document.form2WizardStep3Pppoe.pppoe_psword.value, 1))
  {
   alert("<#wizard_step3_pppoe_004#>");
   document.form2WizardStep3Pppoe.pppoe_psword.focus();
   return false;
  }
 }
 if (document.form2WizardStep3Pppoe.pppoe_psword.value != document.form2WizardStep3Pppoe.confirm.value)
 {
  alert("<#wizard_step3_pppoe_006#>");
  document.form2WizardStep3Pppoe.pppoe_psword.focus();
  return false;
 }
 
 document.form2WizardStep3Pppoe.pppoe_usrname.value = Base64.Encode(document.form2WizardStep3Pppoe.show_pppoe_usrname.value)

	if (document.form2WizardStep3Pppoe.pppoe_psword.value != "********")
	{
		document.form2WizardStep3Pppoe.pppoe_psword.value = Base64.Encode(document.form2WizardStep3Pppoe.pppoe_psword.value)
		document.form2WizardStep3Pppoe.confirm.value = Base64.Encode(document.form2WizardStep3Pppoe.confirm.value)
	}

 document.form2WizardStep3Pppoe.show_pppoe_usrname.disabled = true;
 
 return true;
}
var statuscheckpppoeuser="0";var wtime;
function timerStart()
{
 if (wtime >= 0)
 {
  document.form2WizardStep3Pppoe.checkpppoeuser.value = '<#redirect_069#>'+wtime+'<#redirect_070#>';
  document.form2WizardStep3Pppoe.checkpppoeuser.disabled = true;
  document.form2WizardStep3Pppoe.wizardstep3pppoe_back.disabled = true;
  document.form2WizardStep3Pppoe.wizardstep3pppoe_next.disabled = true;
  wtime--;
  setTimeout("timerStart()",1000);
 }
 else
 {
  document.form2WizardStep3Pppoe.checkpppoeuser.disabled = false;
  document.form2WizardStep3Pppoe.wizardstep3pppoe_back.disabled = false;
  document.form2WizardStep3Pppoe.wizardstep3pppoe_next.disabled = false;
  document.form2WizardStep3Pppoe.checkpppoeuser.value = "<#wizard_step3_pppoe_021#>";
  document.form2WizardStep3Pppoe.statuscheckpppoeuser.value = "2";
  document.form2WizardStep3Pppoe.submit();
 }
}
function onClickCheckPppoeUser()
{
 if(true == saveChanges())
 {
  document.form2WizardStep3Pppoe.statuscheckpppoeuser.value = "1";
  document.form2WizardStep3Pppoe.submit();
  return true;
 }
 else
 {
  return false;
 }
}
function postload()
{
 if('1' == document.form2WizardStep3Pppoe.statuscheckpppoeuser.value)
 {
  wtime = 10;
  timerStart();
 }
 else if('11' == document.form2WizardStep3Pppoe.statuscheckpppoeuser.value)
 {
  document.getElementById("id_noconnected").style.display = 'block';
 }
 else if('12' == document.form2WizardStep3Pppoe.statuscheckpppoeuser.value)
 {
  document.getElementById("id_noack").style.display = 'block';
 }
 else if('13' == document.form2WizardStep3Pppoe.statuscheckpppoeuser.value)
 {
  document.getElementById("id_notpass").style.display = 'block';
 }
 else if('14' == document.form2WizardStep3Pppoe.statuscheckpppoeuser.value)
 {
  document.getElementById("id_pass").style.display = 'block';
 }
 else
 {
  document.form2WizardStep3Pppoe.statuscheckpppoeuser.value = "0";
 }
}

function InitValue()
{
	if ( "<% getCfgGeneral(1, "wan_pppoe_user_encode"); %>" != "")
	{
		document.form2WizardStep3Pppoe.show_pppoe_usrname.value = Base64.Decode("<% getCfgGeneral(1, "wan_pppoe_user_encode"); %>");
	}
}

</script>
</head>
<body onload="InitValue()">
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
<form action="/goform/form2WizardStep3Pppoe.cgi" method=POST name="form2WizardStep3Pppoe">
<table width="502" cellspacing="0" cellpadding="0" border="0" align="center" class="setting_table">
 <tbody>
  <tr>
   <td width="500" valign="middle" align="left" class="wizard_title">
     <#wizard_step3_pppoe_022#>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <table width="502" cellspacing="0" cellpadding="0" border="0">
     <tbody>
      <tr>
       <td width="500">
        <br>
        <table width="400" align="center" border="0" class="space">
         <tbody>
          <tr>
           <td width="86">
            <#wizard_step3_pppoe_013#>
           </td>
           <td width="304">
            <input type="text" maxlength="64" size="25" value="" id="show_acc" class="text" name="show_pppoe_usrname">
			<input type="hidden" maxlength="64" size="25" value="" id="acc" class="text" name="pppoe_usrname">
           </td>
          </tr>
          <tr>
           <td>
           <#wizard_step3_pppoe_014#>
           </td>
           <td>
            <input type="password" maxlength="64" size="25" value="<% getPPPoePass(); %>" id="psw" class="text" name="pppoe_psword">
           </td>
          </tr>
          <tr>
           <td>
            <#wizard_step3_pppoe_015#>
           </td>
           <td>
            <input type="password" maxlength="64" size="25" value="<% getPPPoePass(); %>" id="confirm" class="text" name="confirm">
           </td>
          </tr>
          <tr><td><br></td></tr>
          <tr style="display:none">
           <td>
            <script>
            document.writeln('<input type=\"text\" name=\"statuscheckpppoeuser\" maxlength=\"64\" size=\"25\" value=\"'+statuscheckpppoeuser+'\">');
            </script>
           </td>
          </tr>
          <tr style="display:none" >
           <td>
            <input type="submit" name="checkpppoeuser" value="<#wizard_step3_pppoe_016#>" onClick="return onClickCheckPppoeUser()">
           </td>
           <td id="id_noconnected" style="display:none">
            <p style="color:red">
            <#wizard_step3_pppoe_016#>
            </p>
           </td>
           <td id="id_noack" style="display:none">
            <p style="color:red">
           <#wizard_step3_pppoe_017#>
            </p>
           </td>
           <td id="id_notpass" style="display:none">
            <p style="color:red">
            <#wizard_step3_pppoe_018#>
            </p>
           </td>
           <td id="id_pass" style="display:none">
            <p style="color:red">
            <#wizard_step3_pppoe_019#>
            </p>
           </td>
          </tr>
         </tbody>
        </table>
        <br>
       </td>
      </tr>
      <tr>
       <td height="30" align="right" class="wizard_tail">
        <input type="submit" name="wizardstep3pppoe_back" value="<#wizard_step2_select_008#>">
        &nbsp;
        <input type="submit" name="wizardstep3pppoe_next" value="<#wizard_step2_select_009#>" onClick="return saveChanges()">
        &nbsp;
       </td>
      </tr>
     </tbody>
    </table>
   </td>
  </tr>
 </tbody>
</table>
<input type="hidden" name="submit.htm?d_wizard_step3_pppoe.asp" value="Send">
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
postload();
</script>
</body>
</html>

