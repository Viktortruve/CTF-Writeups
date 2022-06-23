<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
</head>
<body>
<blockquote>
<SCRIPT language="JavaScript">
var LoginUser = 'admin';
var wireless = '1';var LanMacAddrCtrl = '0';var LanLinkModeCtrl = '0';</SCRIPT>
<script language="JavaScript">
 TabHeader="<#menu.ap_133#>";
 SideItem="<#menu.ap_125#>";
</script>
<script type='text/javascript'>
 mainTableStart();
 logo();
 TopNav();
 ThirdRowStart();
 Write_Item_Images();
 mainBodyStart();
</script>
 <table id=box_header border=0 cellSpacing=0>
  <tr>
   <td class=topheader>
    <#helpsetup_000#>
   </td>
  </tr>
  <tr>
   <td class=content>
   <ul>
    <script language="javascript">
    if (LoginUser == "admin")
     document.writeln('<li><a href="d_helpsetup.asp#Wizard"><#helpsetup_001#></a>');
    </script>
    <li><a href="d_helpsetup.asp#LAN"><#helpsetup_002#></a>
	<script>
			if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){//如果关闭无线中继
				document.writeln('<li><a href="d_helpsetup.asp#Internet"><#helpsetup_003#></a>');
			}
	</script>
   </ul>
   </td>
  </tr>
 </table>
 <br>

 <div id="wizzardHelp" style="display:none">
 <table id=body_header border=0 cellSpacing=0>
  <tr>
   <td class=topheader>
    <a name="Wizard" id="Wizard"><#helpsetup_005#></a>
   </td>
  </tr>
  <tr>
   <td class=content>
		<script>
			if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){
				document.writeln("<p><#helpsetup_006#><span class=button_ref><#helpsetup_007#></span><#helpsetup_008#><\/p>");
			}else{
				document.writeln("<p><#helpsetup_0080#><\/p>");
			}
		</script>
   </td>
  </tr>
 </table>
 <br>
 </div>

 <table id=body_header border=0 cellSpacing=0>
  <tr>
   <td class=topheader>
    <a id="LAN" name="LAN"><#helpsetup_009#></a>
   </td>
  </tr>
  <tr>
  <td class=content>
  <p><#helpsetup_010#></p>
   <dl>
   <dt><#helpsetup_011#>
       <dd><#helpsetup_012#>
         <dl>
       <dt><#helpsetup_013#>
           <dd><#helpsetup_014#>
           <dt><#helpsetup_015#>
           <dd><#helpsetup_016#>
      </dd>
      </dl>
   </dl>

   <dl>
    <dt><#helpsetup_017#>
        <dd><#helpsetup_018#>
         <dl>
          <dt><#helpsetup_019#>
           <dd>
           <p><#helpsetup_020#></p>
           <p><#helpsetup_021#></p>
     <p>
     <#helpsetup_022#><span class=option><#helpsetup_023#></span><#helpsetup_024#>:</p>
           <dt><#helpsetup_025#>
     <dd>
     <#helpsetup_026#>
     <p>
     <#helpsetup_027#></p>
           <DIV class=help_example>
           <dl>
     <dt><#helpsetup_028#>
     <dd>
     <#helpsetup_029#>
     <dt><#helpsetup_030#>
     <dd>
     <#helpsetup_031#>
     </dd>
     </dl>
     </DIV>
           <dt><#helpsetup_032#>
           <dd><#helpsetup_033#>
           <dt><#helpsetup_034#>
		   <dd>
		   <#helpsetup_035#>
           <dt><#helpsetup_036#>
           <dd><#helpsetup_037#>
           <dt><#helpsetup_038#>
           <dd><#helpsetup_039#>
      </dd>
      </dl>
   </dl>

   <dl>
   <dt><#helpsetup_040#>
      <dd>
      <#helpsetup_041#>
         <dl>
      <dt><#helpsetup_042#>
         <dd><#helpsetup_043#>
         <dt><#helpsetup_044#>
         <dd><#helpsetup_045#>
      </dd>
      </dl>
   </dl>

       </td>
  </tr>
 </table>
 <br>

<script>
	if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){//如果关闭无线中继
		document.writeln("<table id=body_header border=0 cellSpacing=0>");
	}else{
		document.writeln("<table id=body_header border=0 cellSpacing=0 style=\"display:none;\">");
	}
</script>
	<tr>
		<td class=topheader>
			<a name="Internet" id="Internet"><#helpsetup_048#></a>
		</td>
	</tr>
	<tr>
		<td class=content>
			<p><#helpsetup_049#><span class=button_ref><#helpsetup_050#></span><#helpsetup_051#></p>
			<dl>
				<dt><a name="pptp" id="pptp"><#helpsetup_105#></a>
					<dd><p><#helpsetup_106#></p>
					</dd>
				</dt>
				<dt><a name="l2tp" id="l2tp"><#helpsetup_107#></a>
					<dd>
						<p><#helpsetup_108#>
					</dd>
				</dt>
			</dl>
		</td>
	</tr>
</table>
<br>

<br>
<script language="javascript">
if (LoginUser == "admin"){
 document.getElementById("wizzardHelp").style.display = 'block';
}else{
 document.getElementById("wizzardHelp").style.display = 'none';
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

