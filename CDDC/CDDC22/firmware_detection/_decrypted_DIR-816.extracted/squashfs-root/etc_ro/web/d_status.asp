<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<meta http-equiv="refresh" content="60;url=d_status.asp">
<title><#status_000#></title>
<script>
function modifyClick(url)
{
 var wide=600;
 var high=400;
 if (document.all)
  var xMax = screen.width, yMax = screen.height;
 else if (document.layers)
  var xMax = window.outerWidth, yMax = window.outerHeight;
 else
    var xMax = 640, yMax=480;
 var xOffset = (xMax - wide)/2;
 var yOffset = (yMax - high)/3;

 var settings = 'width='+wide+',height='+high+',screenX='+xOffset+',screenY='+yOffset+',top='+yOffset+',left='+xOffset+', resizable=yes, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes';

 window.open( url, 'Status_Modify', settings );
}

function submitPPPoe(form,pppoenum,connect)
{
 form.pppoenum.value = pppoenum;
 form.connect.value = connect;
 form.submit();
}
function srefresh()
{
	document.location.href='d_status.asp';
}

var wjson = {
0	:	["STATIC", 	"<#status_035#>"],
1	:	["DHCP", 	"<#status_036#>"],
2	:	["PPPOE", 	"<#status_037#>"],
3	:	["RUPPPOE", "<#status_037#>"],
4	:	["PPTP", 	"PPTP"],
5	:	["L2TP", 	"L2TP"]
};
var conntype = "";
var wmode = "<% getCfgGeneral(1, "wanConnectionMode"); %>";

for (var i in wjson)
{
	if( wmode == wjson[i][0] )
		conntype = wjson[i][1];
}

</script>
</head>
<body>
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_129#>";
 SideItem="<#menu.ap_118#>";
 HelpItem="deviceinfo";
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
  <td class=topheader><#status_000#></td>
 </tr>
 <tr>
  <td class=content>
   <p><#status_001#></p>
  </td>
 </tr>
</table>
<br>

<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><#status_002#></td>
 </tr>

 <tr>
  <td class=content>

  <table class=formlisting border=0>
    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_003#></td>
    <td class='form_label_col'>
<% getCfgGeneral(1, "ModeName"); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_004#></td>
    <td class='form_label_col'>
<script language="javascript">
	var stime = "<% getSysUptime(); %>";
	var patt2 = new RegExp("^([0-9]{1,2}) days, ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})$","g");//(alert[^;]*)
	var result,flag = 0;
	while( (result = patt2.exec( stime )) != null )
	{
		dw( result[1] + ' <#status_006#> , ' + result[2] + ':' + result[3] + ':' + result[4]  );
		flag = 1;
	}
	if( flag == 0)
	{
		dw( stime );
	}
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_005#></td>
    <td class='form_label_col'>
<script language="javascript">
var Week  = [
[ "Monday"		,	"<#status_038#>"],
[ "Tuesday"		,	"<#status_039#>"],
[ "Wednesday"	,	"<#status_040#>"],
[ "Thursday"	,	"<#status_041#>"],
[ "Friday"		,	"<#status_042#>"],
[ "Saturday"	,	"<#status_043#>"],
[ "Sunday"		,	"<#status_044#>"]
];
	var ctime = "<% d_getCurrentTimeASP(); %>";
	var patt3 = new RegExp("^([0-9]{1,5})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,5}):([0-9]{1,5}):([0-9]{1,5}) , ([A-Za-z0-9_]+)","g");
	var cresult, ctmp, cweek='', cflag = 0;//	2014-05-21 18:33:52
	while( (cresult = patt3.exec( ctime )) != null )
	{
		ctmp = cresult[1] + '<#status_050#> ' + cresult[2] + '<#status_051#> ' + cresult[3] + '<#status_052#> ' + cresult[4] + '<#status_053#> ' + cresult[5] + '<#status_054#> ' +  cresult[6] + '<#status_055#> ' ;
		for(var i = 0 ; i < Week.length; i++)
		{
			if( Week[i][0] == cresult[7])
			{
				cweek = Week[i][1];
			}
		}
		dw( ctmp + ', ' + cweek);
		cflag = 1;
	}
	if( cflag == 0)
	{
		dw( ctime );
	}
