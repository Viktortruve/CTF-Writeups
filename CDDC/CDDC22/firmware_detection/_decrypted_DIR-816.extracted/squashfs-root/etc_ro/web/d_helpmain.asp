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
</SCRIPT>
<script language="JavaScript">
 TabHeader="<#menu.ap_133#>";
 SideItem="<#menu.ap_128#>";
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
  <td class=topheader><#helpmain_000#></td>
 </tr>
 <tr>
  <td class=content>
   <ul>
    <li><a href="d_helpmain.asp#Reboot"><#helpmain_001#></a>
    <script language="javascript">
    if (LoginUser == "admin")
    {
     document.writeln('<li><a href="d_helpmain.asp#Upload"><#helpmain_002#></a>');
     document.writeln('<li><a href="d_helpmain.asp#Saveconf"><#helpmain_003#></a>');
     document.writeln('<li><a href="d_helpmain.asp#Userconfig"><#helpmain_004#></a>');
     document.writeln('<li><a href="d_helpmain.asp#Time"><#helpmain_005#></a>');
    }
    </script>
   </ul>
  </td>
 </tr>
</table>
<br>
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Reboot><#helpmain_006#></a></td>
 </tr>
 <tr>
  <td class=content>
   <p><#helpmain_007#></p>
   <dl>
   <dt><#helpmain_008#>
      <dd><#helpmain_009#>
   </dl>
   <dl>
   <dt><#helpmain_010#>
      <dd><#helpmain_011#>
   </dl>
  </td>
 </tr>
</table>
<br>
<div id="uploadHelp" style="display:none">
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Upload><#helpmain_012#></a></td>
 </tr>
 <tr>
  <td class=content>
   <p><#helpmain_013#></p>
  </td>
 </tr>
</table>
<br>
</div>
<div id="saveconfHelp" style="display:none">
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Saveconf><#helpmain_014#></a></td>
 </tr>
 <tr>
  <td class=content>
        <p><#helpmain_015#></p>
  </td>
 </tr>
</table><br>
</div>
<div id="userconfHelp" style="display:none">
<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><a name=Userconfig><#helpmain_016#></a></td>
 </tr>
 <tr>
  <td class=content>
            <p><#helpmain_017#></p>
  </td>
 </tr>
</table>
<br>
</div>
 <div id="ntpHelp" style="display:none">
 <table id=body_header border=0 cellSpacing=0>
  <tr>
   <td class=topheader>
    <a id=Time name=Time><#helpmain_018#></a>
   </td>
  </tr>
  <tr>
   <td class=content>
    <dl>
    <dd><#helpmain_019#>
    <dt><#helpmain_020#>
    <dd><#helpmain_021#>
    <dl>
    <dt><#helpmain_022#>
       <dd><#helpmain_023#>
    <dt><#helpmain_024#>
    <dd><#helpmain_025#>
    <dt><#helpmain_026#>
    <dd><#helpmain_027#><span class=button_ref><#helpmain_028#></span>
    <#helpmain_029#>
    </dd>
    </dl>
    </dd>
    </dl>
        </td>
  </tr>
 </table>
 </div>
<script language="javascript">
if (LoginUser == "admin"){
 document.getElementById("uploadHelp").style.display = 'block';
 document.getElementById("saveconfHelp").style.display = 'block';
 document.getElementById("userconfHelp").style.display = 'block';
 document.getElementById("ntpHelp").style.display = 'block';
}else{
 document.getElementById("uploadHelp").style.display = 'none';
 document.getElementById("saveconfHelp").style.display = 'none';
 document.getElementById("userconfHelp").style.display = 'none';
 document.getElementById("ntpHelp").style.display = 'none';
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

