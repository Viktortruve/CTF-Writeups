<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<meta http-equiv="refresh" content="60">
<title><#dhcptbl_001#></title>

</head>

<body>
<blockquote>
<script type='text/javascript'>
	TabHeader="<#menu.ap_129#>";
	SideItem="<#menu.ap_119#>";
	HelpItem="dhcpclient";
</script>
<script type='text/javascript'>
	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>

<table id="box_header" border=0 cellSpacing=0>
	<tr>
		<td class="topheader"><#dhcptbl_001#></td>
	</tr>
	<tr>
		<td class="content">
			<p><#dhcptbl_003#></p>
		</td>
	</tr>
</table>

<form action="form2WebRefresh.cgi" method=POST name="status">
<table id="body_header" border="0" cellspacing="0">
	<tr>
    	<td class="topheader"><#dhcptbl_004#></td>
    </tr>
    <tr>
    	<td class="content" align="left">
        	<table class="formlisting" border="0" cellpadding="0" width="500">
            	<tr class="form_label_row">
                	<td class="form_label_col" width="30%"><#dhcptbl_005#></td>
                    <td class="form_label_col" width="30%"><#dhcptbl_006#></td>
                    <td class="form_label_col" width="40%"><#dhcptbl_007#></td>
                </tr>
  <script language="JavaScript" type="text/javascript">
  var DhcpCliList = <%d_getDhcpCliList();%>;
  for(var i = 0; i < DhcpCliList.length; i++ )
  {
  	if( DhcpCliList[i][0] == -1 )
		continue;
  	dw("<TR><TD bgcolor=\"#b7b7b7\" align=\"center\"><b>" + strAnsi2Unicode(Base64.Decode( DhcpCliList[i][0] ))+ "</b></TD>");
	dw("<TD bgcolor=\"#b7b7b7\" align=\"center\"><b>" + DhcpCliList[i][2] + "</b></TD>");
	dw("<TD bgcolor=\"#b7b7b7\" align=\"center\"><b>" + DhcpCliList[i][1] + "</b></TD>");
  }
  //document.write(strAnsi2Unicode(Base64.Decode("aVBob25l")));
</script>
<TR style="display:none; "><TD bgcolor="#b7b7b7" align="center"><b>Unknown</b></TD>
<TD bgcolor="#b7b7b7" align="center"><b>192.168.1.35</b></TD>
<TD bgcolor="#b7b7b7" align="center"><b>00:22:b0:69:13:7c</b></TD>
</TR>
            </table>
        </td>
    </tr>
	<tr style="display:none; ">
    	<td class="topheader"><#dhcptbl_008#></td>
    </tr>
    <tr style="display:none; ">
    	<td class="content" align="left">
        	<table class="formlisting" border="0" cellpadding="0" width="500">
            	<tr class="form_label_row">
                	<td class="form_label_col" width="30%"><#dhcptbl_005#></td>
                    <td class="form_label_col" width="30%"><#dhcptbl_006#></td>
                    <td class="form_label_col" width="40%"><#dhcptbl_007#></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
<p align=center>
<input type="button" value="<#dhcptbl_009#>" onClick="window.location.href='d_dhcptbl.asp'">&nbsp;&nbsp;
</p>
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