</script>
</td>
    </tr>


  </table>
  </td>
  </tr>
</table>

<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><#status_009#></td>
 </tr>

 <tr>
  <td class=content>

  <table class=formlisting border=0>
    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_033#></td>
    <td class='form_label_col'>
<% getLanIp(); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_011#></td>
    <td class='form_label_col'>
<% getCfgGeneral(1, "lan_netmask"); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_012#></td>
    <td class='form_label_col'>
<script language="javascript">
	var dhcpEnabled = "<% getCfgGeneral(1, "dhcpEnabled"); %>";
	if( dhcpEnabled == '1'){
		dw( "<#status_045#>" );		
	}else{
		dw( "<#status_046#>" );		
	}
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_013#></td>
    <td class='form_label_col'>
<% getLanMac(); %>
</td>
    </tr>

  </table>
  </td>
  </tr>
</table>

<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader><#status_014#></td>
 </tr>

 <tr>
  <td class=content>

  <table class=formlisting border=0>
    <tr class=form_label_row>
    <td class='form_label_col' width=50%>2.4G</td>
    <td class='form_label_col'>
<script language="javascript">
	var radio_off = '<% getCfgZero(1, "RadioOff"); %>';
	if(radio_off == '1')
		dw( "<#status_046#>" );
	else
		dw( "<#status_045#>" );
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_016#></td>
    <td class='form_label_col'>
<script language="javascript">

var wirelessmode = "<% getCfgGeneral(1, "WirelessMode"); %>";
var mode_w = "802.11 ";
switch(wirelessmode)
{
 case "0":
 	dw( mode_w + "b/g"); break;
 case "1":
 	dw( mode_w + "b");  break;
 case "4":
 	dw( mode_w + "g");  break;
 case "6":
	dw( mode_w + "n");  break;
 case "7":
	dw( mode_w + "n/g"); break;
 case "9":
 	dw( mode_w + "b/g/n"); break;
}
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_017#></td>
    <td class='form_label_col'>
<% getCfgToHTML(1, "SSID1"); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_018#></td>
    <td class='form_label_col'>
<script language="javascript">
	var authmode = '<% getCfgGeneral(1, "AuthMode"); %>';
	if (authmode == "OPEN")
	{
		dw( "NONE" );
	}
	else if (authmode == "SHARED")
	{
		dw( "WEP" );
	}
	else if (authmode == "WEPAUTO")
	{
		dw( "WEP" );
	}
	else if (authmode == "WPAPSK")
	{
		dw( "WPA-PSK(TKIP)" );
	}
	else if (authmode == "WPA2PSK")
	{
		dw( "WPA2-PSK(AES)" );
	}
	else if (authmode == "WPAPSKWPA2PSK")
	{
		dw( "WPA-PSK/WPA2-PSK AES" );
	}
</script>	
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_019#></td>
    <td class='form_label_col'>
<% getStatusWlanChannel(); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_020#></td>
    <td class='form_label_col'>
<script language="javascript">
	var HideSSID = '<% getCfgZero(1, "HideSSID"); %>';
	if(HideSSID == '1')
		dw( "<#status_046#>" );
	else
		dw( "<#status_045#>" );
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_021#></td>
    <td class='form_label_col'>
<script language="javascript">
var wpsenable = <% getWPSModeASP(); %>;
	if(wpsenable == '0')
		dw( "<#status_046#>" );
	else
		dw( "<#status_045#>" );
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_022#></td>
    <td class='form_label_col'>
<script language="javascript">
var connectStatus = "<% GetConnectStatus(); %>";
	if(connectStatus == '0')
		dw( "<#status_047#>" );
	else
		dw( "<#status_048#>" );
</script>

  </td>
    </tr>

  </table>
  </td>
  </tr>
</table>

<table id=body_header border=0 cellSpacing=0>
 <tr>
  <td class=topheader>5G <#status_014#></td>
 </tr>

 <tr>
  <td class=content>

  <table class=formlisting border=0>
    <tr class=form_label_row>
    <td class='form_label_col' width=50%>5G</td>
    <td class='form_label_col'>
