<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<title><#userconfig_000#></title>

<SCRIPT>
selected=0;

function includeSpace(str)
{
  for (var i=0; i<str.length; i++) {
  	if ( str.charAt(i) == ' ' ) {
	  return true;
	}
  }
  return false;
}

function includeSpecialKey(str)
{
  for (var i=0; i<str.length; i++) {
  	if (( str.charAt(i)== ' ' ) || ( str.charAt(i)== '%' )
	|| ( str.charAt(i)== '\\' ) || ( str.charAt(i)== '\'' )  	
  	|| ( str.charAt(i)== '?' )
        ||( str.charAt(i)== '&' ) ||( str.charAt(i)== '"' )) {
	  return true;
	}
  }
  
  return false;
}

function includeChinese(str)
{
	for (var i=0; i<str.length; i++) {
		if (str.charCodeAt(i) > 128) {
			return true;
		}
	}

	return false;
}

function saveChanges()
{
	if(document.userconfig.show_username.value.length == 0) 
	{
		alert('<#userconfig_001#>');
		document.userconfig.show_username.focus();
		return false;
	}
	else
	{
		if(includeSpecialKey(document.userconfig.show_username.value))
		{
			alert("<#userconfig_002#>");
			document.userconfig.show_username.focus();
			return false;
		}

		if(includeChinese(document.userconfig.show_username.value))
		{
			alert('<#userconfig_003#>');
			document.userconfig.show_username.focus();
			return false;		
		}
	}

/*
	if(document.userconfig.newpass.value.length == 0) 
	{
		alert('<#userconfig_004#>');
		document.userconfig.newpass.focus();
		return false;
	}
	else 
*/
	if(document.userconfig.newpass.value.length > 29) 
	{
		alert('<#userconfig_005#>');
		document.userconfig.newpass.focus();
		return false;
	}
	else if(document.userconfig.newpass.value.length < 6)
	{
		alert('<#userconfig_029#>');
		document.userconfig.newpass.focus();
		return false;
	}
	else
	{
		if(includeSpecialKey(document.userconfig.newpass.value)) 
		{
			alert("<#userconfig_006#>");
			document.userconfig.newpass.focus();
			return false;
		}

		if(includeChinese(document.userconfig.newpass.value))
		{
			alert('<#userconfig_007#>');
			document.userconfig.newpass.focus();
			return false;		
		}		
	}

	if (document.userconfig.newpass.value != document.userconfig.confpass.value) 
	{
		alert('<#userconfig_008#>');
		document.userconfig.newpass.focus();
		return false;
	}
		
	//
	if (document.userconfig.show_username.value != "")
	{
		document.userconfig.username.value = Base64.Encode(document.userconfig.show_username.value);
	}
	
	if (document.userconfig.newpass.value != "")
	{
		document.userconfig.newpass.value = Base64.Encode(document.userconfig.newpass.value);
		document.userconfig.confpass.value = Base64.Encode(document.userconfig.confpass.value);
	}
	
	document.userconfig.show_username.disabled = true;

	return true;
}

function modifyClick()
{
	if (!selected) {
		alert("<#userconfig_009#>");
		return false;
	}

	if (document.userconfig.oldpass.value != "")
	{
		document.userconfig.oldpass.value = Base64.Encode(document.userconfig.oldpass.value);
	}
	if (document.userconfig.oldpass.value != document.userconfig.hiddenpass.value) {
		alert('<#userconfig_010#>');
		document.userconfig.oldpass.focus();
		return false;
	}

	return saveChanges();
}

function delClick()
{
	if(!selected)
	{
		alert("<#userconfig_011#>!");
		return false;
	}
	if(document.userconfig.show_username.value == "admin")
	{
		alert("<#userconfig_012#>");
		return false;
	}
	if(document.userconfig.show_username.value == "user")
	{
		alert("<#userconfig_013#>");
		return false;
	}
	
	if (document.userconfig.show_username.value != "")
	{
		document.userconfig.username.value = Base64.Encode(document.userconfig.show_username.value);
	}
	
	if (document.userconfig.newpass.value != "")
	{
		document.userconfig.newpass.value = Base64.Encode(document.userconfig.newpass.value);
		document.userconfig.confpass.value = Base64.Encode(document.userconfig.confpass.value);
	}
	
	document.userconfig.show_username.disabled = true;

	
	return true;
}

function postEntry(user, priv, pass)
{
	document.userconfig.privilege.value = priv;
	
	if (user != "")
	{
		user = Base64.Decode(user);
	}

	if (user == "Admin" || user == "user"){
	document.userconfig.privilege.disabled = true;
	//document.userconfig.show_username.disabled = true;
	}else
		document.userconfig.privilege.disabled = false;
	document.userconfig.oldpass.disabled = false;
	document.userconfig.show_username.value = user;
	document.userconfig.hiddenpass.value = pass;
	selected = 1;
}

