<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#wlactrl_000#></title>
<script>

function skip () { this.blur(); }

function checkmac()
{
	if (document.formWlAcAdd.mac.value != "" ){
		if (checkCloneMac(document.formWlAcAdd.mac) == false)
			return false;
			
		var all_str = "<% getCfg2General(1, "AccessControlList0"); %>";
		var entries = new Array();
		if(all_str.length){
			entries = all_str.split(";");

			//20090611 Gord # Maximum rules is 4
			if(entries.length == 8){
				alert("<#wlactrl_001#>");
				return false;
			}

			for(i=0; i<entries.length; i++){
				if( isSameMac(document.formWlAcAdd.mac.value , entries[i] )){
					alert("<#wlactrl_002#>");
					document.formWlAcAdd.mac.focus();
					return false;
				}
			}
		}
	}
	else
	{
	   alert("<#wlactrl_003#>");
		return false;
	}

	return true;
}


function addClick()
{
	if(document.formWlAcAdd.mac.value)
	{
		if (!checkmac(document.formWlAcAdd.mac, 1))	{
			return false;
	  }
	//document.formWlAcAdd.mac.value = document.formWlAcAdd.mac.value.toLowerCase();
	}
	else
	{
		alert("<#wlactrl_025#>");
		return false;
	}
	if(document.formWlAcDel.totalNum.value == '20')
	{
		alert("<#wlactrl_004#>");
		return false;
	}
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

function disableDelButton()
{
	disableButton(document.formWlAcDel.deleteSelFilterMac);
	disableButton(document.formWlAcDel.deleteAllFilterMac);
}

function enableAc()
{
  enableTextField(document.formWlAcAdd.mac);
}

function disableAc()
{
  disableTextField(document.formWlAcAdd.mac);
}

function onClickUpdateState()
{
	if(wlanDisabled || wlanMode == 1 || wlanMode ==2)
	{
		disableDelButton();
		disableButton(document.formWlAcAdd.reset);
		disableButton(document.formWlAcAdd.addFilterMac);
		disableCheckBox(document.formWlAcDel.wlanAcEnabled);
		disableAc();
	} 
	else
	{
		if (document.formWlAcDel.wlanAcEnabled.checked == true)
		{
			document.formWlAcDel.wlanAcEnabled.value = "1";
			enableButton(document.formWlAcAdd.reset);
			enableButton(document.formWlAcAdd.addFilterMac);
			enableAc();
		}
		else
		{
			document.formWlAcDel.wlanAcEnabled.value = "0";
			disableButton(document.formWlAcAdd.reset);
			disableButton(document.formWlAcAdd.addFilterMac);
			disableAc();
		}
	}
}
function updateState()
{
	if(wlanDisabled || wlanMode == 1 || wlanMode ==2)
	{
		disableDelButton();
		disableButton(document.formWlAcAdd.reset);
		disableButton(document.formWlAcAdd.addFilterMac);
		disableCheckBox(document.formWlAcDel.wlanAcEnabled);
		disableAc();
	} 
	else
	{
		if (document.formWlAcDel.wlanAcEnabled.value == "1") 
		{
			document.formWlAcDel.wlanAcEnabled.checked = true;
			enableButton(document.formWlAcAdd.reset);
			enableButton(document.formWlAcAdd.addFilterMac);
			enableAc();
		}
		else 
		{
			document.formWlAcDel.wlanAcEnabled.checked = false;
			disableButton(document.formWlAcAdd.reset);
			disableButton(document.formWlAcAdd.addFilterMac);
			disableAc();
		}
	}
}


function delACLEntryCheck()
{
	if ( deleteClick() == true){
		if (document.formWlAcDel.checkWPS2.value != 0){
			if (document.formWlAcDel.wlanAcEnabled.checked == true && document.formWlAcDel.totalNum.value == 1){
				//if (confirm("If ACL Mode is set to 'Allowed List' and ACL list has no entry, the WPS would be disabled.\nDo you sure?") == 0){
				if (confirm("<#wlactrl_005#>") == 0){
					return false;
				}
			}
		}
	} else {
		return false;
	}

	document.formWlAcDel.actrlFlag.value ="2";
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

function  delEntryCheck()
{
	if (all_str.length)
	{
		if(document.formWlAcDel.aclist.length)
		{
			for(i=0;i<document.formWlAcDel.aclist.length;i++)   
			{ 
				if(document.formWlAcDel.aclist[i].checked)
					//return deleteClick();
					return delACLEntryCheck();
			}
		}
		else
		{
			if(document.formWlAcDel.aclist.checked)
				//return deleteClick();
				return delACLEntryCheck();
		}

		alert("<#wlactrl_006#>"); 
		return false; 
	}
	else
	{
		alert("<#wlactrl_026#>");
		return false;
	}
}

function deleteACLAllClick()
{
	if (document.formWlAcDel.checkWPS2.value != 0){
    	if (document.formWlAcDel.wlanAcEnabled.checked == true && document.formWlAcDel.totalNum.value > 0){
    		//if (confirm("If ACL Mode is set to 'Allowed List' and ACL list has no entry, the WPS would be disabled.\nDo you sure?") == 0){
    		if (confirm("<#wlactrl_005#>") == 0){
    			return false;
    		}
    	}
	}
	document.formWlAcDel.actrlFlag.value ="3";
	
	if (all_str.length)
	{
		if (!confirm('<#share_055#>'))
		{
			return false;
		}
		else
		{
			create_backmask();
			document.getElementById("loading").style.display="";
			return true;
		}	
	}
	else
	{
		alert("<#wlactrl_026#>");
		return false;
	}

}
function saveChanges()
{
	if (document.formWlAcDel.checkWPS2.value != 0){
    	if (document.formWlAcDel.wlanAcEnabled.checked == true ){//document.formWlAcDel.totalNum.value == 0
    		//if (confirm("If ACL Mode is set to 'Allowed List' and ACL list has no entry, the WPS would be disabled.\nDo you sure?") == 0){
    		if (confirm("<#wlactrl_005#>") == 0){
    			return false;
    		}
    	}
    }
	document.formWlAcDel.actrlFlag.value ="1";
	create_backmask();
	document.getElementById("loading").style.display="";
	
	return true;
}
</script>
</head>
<body>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_130#>";
	SideItem="<#menu.ap_077#>";
	HelpItem="wlctrl";
</script>
<script type='text/javascript'>
	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>

<form action="/goform/form2Wl5Ac.cgi" method=POST name="formWlAcDel">
	<table id=box_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader>
				<#wlactrl_007#>
			</td>
		</tr>
		<tr>
			<td class=content>
				<p>
					<#wlactrl_008#>
				</p>
			</td>
		</tr>
	</table>
	<table id=body_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader><#wlactrl_009#></td>
		</tr>
		
		<tr>
			<td>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="wlanAcEnabled" 
value="0"				onclick="onClickUpdateState()"><#wlactrl_010#>
			</td>
		</tr>

		<tr>

			<td class=content>
				<table class=formlisting border=0>
				<tr class="form_label_row"><td class="form_label_col"><b><#wlactrl_011#></b></td><td class="form_label_col"><b><#wlactrl_012#></b></td></tr>
<script language="JavaScript" type="text/javascript">
    var i;
	var entries = new Array();
	var all_str = "<% getCfg2General(1, "AccessControlList0"); %>";

	if(all_str.length){
		entries = all_str.split(";");
		for(i=0; i<entries.length ; i++){
			document.write("<tr><td align=center width=\"45%\" bgcolor=\"#C0C0C0\"><font size=\"2\">");
			document.write(entries[i] +"</font></td>");
			document.write("<td align=center width=\"20%\" bgcolor=\"#C0C0C0\">");
			document.write("<input type=radio value=" + i + "  name=aclist >");

			document.write("</td></tr>\n");
		}
		document.write("<INPUT TYPE=\"HIDDEN\" NAME=\"totalNum\" VALUE=\"" + entries.length + "\">");

	}
	else
	{
		document.write("<INPUT TYPE=\"HIDDEN\" NAME=\"totalNum\" VALUE=\"0\">");
	}
</script>
		

</table>				
			</td>
		</tr>
	</table>	
	
	<br>
	<p align="center">
	<INPUT TYPE="HIDDEN" NAME="actrlFlag" VALUE="">
	<input type="hidden" name="tokenid" id="tokenid0" value="" >
	<INPUT TYPE="HIDDEN" NAME="checkWPS2" VALUE="<% getCfg2Zero(1, "WscModeOption"); %>">	<input type="submit" value="<#wlactrl_013#>"  name="deleteApplySubmit" onClick="return saveChanges();">&nbsp;&nbsp;
	<input type="submit" value="<#wlactrl_014#>" name="deleteSelFilterMac" onClick="return delEntryCheck()">&nbsp;&nbsp;
	<input type="submit" value="<#wlactrl_015#>" name="deleteAllFilterMac" onClick="return deleteACLAllClick()">&nbsp;&nbsp;&nbsp;
	</p>
</form>

<form action="goform/form2Wl5Ac.cgi" method=POST name="formWlAcAdd">
	<table id=body_header border=0 cellSpacing=0 style="display:none">
		<tr>
			<td class=topheader><#wlactrl_016#></td>
		</tr>

		<tr>
			<td class=content align=center>
				<table class=formarea border="0" cellpadding="0" cellspacing="0" width="450">



				
					<tr>
						<td class=form_label_40><#wlactrl_007#>: &nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><select size="1" name="wlanAcEnabled" onclick="updateState()">
							<option value=0 ><#wlactrl_017#></option>
							<option value=1 ><#wlactrl_018#></option>
							<option value=2 ><#wlactrl_019#></option>
							</select>
						</td>						
					</tr>
				</table>				
			</td>
		</tr>
	</table>

	<p align=center  style="display:none">
	<input type="submit" value="<#wlactrl_020#>" name="setFilterMode">&nbsp;&nbsp;
	</p>

	<table id=body_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader style="display:none"><#wlactrl_021#></td>
		</tr>

		<tr>
			<td class=content align=center>
				<table class=formarea border="0" cellpadding="0" cellspacing="0" width="450">
				
					<tr>
						<td class=form_label_40><#wlactrl_011#>: &nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" name="mac" size="18" maxlength="17" value="">
     &nbsp;&nbsp;<#wlactrl_022#>
						</td>						
					</tr>
					
				</table>
			</td>
		</tr>
	</table>

	<p align=center>
	<input type="submit" value="<#wlactrl_023#>" name="addFilterMac" onClick="return addClick()">&nbsp;&nbsp;
	<input type="reset" value="<#wlactrl_024#>" name="reset">&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="tokenid" id="tokenid1" value="" >
	</p> 
	<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_wl5actrl] tokenid ="+tokenid);
	
	for(var i=0;i<2;i++)
	    document.getElementById("tokenid"+i).setAttribute("value",tokenid);
    </script> 
</form>

<script>

var wlanDisabled = <% getCfg2Zero(1, "RadioOff"); %>;
wlanMode=0;
document.formWlAcDel.wlanAcEnabled.value="<% getCfg2Zero(1, "AccessPolicy0"); %>";

updateState();
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