<script language="javascript">
	var radio_off_5g = '<% getCfg2Zero(1, "RadioOff"); %>';
	if(radio_off_5g == '1')
		dw( "<#status_046#>" );
	else
		dw( "<#status_045#>" );
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_016#></td>
    <td class='form_label_col'>
<script language="javascript">

var wirelessmode_5g = "<% getCfg2General(1, "WirelessMode"); %>";
//var mode_w = "802.11 ";
switch(wirelessmode_5g)
{
 case "2":
 	dw( mode_w + "a"); break;
 case "8":
 	dw( mode_w + "a/n");  break;
 case "11":
 	dw( mode_w + "n");  break;
 case "14":
 	dw( mode_w + "a/n/ac"); break;
 case "15":
 	dw( mode_w + "n/ac"); break;
}
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_017#></td>
    <td class='form_label_col'>
<% getCfg2ToHTML(1, "SSID1"); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_018#></td>
    <td class='form_label_col'>
<script language="javascript">
	var authmode_5g = '<% getCfg2General(1, "AuthMode"); %>';
	if (authmode_5g == "OPEN")
	{
		dw( "NONE" );
	}
	else if (authmode_5g == "SHARED")
	{
		dw( "WEP" );
	}
	else if (authmode_5g == "WEPAUTO")
	{
		dw( "WEP" );
	}
	else if (authmode_5g == "WPAPSK")
	{
		dw( "WPA-PSK(TKIP)" );
	}
	else if (authmode_5g == "WPA2PSK")
	{
		dw( "WPA2-PSK(AES)" );
	}
	else if (authmode_5g == "WPAPSKWPA2PSK")
	{
		dw( "WPA-PSK/WPA2-PSK AES" );
	}
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_019#></td>
    <td class='form_label_col'>
<% getStatusInicChannel(); %>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_020#></td>
    <td class='form_label_col'>
<script language="javascript">
	var HideSSID_5g = '<% getCfg2Zero(1, "HideSSID"); %>';
	if(HideSSID_5g == '1')
		dw( "<#status_046#>" );
	else
		dw( "<#status_045#>" );
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_021#></td>
    <td class='form_label_col'>
<script language="javascript">
var wpsenable_5g = <% getCfg2Zero(1, "WscModeOption"); %>;
	if(wpsenable_5g == '0')
		dw( "<#status_046#>" );
	else
		dw( "<#status_045#>" );
</script>
</td>
    </tr>

    <tr class=form_label_row>
    <td class='form_label_col' width=50%><#status_022#></td>
    <td class='form_label_col'>
<script language="javascript">
var connectStatus_5g = "<% GetConnectStatus_5g(); %>";
	if(connectStatus_5g == '0')
		dw( "<#status_047#>" );
	else
		dw( "<#status_048#>" );
</script>

  </td>
    </tr>

  </table>
  </td>
  </tr>
</table>

<table id=body_header border=0 cellSpacing=0 style="display:none">
 <tr>
  <td class=topheader><#status_023#></td>
 </tr>

 <tr>
  <td class=content>

    <table class=formlisting border=0>
      <tr class=form_label_row>
      <td class='form_label_col' width=50%><#status_024#></td>
      <td class='form_label_col'>
<#status_049#>      </td>
      </tr>

      <tr class=form_label_row>
      <td class='form_label_col' width=50%><#status_025#></td>
      <td class='form_label_col'>&nbsp;
      </td>
      </tr>

    </table>
  </td>
  </tr>
</table>

<form action="/goform/form2WebRefresh.cgi" method=POST name="status">
<script>
	if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){
		document.writeln("<table id=body_header border=0 cellSpacing=0>");
	}else{
		document.writeln("<table id=body_header border=0 cellSpacing=0 style=\"display:none;\">");
	}
</script>
 <tr>
  <td class=topheader><#status_026#></td>
 </tr>

 <tr>
  <td class=content>
   <table class=formlisting border=0>
    <INPUT TYPE="HIDDEN" NAME="pppoenum" VALUE="" >
    <tr class=form_label_row>
     <td class='form_label_col'><#status_027#></td>
     <td class='form_label_col'><#status_028#></td>
     <td class='form_label_col'><#status_033#></td>
	 <td class="form_label_col"><#status_013#></td>
     <td class='form_label_col'><#status_029#></td>
     <td class='form_label_col'><#status_030#></td>
     <td class='form_label_col'><#status_034#></td>
    </tr>

