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
</script>
</head>
<body>
<div class="login">
<table class="productInfo" border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
  <td align="left" height="30" bgcolor="#404343" colspan="1"><#product_info_002#>
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
<form action="/goform/form2WizardStep5.cgi" method=POST name="form2WizardStep5">
<table width="502" cellspacing="0" cellpadding="0" border="0" align="center" class="setting_table">
 <tbody>
  <tr>
   <td width="500" valign="middle" align="left" class="wizard_title">
   <#wizard_step5_end_003#>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <table width="502" cellspacing="0" cellpadding="0" border="0">
     <tbody>
      <tr>
       <td width="500">
        <br>
        <table width="400" align="center" cellspacing="0" cellpadding="0" border="0"
        class="space">
         <tbody>
          <tr>
           <td>
            <#wizard_step5_end_004#>
           </td>
          </tr>
          <tr>
           <td colspan="2">&nbsp;
            
           </td>
          </tr>
          <tr>
           <td>
            <#wizard_step5_end_005#>
           </td>
          </tr>
          <tr>
           <td colspan="2">&nbsp;
            
           </td>
          </tr>
         </tbody>
        </table>
        <br>
       </td>
      </tr>
      <tr>
       <td height="30" align="right" class="wizard_tail">
        <input type="submit" name="wizardstep5_back" value="<#wizard_step2_select_008#>">
        &nbsp;
        <input type="submit" name="wizardstep5_next" value="<#wizard_step5_end_006#>">
        &nbsp;
        <input type="hidden" name="submit.htm?d_wizard_step5_end.asp" value="Send">
		 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
       </td>
      </tr>
     </tbody>
    </table>
   </td>
  </tr>
 </tbody>
</table>
</form>
<br>
<br>
<br>
<div class="loginBottom">
</div>
<div class="copywright">
<#copyright#></div>
</div>
</body>
</html>

