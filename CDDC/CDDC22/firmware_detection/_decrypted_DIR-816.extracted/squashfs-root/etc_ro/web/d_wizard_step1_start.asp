<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<title><#wizard_step1_start_000#></title>

<script>
var ModemVer="<% getCfgGeneral(1, "ModeName"); %>";
var HardwareVer="<% getCfgGeneral(1, "HardwareVer"); %>";
var FirmwareVer="<% getCfgGeneral(1, "FirmwareVer"); %>";

function wizardStartBackFuc()
{
	document.location.href='d_wan.asp';
}
</script>
</head>

<body>
<blockquote>

<script language="JavaScript">
 TabHeader="<#menu.ap_125#>";
 SideItem="<#menu.ap_064#>";
 HelpItem="wizard";
</script>
<script type='text/javascript'>
 mainTableStart();
 logo();
 TopNav();
 ThirdRowStart();
 Write_Item_Images();
 mainBodyStart();
</script>

<br>
<br>
<br>

<form action="/goform/form2WizardStep1.cgi" method=POST name="form2WizardStep1">
<script>
	if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){
		document.writeln('<table border="0" cellpadding="0" cellspacing="0" width="502" align="center" class="setting_table">');
	}else{
		document.writeln('<table border="0" cellpadding="0" cellspacing="0" width="502" align="center" class="setting_table" disabled>');
	}
</script>
 <tbody>
  <tr>
   <td class="wizard_title" align="left" valign="middle" width="500">
    <#wizard_step1_start_001#>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <table border="0" cellpadding="0" cellspacing="0" width="502">
     <tbody>
      <tr>
       <td width="500">
        <br>
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="410">
         <tbody>
          <tr>
           <td>
            <#wizard_step1_start_002#>
           </td>
          </tr>
         </tbody>
        </table>
        <br>
       </td>
      </tr>
      <tr>
       <td class="wizard_tail" align="right" height="30" nowrap="nowrap">
		<script>
			if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){
				document.writeln("&nbsp;<input type=\"submit\" name=\"wizardstep1_back\" value=\"<#wizard_step1_start_003#>\" >");
				document.writeln("&nbsp;<input type=\"submit\" name=\"wizardstep1_next\" value=\"<#wizard_step1_start_004#>\" >");
			}else{
				document.writeln("&nbsp;<input type=\"submit\" name=\"wizardstep1_next_ignore_wan_setting\" value=\"<#wizard_step1_start_004#>\" disabled>");
			}
		</script>
        <input type="hidden" name="submit.htm?d_wizard_step1_start.asp" value="Send">
		<input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>">
       </td>
      </tr>
     </tbody>
    </table>
   </td>
  </tr>
 </tbody>
</table>
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

