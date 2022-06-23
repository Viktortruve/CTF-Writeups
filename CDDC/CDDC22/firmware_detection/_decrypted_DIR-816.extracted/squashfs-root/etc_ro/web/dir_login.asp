<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="d_stylemain.css">
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="AES.js"></script>
<title>
  <#login_000#>
</title>
<script type="text/javascript">
var ModemVer='<% getCfgGeneral(1, "ProductModemVersion"); %>';
var HardwareVer='<% getCfgGeneral(1, "HardwareVersion"); %>';
var FirmwareVer='<% getCfgGeneral(1, "FirmwareVersion"); %>';

function onlogin() {
 if (document.test.show_username.value.length <= 0) {
  alert("<#login_001#>");
  document.test.show_username.focus();
  return false;
 }
 var token = document.test.tokenid.value ;
 token =token  + "B05CC245BFB8A28A83B4F80000000000";
 if (document.test.show_username.value != "")
 {
     	document.test.username.value =Base64.Encode(document.test.show_username.value);
 }
  if ( document.test.password.value != "")
 {
	document.test.password.value = AES_Encrypt128(document.test.password.value,token);
 }
 document.test.show_username.disabled = true;
 
 
 return true;
}
function frmLoad() {
 document.test.show_username.focus();
}


function doCancel()
{
    document.test.show_username.value="";
	document.test.password.value=""; 
}

function check()
{
	var show_username=document.test.show_username.value;
	var password=document.test.password.value;
	if(document.test.show_username.value=="")
	{
		alert( "<#login_002#>" );
		document.test.show_username.focus();
		return false;
	}
	if(document.test.password.value=="")
	{
		alert( "<#login_003#>" );
		document.test.password.focus();
		return false;
	}
	return true;
	
}

function deleteCookie(name){
  var date=new Date();
  date.setTime(date.getTime()-10000); 
  document.cookie=name+"=; expire="+date.toGMTString();
}
function initValue()
{
	var logininfo;
    //init_LanguageSel("idLanguageOption"); 
	logininfo=<% getConfirmLogin(); %>;
	if(logininfo=="1")
	{
		alert("<#login_004#>");
	}
	if ( "<% getCfgGeneral(1, "Login_encode"); %>" != "")
	{
		document.test.show_username.value = Base64.Decode("<% getCfgGeneral(1, "Login_encode"); %>");
	}
    document.test.password.focus();	
	deleteCookie('curShow');
}

</script>
</head>
<body onLoad="initValue()">
<div class="login">

<table id="header_container" border="0" cellpadding="0" cellspacing="0">
	<tr class="top_product">
		<td align="left" height="30" bgcolor="#404343" colspan="1"><#product_info_002#>
            <script>
                document.write(ModemVer);
            </script>
        </td>
		<td align="right" height="30" bgcolor="#404343" colspan="2"><#product_info_000#>
			<script>
			  document.write(HardwareVer);
			</script>
			&nbsp;&nbsp;&nbsp;&nbsp;<#product_info_001#>
			<script>
				document.write(FirmwareVer);
			</script>
				&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
	</tr>
	<tr>
		<td align="left"><a href="http://www.dlink.com.tw/" target="_blank"><img src="../images/head_01.gif" border="0"></a></td>
        <td background="../images/head_02.gif" width="600"></td>
        <td align="right"><img src="../images/head_03.gif"></td>
	</tr>
</table>

<form action="goform/formLogin" method="post" name="test" autocomplete="off">
 <div class="login_box">
  <p class="letterBg">
   <#login_005#>
  </p>
  <table class="login_table">
   <tr>
    <td align='right'>
     <#login_006#>
    </td>
    <td>
     <input style="width: 150px;" type="text" id="show_username" name="show_username" value="">
	 <input style="width: 150px;" type="hidden" id="username" name="username" value="">
    </td>
   </tr>
   <tr>
    <td align='right'>
     <#login_007#>
    </td>
    <td>
     <input style="width: 150px;" name="password" id="password" type="password">
    </td>
   </tr>
      <tr>
    <td colspan="2">
      <div class="login_btn">
       <input id="loginBtn" onclick="return onlogin()" type="submit" value="<#login_008#>"
       class="link_bg">
       <input id="rewBtn" type="reset" value="<#login_009#>" class="link_bg">
       <input type="hidden" name="Language" value="Chinese">
	   <input type="hidden" name="submit.htm?login.htm" value="Send">
      </div>
    </td>
   </tr>
  </table>
 </div>
 <input type="hidden" id="tokenid"  name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</form>
<div class="loginBottom">
</div>
<div class="copywright">
<#product_info_003#></div>
</div>
</body>
</html>

