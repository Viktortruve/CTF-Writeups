<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>


<title><#wlrepeater_step2_000#></title>
<script>
 function isValidWPAPasswd(str)   
{   
	var patrn=/^[a-zA-Z0-9!#$%&()*+,-./:;=?@[\]^_`{|}~<>]{1}[a-zA-Z0-9!#$%&()*+,-./:;=?@[\]^_`{|}~<>\x20]{6,62}[a-zA-Z0-9!#$%&()*+,-./:;=?@[\]^_`{|}~<>]{1}$/;   
	if (!patrn.exec(str)) return false  ; 

	if(str.indexOf("  ") != -1)
	return false;
	
	if(document.formEncrypt.show_pskValue.value.indexOf("  ",0)!=-1)
		return false;
	return true;	
}
var wepkeys64_key1 = new Array();
var wepkeys64_key2 = new Array();
var wepkeys64_key3 = new Array();
var wepkeys64_key4 = new Array();
var wepkeys128_key1 = new Array();
var wepkeys128_key2 = new Array();
var wepkeys128_key3 = new Array();
var wepkeys128_key4 = new Array();
wepkeys64_key1[0]="";
wepkeys64_key2[0]="";
wepkeys64_key3[0]="";
wepkeys64_key4[0]="";
wepkeys128_key1[0]="";
wepkeys128_key2[0]="";
wepkeys128_key3[0]="";
wepkeys128_key4[0]="";
wepkeys64_key1[1]="";
wepkeys64_key2[1]="";
wepkeys64_key3[1]="";
wepkeys64_key4[1]="";
wepkeys128_key1[1]="";
wepkeys128_key2[1]="";
wepkeys128_key3[1]="";
wepkeys128_key4[1]="";
wepkeys64_key1[2]="";
wepkeys64_key2[2]="";
wepkeys64_key3[2]="";
wepkeys64_key4[2]="";
wepkeys128_key1[2]="";
wepkeys128_key2[2]="";
wepkeys128_key3[2]="";
wepkeys128_key4[2]="";
wepkeys64_key1[3]="";
wepkeys64_key2[3]="";
wepkeys64_key3[3]="";
wepkeys64_key4[3]="";
wepkeys128_key1[3]="";
wepkeys128_key2[3]="";
wepkeys128_key3[3]="";
wepkeys128_key4[3]="";
wepkeys64_key1[4]="";
wepkeys64_key2[4]="";
wepkeys64_key3[4]="";
wepkeys64_key4[4]="";
wepkeys128_key1[4]="";
wepkeys128_key2[4]="";
wepkeys128_key3[4]="";
wepkeys128_key4[4]="";
wepkeys64_key1[5]="";
wepkeys64_key2[5]="";
wepkeys64_key3[5]="";
wepkeys64_key4[5]="";
wepkeys128_key1[5]="";
wepkeys128_key2[5]="";
wepkeys128_key3[5]="";
wepkeys128_key4[5]="";
function validateWepKey(idx, str)
{	
	if (document.formEncrypt.defaultTxKeyId[idx].checked ==true && str.length==0) 
	{		
		idx++;		
		alert("<#wlrepeater_step2_001#>");		
		return 0;	
	}	
	if (str.length ==0)		
		return 1;	
	var keylen;	
	if(document.formEncrypt.length.selectedIndex == 0)
	{		
		//64 bit, 5 ASCII or 10 Hex		
		if ( str.length == 5) 
		{			
			//ASCII			
			document.formEncrypt.format.value = 1;			
			keylen = 5;		
		}
		else 
		if ( str.length == 10) 
		{			
			//Hex			
			document.formEncrypt.format.value = 0;			
			keylen = 10;		
		}
		else
		{			
			idx++;			
			alert("<#wlrepeater_step2_002#>");			
			return 0;		
		}		
	}
	else
	{		
		//128 bit, 13 ASCII or 26 Hex		
		if ( str.length == 13) 
		{			
			//ASCII			
			document.formEncrypt.format.value = 1;			
			keylen = 13;		
		}
		else 
			if ( str.length == 26) 
			{			
				//Hex			
				document.formEncrypt.format.value = 0;			
				keylen = 26;		
			}
			else 
			{			
				idx++;			
				alert("<#wlrepeater_step2_003#>");			
				return 0;		
			}	
	}	
	if ( str == "*****" || str == "**********" || str == "*************" || str == "**************************" )		
		return 1;	
	if (document.formEncrypt.format.value == 1)	
	{		
		//add by ramen 20090604     		
		var patrn=/^[a-zA-Z0-9!#$%&()*+,-./:;=@[\]^_`{|}~<>]{1}[a-zA-Z0-9!#$%&()*+,-./:;=@[\]^_`{|}~<>\x20]*[a-zA-Z0-9!#$%&()*+,-./:;=@[\]^_`{|}~<>]{1}$/;  		   			
		if (!patrn.exec(str)) 
		{			
			alert("<#wlrepeater_step2_004#>");			
			return 0  ; 		
		}		
		if(str.indexOf("  ",0)!=-1)		
		{		
			alert("<#wlrepeater_step2_005#>");			
			return 0;		
		}				
		return 1;	
	}	
	for (var i=0; i<str.length; i++) 
	{		
		if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) >= 'a' && str.charAt(i) <= 'f') || (str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
			continue;		
		alert("<#wlrepeater_step2_006#>");		
		return 0;	
	}
	return 1;
}
function WepKeyChange()
{	
	for (var i=1; i<=4; i++)	
	{		
		var radiogroup = document.formEncrypt.defaultTxKeyId;		
		var keyfiled = document.getElementById('key'+i);		
		if(radiogroup[i-1].checked==true)
		{			
			enableTextField(keyfiled);		
		}
		else
		{			
			disableTextField(keyfiled);		
		}	
	}
}
function checkState()
{	
	document.getElementById('optionforwep').style.display = (document.formEncrypt.method.selectedIndex==1)? '':'none';
	WepKeyChange();		
	document.getElementById('optionforwpa').style.display = (document.formEncrypt.method.selectedIndex>=2)? '':'none';	
	
	document.getElementById('wpainfo1').style.display = 'none';
	document.getElementById('wpainfo2').style.display = 'none';
	document.getElementById('wpainfo3').style.display = 'none';
	if(document.formEncrypt.method.selectedIndex == 2 || document.formEncrypt.method.selectedIndex == 3)
		document.getElementById('wpainfo1').style.display='';
	else if (document.formEncrypt.method.selectedIndex==4 || document.formEncrypt.method.selectedIndex==5)
		document.getElementById('wpainfo2').style.display='';
		else if(document.formEncrypt.method.selectedIndex==6)
			document.getElementById('wpainfo3').style.display=(document.formEncrypt.method.selectedIndex==6)? '':'none';

}
function setDefaultKeyValue()
{		
	var idx = 5; //repeater
	
	if (document.formEncrypt.length.value == 1) 
	{		
		document.formEncrypt.show_key1.maxLength = 10;		
		document.formEncrypt.show_key2.maxLength = 10;		
		document.formEncrypt.show_key3.maxLength = 10;		
		document.formEncrypt.show_key4.maxLength = 10;				
		document.formEncrypt.show_key1.value = wepkeys64_key1[idx];		
		document.formEncrypt.show_key2.value = wepkeys64_key2[idx];		
		document.formEncrypt.show_key3.value = wepkeys64_key3[idx];		
		document.formEncrypt.show_key4.value = wepkeys64_key4[idx];	
	}	  
	else 
	{			
		document.formEncrypt.show_key1.maxLength = 26;		
		document.formEncrypt.show_key2.maxLength = 26;		
		document.formEncrypt.show_key3.maxLength = 26;		
		document.formEncrypt.show_key4.maxLength = 26;				
		document.formEncrypt.show_key1.value = wepkeys128_key1[idx];		
		document.formEncrypt.show_key2.value = wepkeys128_key2[idx];		
		document.formEncrypt.show_key3.value = wepkeys128_key3[idx];		
		document.formEncrypt.show_key4.value = wepkeys128_key4[idx];		  
	}
}
function updateFormat()
{	
	if (document.formEncrypt.length.selectedIndex == 0) 
	{		
		document.formEncrypt.format.options[0].text = '<#wlrepeater_step2_007#>';		
		document.formEncrypt.format.options[1].text = '<#wlrepeater_step2_008#>';	
	}	
	else 
	{		
		document.formEncrypt.format.options[0].text = '<#wlrepeater_step2_009#>';		
		document.formEncrypt.format.options[1].text = '<#wlrepeater_step2_010#>';	
	}	
	setDefaultKeyValue();
}
function lengthClick()
{	
	if (document.formEncrypt.length.selectedIndex==0)
	{		
		//64 bits		
		var keysize = 10;		
		for (var i=1; i<=4; i++)		
		{			
			document.getElementById('key'+i).size =keysize + 2 ; 
			// extra for Mac						
			if (document.getElementById('key'+i).value.length>10)				
				document.getElementById('key'+i).value = document.getElementById('key'+i).value.substring(0,10);			
			document.getElementById('key'+i).maxLength=10;		
		}	
	}
	else 
		if (document.formEncrypt.length.selectedIndex==1)
		{		
			//128 bits		
			var keysize = 26;		
			for (var i=1; i<=4; i++)		
			{			
				document.getElementById('key'+i).size =keysize + 8 ; 
				// extra for Mac						
				if (document.getElementById('key'+i).value.length>26)				
					document.getElementById('key'+i).value = document.getElementById('key'+i).value.substring(0,26);			
				document.getElementById('key'+i).maxLength=26;		
			}	
		}
	updateFormat();
}
function saveChanges()
{
	if (document.formEncrypt.method.selectedIndex>=2) 
	{
		var str = document.formEncrypt.show_pskValue.value;
		if (str.length != 64) 
		{
			//8-63 ASCII
			if (str.length < 8) 
			{
				alert("<#wlrepeater_step2_011#>");
				document.formEncrypt.show_pskValue.focus();
				return false;
			}
			if (str.length > 63) 
			{
				alert("<#wlrepeater_step2_012#>");
				document.formEncrypt.show_pskValue.focus();
				return false;
			}
			//add by ramen 20090603 for telefonica 
			if(!isValidWPAPasswd(str))
			{
	 			alert("<#wlrepeater_step2_013#>");
				return false;
			}		
			document.formEncrypt.pskFormat.value=0;
		}
		else
		{
			//64 bit hex number
			for (var i=0; i<str.length; i++) 
			{
				if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
				(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
				(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
					continue;
				alert("<#wlrepeater_step2_014#>");
				document.formEncrypt.show_pskValue.focus();
				return false;
	  		}
			
			document.formEncrypt.pskFormat.value=1;
		}	
  	}
	
	if (document.formEncrypt.show_pskValue.value != "")
	{
		document.formEncrypt.pskValue.value = Base64.Encode(document.formEncrypt.show_pskValue.value);
	}
	document.formEncrypt.show_pskValue.disabled = true;
	//check wep key	
	if (document.formEncrypt.method.selectedIndex ==1)	
	{		
		if ( document.formEncrypt.defaultTxKeyId[0].checked ==true)
		{			
			if(validateWepKey(0,document.formEncrypt.show_key1.value)==0) 
			{				
				document.formEncrypt.show_key1.focus();				
				return false;			
			}		
		}		
		if ( document.formEncrypt.defaultTxKeyId[1].checked ==true)
		{			
			if (validateWepKey(1,document.formEncrypt.show_key2.value)==0) 
			{				
				document.formEncrypt.show_key2.focus();				
				return false;			
			}		
		}		
		if ( document.formEncrypt.defaultTxKeyId[2].checked ==true)
		{			
			if (validateWepKey(2,document.formEncrypt.show_key3.value)==0) 
			{				
				document.formEncrypt.show_key3.focus();				
				return false;			
			}		
		}		
		if ( document.formEncrypt.defaultTxKeyId[3].checked ==true)
		{			
			if (validateWepKey(3,document.formEncrypt.show_key4.value)==0) 
			{				
				document.formEncrypt.show_key4.focus();				
				return false;			
			}		
		}	
	}
	
  for (var i=1; i<=4; i++)
 {
  var hidden_radiogroup = document.formEncrypt.defaultTxKeyId;
  var hidden_keyfiled = document.getElementById('key'+i);
  var keyfiled = document.getElementById('show_key'+i);

  if(hidden_radiogroup[i-1].checked == true)
  {
   enableTextField(hidden_keyfiled);
   if ( keyfiled.value != '')
   {
	hidden_keyfiled.value  = Base64.Encode(keyfiled.value);
   }
  }
  else
  {
   disableTextField(hidden_keyfiled);
  }
  
  disableTextField(keyfiled);
 }
	
	
	create_backmask();
	document.getElementById("loading").style.display="";
   	return true;
}
</script>
</head>
<body>
<script language="JavaScript">
	TabHeader="<#menu.ap_130#>";
	SideItem="<#menu.ap_078#>";
	HelpItem="wlrepeater";
</script>
<script type='text/javascript'>
	mainTableStart();
	logo();
	TopNav();
	ThirdRowStart();
	Write_Item_Images();
	mainBodyStart();
</script>
<form action="goform/form2Wl5RepeaterStep2.cgi"  method=POST name="formEncrypt">
	<table id=box_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader>
				<#wlrepeater_step2_015#>
			</td>
		</tr>
		<tr>
			<td class=content>
				<p><#wlrepeater_step2_016#></p>
			</td>
		</tr>
	</table>
	<table id=body_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader><#wlrepeater_step2_017#>
			</td>
		</tr>
		<tr>
			<td class=content>
				<table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>
					<tr>
						<td class=form_label_40><#wlrepeater_step2_018#></td>
						<td>
							<select size="1" name="method" onChange="checkState()">
<option value="0">None</option>
<option value="1">WEP</option>
<option value="2" >WPA-PSK(TKIP)</option>
<option value="3">WPA-PSK(AES)</option>
<option value="4">WPA2-PSK(AES)</option>
<option value="5">WPA2-PSK(TKIP)</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	
	</table>
	<div  id="optionforwep" style="display:none">
	<table id=body_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader><#wlrepeater_step2_019#></td>
		</tr>
		<tr>
			<td class=content align=center>
				<table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>
					<tr>
						<td class=form_label_40><#wlrepeater_step2_020#></td>
						<td>
							<select size="1" name="authType">
								<option value=2 ><#wlrepeater_step2_021#></option>
								<option value=1 ><#wlrepeater_step2_022#></option>
							</select>						
						</td>
					</tr>
					<tr>
						<td class=form_label_40><#wlrepeater_step2_023#></td>
						<td><select size="1" name="length" ONCHANGE=lengthClick()>
							<option value=1><#wlrepeater_step2_024#></option>
							<option value=2><#wlrepeater_step2_025#></option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
	<table id=body_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader><#wlrepeater_step2_026#></td>
		</tr>
		<tr>
			<td class=content align=center>
				<table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>
					<tr>
						<td class=form_label_40><#wlrepeater_step2_027#></td>
						<td>
							<input type="radio" name="defaultTxKeyId" value="1" onclick="WepKeyChange();">
							<input type="text" name="show_key1" id="show_key1" size="26">
							<input type="hidden" name="key1" id="key1" size="26">
						</td>
					</tr>
					<tr>
						<td class=form_label_40><#wlrepeater_step2_028#></td>
						<td>
							<input type="radio" name="defaultTxKeyId" value="2" onclick="WepKeyChange();">
							<input type="text" name="show_key2" id="show_key2" size="26">
							<input type="hidden" name="key2" id="key2" size="26">
						</td>
					</tr>			
					<tr>
						<td class=form_label_40><#wlrepeater_step2_029#></td>						
						<td>
							<input type="radio" name="defaultTxKeyId" value="3" onclick="WepKeyChange();">
							<input type="text" name="show_key3" id="show_key3" size="26">
							<input type="hidden" name="key3" id="key3" size="26">
						</td>
					</tr>		
					<tr>
						<td class=form_label_40><#wlrepeater_step2_030#></td>						 
						<td>
							<input type="radio" name="defaultTxKeyId" value="4" onclick="WepKeyChange();">
							<input type="text" name="show_key4" id="show_key4" size="26">
							<input type="hidden" name="key4" id="key4" size="26">
						</td>
					</tr>				

				</table>
			</td>
		</tr>
	</table>		
	</div>
	<div  id="optionforwpa" style="display:none">
	<table id=body_header border=0 cellSpacing=0>
		<tr>
			<td class=topheader  id="wpainfo1" name = "wpainfo1" style="display:none"><#wlrepeater_step2_031#>
			</td>
			<td class=topheader  id="wpainfo2" name = "wpainfo2" style="display:none"><#wlrepeater_step2_032#>
			</td>
			<td class=topheader  id="wpainfo3" name = "wpainfo3" style="display:none"><#wlrepeater_step2_033#>
			</td>
		</tr>
		<tr>
			<td class=content align=center>
				<table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>
					<tr style="display:none">
						<td class=form_label_40><#wlrepeater_step2_034#></td>
						<td>
							<select size="1" name="pskFormat">
							<option value=0 ><#wlrepeater_step2_035#></option>
							<option value=1 ><#wlrepeater_step2_036#></option>
							</select>
					        </td>
					</tr>	
					<tr id=tr_psk style="">
						<td class=form_label_40><#wlrepeater_step2_037#></td>
						<td>	 
							<input type="hidden" name="pskValue" size="32" maxlength="64" value="" >
							<input type="text" name="show_pskValue" size="32" maxlength="64" value="" ><#wlrepeater_step2_038#>
					        </td>
					</tr>
					<tr style="display:none">
						<td class=form_label_40><#wlrepeater_step2_039#></td>
						<td>
							<select size="1" name="format" ONCHANGE=setDefaultKeyValue()>
							<option value=1><#wlrepeater_step2_040#></option>
							<option value=2><#wlrepeater_step2_041#></option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
	</div>
	<p>
		<font color="red"></font>
	</p>
	<p align=center>
	<input type=hidden name="apcli_channel" value="<% getCfg2General(1, "apcli_channel"); %>">
<INPUT TYPE="HIDDEN" NAME="checkWPS2" VALUE="1">		<input type=submit value="<#wlrepeater_step2_043#>" name=save onClick="return saveChanges()">&nbsp;&nbsp;
	</p>
	<input type="hidden" name="basicrates" value=0>
	<input type="hidden" name="operrates" value=0>
	 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
	<script>
	document.formEncrypt.method.value = "<% getCfg2Zero(1, "WifiSecurity"); %>";	
	document.formEncrypt.pskFormat.value = 0;
	checkState();
	updateFormat();
	</script>
</form>
<script type='text/javascript'>
	mainBodyEnd();
	ThirdRowEnd();
	Footer()
	mainTableEnd()
</script>
</body>
</html>