function disablePriv()
{
	document.userconfig.privilege.value = 0;
	document.userconfig.privilege.disabled = true;
}

function resetConfig()
{
//	disablePriv();
	document.userconfig.privilege.value = 0;
	document.userconfig.privilege.disabled = false;
	document.userconfig.oldpass.disabled = true;
}

function checkAction()
{
//	disablePriv();
//	if (document.userconfig.hiddenpass.value.length == 0)
	if (!selected)
		document.userconfig.oldpass.disabled = true;
}
</SCRIPT>
</head>

<BODY>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_128#>";
	SideItem="<#menu.ap_113#>";
	HelpItem="password";
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
		<td class=topheader><#userconfig_000#></td>
	</tr>
	<tr>
		<td class=content>
			<p><#userconfig_014#>
            </p>
		</td>
	</tr>
</table>
<br>
<form action="/goform/form2userconfig.cgi" method=POST name="userconfig">
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#userconfig_015#></td>
	</tr>
    <tr>
		<td class="content" align="left">
  			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
    			<tr>
    				<td class='form_label_left' width="20%">
                    <#userconfig_016#>
                    </td>
                    <td class='form_label_right'>
                    <input type="text" name="show_username" size="20" maxlength="29" style="width:150px">
					<input type="hidden" name="username" size="20" maxlength="29" style="width:150px">
                    </td>
    			</tr>
                <tr>
    				<td class='form_label_left' width="20%">
                    <#userconfig_017#>
                    </td>
                    <td class='form_label_right'>
                    <select size="1" name="privilege" disabled>
<option value="2">Root</option>
                    </select>
                    </td>
    			</tr>
                <tr>
    				<td class='form_label_left' width="20%">
                    <#userconfig_018#>
                    </td>
                    <td class='form_label_right'>
                    <input type="password" name="oldpass" size="20" maxlength="36">
                    </td>
    			</tr>
                <tr>
    				<td class='form_label_left' width="20%">
                    <#userconfig_019#>
                    </td>
                    <td class='form_label_right'>
                    <input type="password" name="newpass" size="20" maxlength="36">
                    </td>
    			</tr>
                <tr>
    				<td class='form_label_left' width="20%">
                    <#userconfig_020#>
                    </td>
                    <td class='form_label_right'>
                    <input type="password" name="confpass" size="20" maxlength="36">
                    </td>
    			</tr>
			</table> 
		</td>
	</tr>
</table>
<br>
<p align=center>
<!--input type="submit" value="<#userconfig_021#>" name="adduser" onClick="return saveChanges()"-->
<input type="submit" value="<#userconfig_022#>" name="modify" onClick="return modifyClick()">
<input type="submit" value="<#userconfig_023#>" name="deluser" onClick="return delClick()">
<input type="reset" value="<#userconfig_024#>" name="reset" onClick="resetConfig()">
</p>

<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#userconfig_025#></td>
	</tr>
    <tr>
        <td class=content>
  			<table class=formlisting border=0>
                <tr class=form_label_row>
                    <td class='form_label_col' width="20%">
                    <#userconfig_026#>
                    </td>
                    <td class='form_label_col' width="50%">
                    <#userconfig_027#>
                    </td>
                    <td class='form_label_col' width="30%">
                    <#userconfig_028#>
                    </td>
                </tr>
<tr class=form_label_row><td class="form_label_col" width="20%" ><input type="radio" name="select" value="s0" onClick="postEntry('<% getCfgGeneral(1, "Login_encode"); %>', '2', '<% getCfgGeneral(1, "Password_encode"); %>')"> </td>
<td class="form_label_col" width="50%" >
<script type='text/javascript'>
if ("<% getCfgGeneral(1, "Login_encode"); %>" != "")
{
	var show_login = Base64.Decode("<% getCfgGeneral(1, "Login_encode"); %>");
	dw(show_login);
}
</script>
</td>
<td class="form_label_col" width="30%" >root</td></tr>
<!--tr class=form_label_row><td class="form_label_col" width="20%" ><input type="radio" name="select" value="s2" onClick="postEntry('user', '2', 'user')"> </td>
<td class="form_label_col" width="50%" >user</td>
<td class="form_label_col" width="30%" >root</td></tr>
<tr class=form_label_row><td class="form_label_col" width="20%" ><input type="radio" name="select" value="s3" onClick="postEntry('8', '2', '8')"> </td>
<td class="form_label_col" width="50%" >8</td>
<td class="form_label_col" width="30%" >root</td></tr-->
            </table>
        </td>
    </tr>
</table>
<input type="hidden" name="hiddenpass">
<input type="hidden" NAME="submit.htm?userconfig.htm" VALUE="Send">
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
<script>
	checkAction();
</script>  
</form>

<script type='text/javascript'>
	mainBodyEnd();
	ThirdRowEnd();
	Footer()
	mainTableEnd()
</script>

<blockquote>
</body>
</html>




