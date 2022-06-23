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
var wireless = '1';</SCRIPT>
<script language="JavaScript">
 TabHeader="<#menu.ap_133#>";
 SideItem="<#menu.ap_124#>";
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
  <td class=topheader><#helpmenu_000#></td>
 </tr>
 <tr>
  <td class=content>
   <ul>
    <li><a href="d_helpmenu.asp#Setup"><#helpmenu_001#></a>
    <script>
    if(wireless=="1")
     document.writeln('<li><a href="d_helpmenu.asp#Wireless"><#helpmenu_002#></a>');
    if (LoginUser == "admin")
     document.writeln('<li><a href="d_helpmenu.asp#Advanced"><#helpmenu_003#></a>');
    </script>
    <li><a href="d_helpmenu.asp#Maintenance"><#helpmenu_004#></a>
    <li><a href="d_helpmenu.asp#Status"><#helpmenu_005#></a>
   </ul>
  </td>
 </tr>
</table><br>
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Setup><#helpmenu_006#></a></td>
 </tr>
 <tr>
  <td class=content>
   <ul>
    <script language="javascript">
    	if(LoginUser == "admin"){
     		document.writeln('<li><a href="d_helpsetup.asp#Wizard"><#helpmenu_007#></a>');
    	}
    </script>
    <li><a href="d_helpsetup.asp#LAN"><#helpmenu_008#></a>
	<script language="javascript">
		if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){
			document.writeln('<li><a href="d_helpsetup.asp#Internet"><#helpmenu_009#></a>');
		}
	</script>

   </ul>
  </td>
 </tr>
</table><br>

<div id="wirelessHelp" style="display:show">
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Wireless><#helpmenu_011#></a></td>
 </tr>
 <tr>
  <td class=content>
   <ul>

    <li><a href="d_helpwlan.asp#WlanBasic"><#helpmenu_012#></a>
    <script language="javascript">
    if (LoginUser == "admin"){

    document.writeln('<li><a href="d_helpwlan.asp#wlwps"><#helpmenu_014#></a>');
    document.writeln('<li><a href="d_helpwlan.asp#wladv"><#helpmenu_015#></a>');
    document.writeln('<li><a href="d_helpwlan.asp#wlrepeater"><#helpmenu_016#></a>');
    }
    </script>
   </ul>
  </td>
 </tr>
</table><br>
</div>
<div id="advHelp" style="display:show">
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Advanced><#helpmenu_025#></a></td>
 </tr>
 <tr>
  <td class=content>
   <ul>
    <script language="javascript">
    if (LoginUser == "admin") {
                    document.writeln('<li><a href="d_helpadv.asp#Acl"><#helpmenu_022#></a>');
                    document.writeln('<li><a href="d_helpadv.asp#PortTriggering"><#helpmenu_027#></a>');
   document.writeln('<li><a href="d_helpadv.asp#DMZ">DMZ</a>');
                    document.writeln('<li><a href="d_helpadv.asp#Url"><#helpmenu_029#></a>');
                    document.writeln('<li><a href="d_helpadv.asp#DDNS"><#helpmenu_030#></a>');
                    //document.writeln('<li><a href="d_helpadv.asp#Netsniper"><#helpmenu_031#></a>');
                    document.writeln('<li><a href="d_helpadv.asp#IPQosTC"><#helpmenu_050#></a>');
                    document.writeln('<li><a href="d_helpadv.asp#UPnP">UPnP</a>');
                    document.writeln('<li><a href="d_helpadv.asp#VirtualSrv"><#helpmenu_035#></a>');
    }
    </script>
   </ul>
  </td>
 </tr>
</table><br>
</div>
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Maintenance><#helpmenu_038#></a></td>
 </tr>
 <tr>
  <td class=content>
   <ul>
    <li><a href="d_helpmain.asp#Reboot"><#helpmenu_039#></a>
    <script language="javascript">
    if (LoginUser == "admin") {
     document.writeln('<li><a href="d_helpmain.asp#Upload"><#helpmenu_040#></a>');
     document.writeln('<li><a href="d_helpmain.asp#Saveconf"><#helpmenu_041#></a>');
     document.writeln('<li><a href="d_helpmain.asp#Userconfig"><#helpmenu_042#></a>');
     document.writeln('<li><a href="d_helpmain.asp#Time"><#helpmenu_043#></a>');
    }
    </script>
   </ul>
  </td>
 </tr>
</table><br>
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Status><#helpmenu_044#></a></td>
 </tr>
 <tr>
  <td class=content>
   <ul>
    <li><a href="d_helpstatusinfo.asp#Status"><#helpmenu_045#></a>
    <li><a href="d_helpstatusinfo.asp#Dhcpclient"><#helpmenu_046#></a>
    <li><a href="d_helpstatusinfo.asp#Stats"><#helpmenu_047#></a>
   </ul>
  </td>
 </tr>
</table>
<script language="javascript">
if(wireless == "1") {
 document.getElementById("wirelessHelp").style.display = 'block';
}
else {
 document.getElementById("wirelessHelp").style.display = 'none';
}
if (LoginUser == "admin"){
 document.getElementById("advHelp").style.display = 'block';
}else {
 document.getElementById("advHelp").style.display = 'none';
}
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

