<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#ddns_000#></title>

<SCRIPT>
function checkTextStr(str)
{
	for (var i=0; i<str.length; i++) 
	{
		if ( str.charAt(i) == '%' || str.charAt(i) =='&' ||str.charAt(i) =='\\' || str.charAt(i) =='?' || str.charAt(i)=='"') 
			return false;			
	}
	return true;
}

function addClick()
{
	if (document.getElementById('enable').checked)
	{
		if (document.ddns.hostname.value=="") {
			alert("<#ddns_001#>");
			document.ddns.hostname.focus();
			return false;
		}
		if(!checkSpecialChar(document.ddns.hostname.value, 1))
		{
			alert("<#ddns_002#>");
			document.ddns.hostname.focus();
			return false;		
		}
	
		if (document.ddns.show_username.value=="")
		{
			alert("<#ddns_003#>");
			document.ddns.show_username.focus();
		return false;
		}
		if(!checkSpecialChar(document.ddns.show_username.value, 1))
		{
			alert("<#ddns_004#>");
			document.ddns.show_username.focus();
			return false;		
		}
		if (document.ddns.password.value=="") 
		{
			alert("<#ddns_005#>");
			document.ddns.password.focus();
			return false;
		}
		if(!checkSpecialChar(document.ddns.password.value, 1))
		{
			alert("<#ddns_006#>");
			document.ddns.password.focus();
			return false;		
		}
	}
	else
	{
		document.getElementById('username').disabled = true;
	}
	
	if (document.ddns.show_username.value != "" && document.ddns.password.value != "")
	{
		document.ddns.username.value = Base64.Encode(document.ddns.show_username.value);
		document.ddns.password.value = Base64.Encode(document.ddns.password.value);
	}
	document.getElementById('show_username').disabled = true;

	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

function initValue()
{
	/**/
	var ddns_enable = '<% getCfgZero(1, "DDNSEnable"); %>';		
	var ddns_provider = "<% getCfgGeneral(1, "DDNSProvider"); %>";
	
		//var ddns_provider = "no-ip.com";
		//var ddns_enable =1;
		if ("<% getCfgGeneral(1, "DDNSAccount_encode"); %>" != "" )
		{
			document.ddns.show_username.value = Base64.Decode("<% getCfgGeneral(1, "DDNSAccount_encode"); %>");
		}
		
		if (ddns_provider == "dyndns.org")
			document.ddns.ddnsProv.options.selectedIndex = 0;
		else if (ddns_provider == "freedns.afraid.org")
			document.ddns.ddnsProv.options.selectedIndex = 1;
		else if (ddns_provider == "zoneedit.com")
			document.ddns.ddnsProv.options.selectedIndex = 2;
		else if (ddns_provider == "no-ip.com")
			document.ddns.ddnsProv.options.selectedIndex = 3;
		else if (ddns_provider == "oray.cn")
			document.ddns.ddnsProv.options.selectedIndex = 4;
		else if (ddns_provider == "dlinkddns.com")
			document.ddns.ddnsProv.options.selectedIndex = 5;
						
		if (ddns_enable == "1")
		{
			document.ddns.enable.checked = true;
			enabledddns();
		}
		else
		{
			document.ddns.enable.checked = false;
			dsiabledddns();			
		}
}

function updateState()
{
}

function postDdns(state, provider,hostname,show_username,password,ifname)
{
	isChecked = parseInt(state);
	if(isChecked)
		document.ddns.enable.checked=true;
	else
		document.ddns.enable.checked=false;
	
	if(provider == 'dyndns')
		document.ddns.ddnsProv.value = 0;
	else if(provider == 'tzo')
		document.ddns.ddnsProv.value = 1;
	else if(provider == 'phddns')
		document.ddns.ddnsProv.value = 2;
	else if (provider == 'dlinkddns(Free)')
		document.ddns.ddnsProv.value = 3;
	else
		document.ddns.ddnsProv.value = 0;

	document.ddns.hostname.value = hostname;
	document.ddns.show_username.value = show_username;
	document.ddns.password.value = password;
}
function dsiabledddns()
{
	document.getElementById('hostname').disabled = true;
	document.getElementById('ddnsProv').disabled = true;
	document.getElementById('show_username').disabled = true;
	document.getElementById('password').disabled = true;
}
function enabledddns()
{
	document.getElementById('hostname').disabled = false;
	document.getElementById('ddnsProv').disabled = false;
	document.getElementById('show_username').disabled = false;
	document.getElementById('password').disabled = false;
}
function ddns_check()
{
	if (document.getElementById('enable').checked)
	{
		enabledddns();
	}
	else
	{
		dsiabledddns();			
	}
}

function add_reset()
{
	dsiabledddns();
}
	
</SCRIPT>
<link href="d_stylemain.css" rel="stylesheet" type="text/css">
</head>

<body  onload="initValue();">
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_127#>";
	SideItem="<#menu.ap_094#>";
	HelpItem="Ddns";
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
		<td class="topheader"><#ddns_000#></td>
	</tr>
	<tr>
		<td class="content">
			<p><#ddns_007#></p>
		</td>
	</tr>
</table>

<form action="/goform/DDNS" method=POST name="ddns">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#ddns_008#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">  
				<tr>
					<td class="form_label_left"><#ddns_009#></td>
					<td class="form_label_right"><input type="checkbox" id="enable" name="enable"  value="1" onclick="ddns_check()"></td>
				</tr>			
				<tr>
					<td class="form_label_left"><#ddns_010#></td>
					<td class="form_label_right">
						<select size="1" id="ddnsProv" name="ddnsProv" onChange='updateState()'>
      <option value="dyndns.org"> Dyndns.org </option>
      <option value="freedns.afraid.org"> freedns.afraid.org </option>
      <option value="zoneedit.com"> www.zoneedit.com </option>
      <option value="no-ip.com"> www.no-ip.com </option>
      <option value="oray.cn"> www.oray.cn </option>
      <option value="dlinkddns.com"> dlinkddns.com </option>

						</select>
                   			 </td>
				</tr>

				<tr>
					<td class="form_label_left"><#ddns_011#></td>
					<td class="form_label_right"><input type="text" id="hostname" name="hostname" size="35" maxlength="128"  value="<% getCfgGeneral(1, "DDNS"); %>"></td>
				</tr> 

				<tr>
					<td class="form_label_left"><#ddns_017#></td>
					<td class="form_label_right">
<script language="javascript">
var ddns_enable = '<% getCfgZero(1, "DDNSEnable"); %>'
var ddns_status = '<% getCfgGeneral(1, "DDNS_STATUS"); %>';
	if(ddns_enable == '1' && ddns_status == '1')
		dw( "<#ddns_018#>" );
	else
		dw( "<#ddns_019#>" );
</script>					
					</td>
				</tr> 

			</table>
			
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr><td colspan="2"><hr size=1 noshade align=top></td></tr>
				<tr><td colspan="2" class="form_label_left" style="text-align:left"><#ddns_012#></td></tr>
				<tr>
					<td class="form_label_left"><#ddns_013#></td>
					<td class="form_label_right"><input type="text" id="show_username" name="show_username" size="35" maxlength="63"  value=""></td>
					<input type="hidden" id="username" name="username" size="35" maxlength="63"  value=""></td>
				</tr> 
			
				<tr>
					<td class="form_label_left"><#ddns_014#></td>
					<td class="form_label_right"><input type="password" id="password" name="password" size="35" maxlength="63"  value="<% getDDNSPass(); %>"></td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
<br>
<p align=center>
<input type="submit" value="<#ddns_015#>" name="addacc" onClick="return addClick()">&nbsp;&nbsp;
<input type="reset" value="<#ddns_016#>" id="delacc" name="delacc" onClick="add_reset()">&nbsp;&nbsp; 
</p>
<!--
<table id="body_header" border="0" cellspacing="0">
	<tr>
    	<td class="topheader">动态DNS列表</td>
    </tr>
    <tr>
    	<td class="content" align="left">
        	<table class="formlisting" border="0" cellpadding="0" cellspacing="0" width="500">
            	<tr class="form_label_row">
                	<td class="form_label_col">选择</td>
                    <td class="form_label_col">状态</td>
                    <td class="form_label_col">服务商</td>
                    <td class="form_label_col">主机名</td>
                    <td class="form_label_col">用户名</td>

                </tr>

<TR>
<TD align=center bgcolor="#C0C0C0"><b><input type="radio" name="select" value="0" onClick="postDdns( '0', 'dlinkddns(Free)', 'we3w', '444', '566', '2')"></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>disable</b></font></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>dlinkddns(Free)</b></font></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>we3w</b></font></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>444</b></font></b></TD>
</TR>
            </table>
        </td>
    </tr>
</table>
-->

<input type="hidden" NAME="submit.htm?d_ddns.htm" value="Send"> 
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
<script> updateState(); </script>  
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
