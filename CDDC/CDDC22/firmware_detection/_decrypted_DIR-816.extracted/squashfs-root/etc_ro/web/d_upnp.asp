<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title>UPnP</title>

<SCRIPT>
function proxySelection()
{
	if (document.upnp.daemon[0].checked) {
		document.upnp.ext_if.disabled = true;
	}
	else {
		document.upnp.ext_if.disabled = false;
	}
}

function initValue()
{
	var upnp_en= "<% getCfgGeneral(1, "upnpEnabled"); %>";
	if(upnp_en == "1") {
		document.upnp.daemon[1].checked = true;
	} else {
	  document.upnp.daemon[0].checked = true;
	}
}

function saveClick()
{
	if(document.upnp.daemon[0].checked == true) {
		document.upnp.daemon.value = 0;
	} else {
		document.upnp.daemon.value = 1;
	}
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

</SCRIPT>
<link href="d_stylemain.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="initValue()">
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_127#>";
	SideItem="<#menu.ap_132#>";
	HelpItem="Upnp";
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
		<td class="topheader">UPnP</td>
	</tr>
	<tr>
		<td class="content">
			<p><#upnp_000#></p>
		</td>
	</tr>
</table>


<form action="/goform/form2Upnp.cgi" method=POST name="upnp">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#upnp_001#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left">UPnP:</td>
					<td class="form_label_right">
      			<input type="radio" value="0" name="daemon"><#upnp_002#>
					  <input type="radio" value="1" name="daemon"><#upnp_003#>
          </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#upnp_004#></td>
	</tr>
	<tr>
		<td class=content>
  			<table class=formlisting border=0>
    			<tr class=form_label_row >
            <td class='form_label_col'><b><#upnp_005#></b></td>
            <td class='form_label_col'><b><#upnp_006#></b></td>
            <td class='form_label_col'><b><#upnp_007#></b></td>	 
            <td class='form_label_col'><b><#upnp_008#></b></td>	                    
            <td class='form_label_col'><b><#upnp_009#></b></td>
            <td class='form_label_col'><b><#upnp_010#></b></td>
          </tr>
					<script language="JavaScript" type="text/javascript">
						var str1=new Array;
						var str2=new Array;
			
						var i;
						var ruleStr="<% getUpnpPmList(); %>";
						if (ruleStr != "")
						{
							str1=ruleStr.split('|');
							for (i=0; i<str1.length; i++)
							{
								//TCP:8935:192.168.0.100:8935:Thunder5
								str2=str1[i].split(":");
								document.write("<tr>");
								//if(str2[5] == "1")
									document.write("<td align=\"center\">"+"Enabled"+"</td>");
								//else
									//document.write("<td align=\"center\">"+"Disabled"+"</td>");//活动
								document.write("<td align=\"center\">"+str2[0]+"</td>");	 //协议
								document.write("<td align=\"center\">"+str2[1]+"</td>");   //内部端口
								document.write("<td align=\"center\">"+str2[3]+"</td>");   //外部端口
								document.write("<td align=\"center\">"+str2[2]+"</td>");   //IP地址
								document.write("<td align=\"center\">"+str2[4]+"</td>");   //描述
								document.write("</tr>");
							}
						}
					</script>
       </table>
    </td>
  </tr>
</table>
<p align=center>
<input type="submit" value="<#upnp_011#>" onClick="return saveClick()">&nbsp;&nbsp;
<input type="hidden" value="Send" name="submit.asp?d_upnp.asp">
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</p>
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

