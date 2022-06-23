<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<title>Autoboot</title>
<script>
var wtime=180;
function stop()
{
   clearTimeout(id); 
}
function start() 
{ 
	if(wtime==180)
	{
		wtime = parseInt(document.frm.waitTime.value);
	}
   wtime--;
   if (wtime >= 0)
   { 
      frm.time.value = wtime;
      id=setTimeout("start()",1000);
   }
   if (wtime == 0)
   { 
		if ( autoboot == "2") 
		{
			window.open("http://<% getResetLanIp(); %>/",target="_parent");
		}
		else
		{
			window.open("http://<% getLanIp(); %>/",target="_parent");
		}
   }
}
</script>
</head>
<body onLoad="start();" onUnload="stop();">
<blockquote>
<script language="JavaScript">
var autoboot = "<% d_getautobootHtm(); %>";
if( autoboot == "1" ){
 TabHeader="<#menu.ap_125#>";
 SideItem="<#menu.ap_068#>";
 HelpItem="wanif";
}else{
	TabHeader="<#menu.ap_128#>";
	SideItem="<#menu.ap_110#>";
	HelpItem="reboot";
}
</script>
<script type='text/javascript'>
	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>

<form name=frm>
	<table id="box_header" border=0 cellSpacing=0>
		<tr>
			<td class="topheader"><#autoboot_000#></td>
		</tr>
		<tr>
			<td class="content">
			<p>
<script type='text/javascript'>
var macclone = "<#autoboot_001#>";	// 1
var reboot   = "<#autoboot_002#>";
var resetfac = "<#autoboot_003#>";
if( autoboot == "1" ){
	dw(macclone);
}
else if(autoboot == "2")
{
	dw(resetfac);
}
else{
	dw(reboot);
}
</script>
			</p>
			<p><#autoboot_004#> 
			<INPUT TYPE=text NAME=time size=2>
			 <#autoboot_005#></p>
			<input style="display:none;" type="text" name="waitTime" size="15" maxlength="15" value="80">
			</td>
		</tr>
	</table>
	 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
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