<TR>
<TD align=center bgcolor="#C0C0C0"><b>WAN</b></TD>
<TD align=center bgcolor="#C0C0C0"><b>
<script language="javascript">
	dw( conntype );
</script>
</b></TD>
<TD align=center bgcolor="#C0C0C0"><b><% getWanIp(); %></b></TD>
<TD align=center bgcolor="#C0C0C0"><b>
<script language="javascript">
if ("<% getWanIp(); %>" != "0.0.0.0")
{
	dw("<% getWanMac(); %>")
}
else
{
	dw("0.0.0.0")
}

</script>
</b></TD>
<TD align=center bgcolor="#C0C0C0"><b>
<script language="javascript">

if ("<% getWanIp(); %>" != "0.0.0.0")
{
	dw("<% getWanGateway(); %>")
}
else
{
	dw("0.0.0.0")
}

</script>
</b></TD>
<TD align=center bgcolor="#C0C0C0"><b>
<script language="javascript">
if ("<% getWanIp(); %>" != "0.0.0.0")
{
	if ( "<% getDns(1); %>" == "<% getDns(2); %>" || "0.0.0.0" == "<% getDns(2); %>")
	{
		dw("<% getDns(1); %>");	
	}
	else
	{
		dw("<% getDns(1); %>" + "<br>" +  "<% getDns(2); %>");
	}
}
else
{
	dw("0.0.0.0")
}
</script>

</b></TD>
<TD align=center bgcolor="#C0C0C0"><b>
<script language="javascript">

var portStatus = "<% getPortStatus(); %>";
  		var wanPort = new Array();
		wanPort = portStatus.split(",");
		if(wanPort[0] == "1" && "<% getWanIp(); %>" != "0.0.0.0")
			dw("<#status_048#>(" + conntype + ")");
		else
			dw("<#status_047#>(" + conntype + ")");
</script>
</b></TD>
</TR>
</TABLE>
  </td>
 </tr>
</table>


<script>
	if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1)) && wmode=="RUPPPOE"){
		document.writeln("<div id=\"secondwaninfo\" >");
	}else{
		document.writeln("<div id=\"secondwaninfo\" style=\"display:none\">");
	}
</script>

<!--<div id="secondwaninfo" style="display:none">-->
<table id=body_header border=0 cellSpacing=0 >
 <tr>
  <td class=topheader><#status_056#></td>
 </tr>
 <tr>
  <td class=content>
   <table class=formlisting border=0>
    <tr class=form_label_row>
     <td class='form_label_col'><#status_027#></td>
     <td class='form_label_col'><#status_057#></td>
     <td class='form_label_col'><#status_033#></td>
     <td class='form_label_col'><#status_011#></td>
     <td class='form_label_col'><#status_013#></td>
     <td class='form_label_col'><#status_034#></td>
    </tr>
<TR>
<TD align=center bgcolor="#C0C0C0"><b><#status_058#></b></TD>
<TD align=center bgcolor="#C0C0C0"><b>
<script language="javascript">
	var sencondwantype = "<% getCfgGeneral(1, "wan_secondwan_type"); %>";
	if (sencondwantype == "0")
	{
		dw( "<#status_059#>" );
	}
	else
	{
		dw( "<#status_060#>" );	
	}
</script>
</b></TD>
<TD align=center bgcolor="#C0C0C0"><b><% getSecondWanIp(); %></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><% getSecondWanNetmask(); %></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><% getWanMac(); %></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><script language="javascript">
		if(wanPort[0] == "1" && "<% getSecondWanIp(); %>" != "0.0.0.0")
			dw("<#status_048#>");
		else
			dw("<#status_047#>");
</script>
</b></TD>
</TR>
</TABLE>
  </td>
 </tr>
</table>
</div>

<input type="hidden" name="submit.asp?d_status.asp" value="Send">
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
<p align=center>
<input type="button" value="<#status_032#>" name="refresh" onClick="srefresh();">
</p>
<br>
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

