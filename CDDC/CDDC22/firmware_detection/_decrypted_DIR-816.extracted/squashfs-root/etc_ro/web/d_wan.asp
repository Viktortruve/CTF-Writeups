<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#wan_eth_base_000#></title>
<SCRIPT>


var lanip="<% getLanIp(); %>";
var lanmask="<% getCfgGeneral(1, "lan_netmask"); %>";
var secondwan_type="<% getCfgZero(1, "wan_secondwan_type"); %>";
var secondwan_ip="<% getCfgGeneral(1, "wan_secondwan_ip"); %>";
var secondwan_mask="<% getCfgGeneral(1, "wan_secondwan_netmask"); %>";

function GetTimeAbs()
{
   var d;
   d = new Date();
   return Math.round(d.getTime()/1000)-d.getTimezoneOffset()*60;
}
function validateKey(str)
{
   for (var i=0; i<str.length; i++) {
    if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9'))
   continue;
 return 0;
  }
  return 1;
}


function validateIP(ip,msg)
{
 if (ip.value=="") {
  alert(msg + '<#wan_eth_base_001#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }

 var str=ip.value;
 var count=0;
 for (var i=0; i<str.length; i++)
 {
  if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') )
   continue;
  if (str.charAt(i) == '.')
  {
   count++;
   continue;
  }
  alert(msg + '<#wan_eth_base_002#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if(count!=3)
 {
  alert(msg + '<#wan_eth_base_003#>');
  ip.focus();
  return false;
 }

 if( IsLoopBackIP( ip.value)==1 ) {
  alert(msg + '<#wan_eth_base_004#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }

 if ( !checkDigitRange(ip.value,1,1,223) ) {
  alert(msg + '<#wan_eth_base_005#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if ( !checkDigitRange(ip.value,2,0,255) ) {
  alert(msg + '<#wan_eth_base_006#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if ( !checkDigitRange(ip.value,3,0,255) ) {
  alert(msg + '<#wan_eth_base_007#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }
 if ( !checkDigitRange(ip.value,4,1,254) ) {
  alert(msg + '<#wan_eth_base_008#>');
  ip.value = ip.defaultValue;
  ip.focus();
  return false;
 }

 return true;
}

function saveChanges()
{
 with(document.wan)
 {
  enableTextField(document.wan.mac_clone_value);

  if(wantype.value == 0)
  {

       if ( !validateIP(staip_ipaddr,"<#wan_eth_base_009#>"))
       {
         staip_ipaddr.focus();

          return false;
       }
       if (Lan1EqLan2(staip_ipaddr.value, lanmask, lanip, lanmask))
       {
         alert("<#wan_eth_base_010#>");
         staip_ipaddr.focus();
         return false;
       }
       if (staip_netmask.value != "")
       {
          if (!checkMask(staip_netmask))
          {

             staip_netmask.focus();
             return false;
          }
		   d1 = getDigit(staip_netmask.value,1);
		   d2 = getDigit(staip_netmask.value,2);
		   d3 = getDigit(staip_netmask.value,3);
		   d4 = getDigit(staip_netmask.value,4);
		   if((d1 == 0) || (d4 == 254) || ((d1 == 255)&&(d2 == 255)&&(d3 == 255)&&(d4 == 255)))
		   {
					 alert('<#wan_eth_base_011#>');
					 staip_netmask.focus();
				return false;
		   }
	   }


		  if ( !validateIP(staip_gateway,"<#wan_eth_base_012#>"))
		  {
		   staip_gateway.focus();

				   return false;
			   }
	   if (!Lan1EqLan2(staip_ipaddr.value, staip_netmask.value, staip_gateway.value, staip_netmask.value))
	   {
		alert("<#wan_eth_base_013#>");
		staip_gateway.focus();
		 return false;
	   }

	   if (staip_ipaddr.value == staip_gateway.value)
	   {
		alert("<#wan_eth_base_014#>");
		staip_gateway.focus();
		 return false;
	   }

		 if (staip_mtusize.value != "")
		 {
			  if ( validateKey(staip_mtusize.value) == 0 ) {
			alert("<#wan_eth_base_015#>");
			staip_mtusize.focus();
			return false;
		   }
		  if (!checkDigitRange(staip_mtusize.value, 1, 616, 1500))
		  {
		   alert('<#wan_eth_base_016#>');
		   staip_mtusize.focus();
		   return false;
		  }
		}
  }

  if(wantype.value == 1 || wantype.value == 7)
  {
   if(!checkSpecialChar(dhcpc_hostname.value,0))
   {
    alert('<#wan_eth_base_017#>');
    dhcpc_hostname.focus();
       return false;
   }
   if (dhcpc_mtusize.value != "")
      {
       if ( validateKey(dhcpc_mtusize.value) == 0 ) {
     alert("<#wan_eth_base_015#>");
     dhcpc_mtusize.focus();
     return false;
    }
       if (!checkDigitRange(dhcpc_mtusize.value, 1, 616, 1500))
       {
        alert('<#wan_eth_base_016#>');
        dhcpc_mtusize.focus();
        return false;
       }
      }
  }
  //if(wantype.value >= 2 && wantype.value <= 6)
  if(wantype.value == 2 || wantype.value == 5) //pppor or rupppoe
  {
   if (show_pppoe_usrname.value=="")
   {
    alert("<#wan_eth_base_018#>");
    show_pppoe_usrname.focus();
    return false;
   }
   if(!checkSpecialChar(show_pppoe_usrname.value,1))
   {
     alert("<#wan_eth_base_019#>");
     show_pppoe_usrname.focus();
     return false;
   }
   if (pppoe_psword.value=="")
   {
    alert("<#wan_eth_base_020#>");
    pppoe_psword.focus();
    return false;
   }
   if(!checkSpecialChar(pppoe_psword.value,1))
   {
    alert("<#wan_eth_base_021#>");
    pppoe_psword.focus();
    return false;
   }
   if (pppoe_idletime.value != "")
      {
    if(validateKey(pppoe_idletime.value))
    {
        if (!checkDigitRange(pppoe_idletime.value, 1, 1, 1000) && (pppoe_contype.value == 1))
        {
         alert('<#wan_eth_base_022#>');
         pppoe_idletime.focus();
         return false;
        }
    }
    else
    {
        alert('<#wan_eth_base_023#>');
        pppoe_idletime.focus();
        return false;
    }
      }

   if (pppoe_mtusize.value != "")
      {

    if(validateKey(pppoe_mtusize.value))
    {
        if (!checkDigitRange(pppoe_mtusize.value, 1, 616, 1492))
        {
         alert('<#wan_eth_base_024#>');
         pppoe_mtusize.focus();
         return false;
        }
       }
       else
       {
      alert("<#wan_eth_base_015#>");
      pppoe_mtusize.focus();
      return false;
       }
      }
   if (pppoe_sername.value!="")
   {
    if(!checkSpecialChar(pppoe_sername.value,1))
    {
     alert('<#wan_eth_base_025#>');
     pppoe_sername.focus();
     return false;
    }
    if ( !confirm('<#wan_eth_base_026#>'))
    {
     pppoe_acname.focus();
     return false;
    }
   }

   if (pppoe_staticip.value!="")
   {
    if ( !validateIP(pppoe_staticip,"<#wan_eth_base_027#>"))
    {
           pppoe_staticip.focus();

     return false;
    }
        }

  }

	if(wantype.value == 3 ) //l2tp
	{
		if (show_l2tp_usrname.value=="")
		{
			alert("<#wan_eth_base_018#>");
			show_l2tp_usrname.focus();
			return false;
		}
		if(!checkSpecialChar(show_l2tp_usrname.value,1))
		{
			alert("<#wan_eth_base_019#>");
			show_l2tp_usrname.focus();
			return false;
		}
		if (l2tp_psword.value=="")
		{
			alert("<#wan_eth_base_020#>");
			l2tp_psword.focus();
			return false;
		}
		if(!checkSpecialChar(l2tp_psword.value,1))
		{
			alert("<#wan_eth_base_021#>");
			l2tp_psword.focus();
			return false;
		}

		if(document.wan.l2tp_iptype[1].checked == true) //l2tp over static ip
		{
			if ( !validateIP(l2tp_ipaddr,"<#wan_eth_base_009#>"))
			{
				l2tp_ipaddr.focus();
				return false;
			}
			if (Lan1EqLan2(l2tp_ipaddr.value, lanmask, lanip, lanmask))
			{
				alert("<#wan_eth_base_010#>");
				l2tp_ipaddr.focus();
				return false;
			}
			if (l2tp_netmask.value != "")
			{
				if (!checkMask(l2tp_netmask))
				{
					l2tp_netmask.focus();
					return false;
				}
				d1 = getDigit(l2tp_netmask.value,1);
				d2 = getDigit(l2tp_netmask.value,2);
				d3 = getDigit(l2tp_netmask.value,3);
				d4 = getDigit(l2tp_netmask.value,4);
				if((d1 == 0) || (d4 == 254) || ((d1 == 255)&&(d2 == 255)&&(d3 == 255)&&(d4 == 255)))
				{
					alert('<#wan_eth_base_011#>');
					l2tp_netmask.focus();
					return false;
				}
			}

			if ( !validateIP(l2tp_gateway,"<#wan_eth_base_012#>"))
			{
				l2tp_gateway.focus();
				return false;
			}
			
			if (!Lan1EqLan2(l2tp_ipaddr.value, l2tp_netmask.value, l2tp_gateway.value, l2tp_netmask.value))
			{
				alert("<#wan_eth_base_013#>");
				l2tp_gateway.focus();
				return false;
			}

			if (l2tp_ipaddr.value == l2tp_gateway.value)
			{
				alert("<#wan_eth_base_014#>");
				l2tp_gateway.focus();
				return false;
			}		
			document.wan.l2tp_mode.value = "0";

		}
		else
			document.wan.l2tp_mode.value = "1";

		if (l2tp_mtusize.value != "")
		{
			if ( validateKey(l2tp_mtusize.value) == 0 ) 
			{
				alert("<#wan_eth_base_015#>");
				l2tp_mtusize.focus();
				return false;
			}
			if (!checkDigitRange(l2tp_mtusize.value, 1, 616, 1430))
			{
				alert('<#wan_l2tp_037#>');//
				l2tp_mtusize.focus();
				return false;
			}
		}
	} //end l2tp
  
	if(wantype.value == 4 ) //pptp
	{
		if (show_pptp_usrname.value=="")
		{
			alert("<#wan_eth_base_018#>");
			show_pptp_usrname.focus();
			return false;
		}
		if(!checkSpecialChar(show_pptp_usrname.value,1))
		{
			alert("<#wan_eth_base_019#>");
			show_pptp_usrname.focus();
			return false;
		}
		if (pptp_psword.value=="")
		{
			alert("<#wan_eth_base_020#>");
			pptp_psword.focus();
			return false;
		}
		if(!checkSpecialChar(pptp_psword.value,1))
		{
			alert("<#wan_eth_base_021#>");
			pptp_psword.focus();
			return false;
		}

		if(document.wan.pptp_iptype[1].checked == true) //pptp over static ip
		{
			if ( !validateIP(pptp_ipaddr,"<#wan_eth_base_009#>"))
			{
				pptp_ipaddr.focus();
				return false;
			}
			if (Lan1EqLan2(pptp_ipaddr.value, lanmask, lanip, lanmask))
			{
				alert("<#wan_eth_base_010#>");
				pptp_ipaddr.focus();
				return false;
			}
			if (pptp_netmask.value != "")
			{
				if (!checkMask(pptp_netmask))
				{
					pptp_netmask.focus();
					return false;
				}
				d1 = getDigit(pptp_netmask.value,1);
				d2 = getDigit(pptp_netmask.value,2);
				d3 = getDigit(pptp_netmask.value,3);
				d4 = getDigit(pptp_netmask.value,4);
				if((d1 == 0) || (d4 == 254) || ((d1 == 255)&&(d2 == 255)&&(d3 == 255)&&(d4 == 255)))
				{
					alert('<#wan_eth_base_011#>');
					pptp_netmask.focus();
					return false;
				}
			}

			if ( !validateIP(pptp_gateway,"<#wan_eth_base_012#>"))
			{
				pptp_gateway.focus();
				return false;
			}
		
			if (!Lan1EqLan2(pptp_ipaddr.value, pptp_netmask.value, pptp_gateway.value, pptp_netmask.value))
			{
				alert("<#wan_eth_base_013#>");
				pptp_gateway.focus();
				return false;
			}

			if (pptp_ipaddr.value == pptp_gateway.value)
			{
				alert("<#wan_eth_base_014#>");
				pptp_gateway.focus();
				return false;
			}		

			document.wan.pptp_mode.value = "0";
		}
		else
			document.wan.pptp_mode.value = "1";

		if (pptp_mtusize.value != "")
		{
			if ( validateKey(pptp_mtusize.value) == 0 ) 
			{
				alert("<#wan_eth_base_015#>");
				pptp_mtusize.focus();
				return false;
			}
			if (!checkDigitRange(pptp_mtusize.value, 1, 616, 1436))
			{
				alert('<#wan_pptp_024#>');
				l2tp_mtusize.focus();
				return false;
			}
		}
	} //end pptp

  
  if( (wantype.value==0 || (wantype.value>0 && dns_ctrl[1].checked)) )
  {

   if ( !validateIP(wan_dns1,"<#wan_eth_base_028#>"))
   {
    wan_dns1.focus();
     return false;
   }
   if(wantype.value == 0 && wan_dns1.value == staip_ipaddr.value)
   {
    alert("<#wan_eth_base_029#>");
    wan_dns1.focus();
     return false;
   }
   if (Lan1EqLan2(wan_dns1.value, lanmask, lanip, lanmask)) {
    alert("<#wan_eth_base_030#>");
    wan_dns1.focus();
     return false;
   }
   if(wan_dns2.value!="" && wan_dns2.value != "0.0.0.0") //
   {

    if ( !validateIP(wan_dns2,"<#wan_eth_base_031#>"))
    {
     wan_dns2.focus();
      return false;
    }
    if(wan_dns2.value == wan_dns1.value)
    {
     alert("<#wan_eth_base_032#>");
     wan_dns2.focus();
      return false;
    }
    if(wantype.value == 0 && wan_dns2.value == staip_ipaddr.value)
    {
     alert("<#wan_eth_base_029#>");
     wan_dns2.focus();
      return false;
    }
    if (Lan1EqLan2(wan_dns2.value, lanmask, lanip, lanmask)) {
     alert("<#wan_eth_base_030#>");
     wan_dns2.focus();
      return false;
    }
   }

   
  }
 }
 wan_connection_type = document.wan.wantype.value;
 if(document.wan.mac_clone[2].checked)
 {
  if(!checkFormatUnicastMac(document.wan.mac_clone_value,1))
  {
   return false;
  }
 }
 ///
    if ( document.wan.show_pptp_usrname.value != "" &&  document.wan.pptp_psword.value != "")
	{
		document.wan.pptp_usrname.value = Base64.Encode(document.wan.show_pptp_usrname.value);
		document.wan.pptp_psword.value = Base64.Encode(document.wan.pptp_psword.value);	
	}
	
	if ( document.wan.show_l2tp_usrname.value != "" && document.wan.l2tp_psword.value != "")
	{
		document.wan.l2tp_usrname.value = Base64.Encode(document.wan.show_l2tp_usrname.value);
		document.wan.l2tp_psword.value = Base64.Encode(document.wan.l2tp_psword.value);	
	}

	if ( document.wan.show_pppoe_usrname.value != "")
	{
		document.wan.pppoe_usrname.value = Base64.Encode(document.wan.show_pppoe_usrname.value);
	}
	
	if ( document.wan.pppoe_psword.value != "" && document.wan.pppoe_psword.value != "********")
	{
		document.wan.pppoe_psword.value = Base64.Encode(document.wan.pppoe_psword.value);
	}
	
	document.wan.show_pptp_usrname.disabled = true;
	document.wan.show_l2tp_usrname.disabled = true;
	document.wan.show_pppoe_usrname.disabled = true;
 //
 create_backmask();
 document.getElementById("loading").style.display="";	
 return true;
}
function resetClick()
{
  disableAll();
  
  if (document.wan.wanconn_type.value==0)
  {
 displayStaticIp();
  }
  else if(document.wan.wanconn_type.value==1)
  {
 displayDhcpClient();
  }
  else if(document.wan.wanconn_type.value ==2)
  {
  if( Number(document.wan.pppoe_mtusize.value) > 1492)
	  document.wan.pppoe_mtusize.value = '1492';
 document.wan.localTimeAbs.value = GetTimeAbs();
 displayPppoe();
  }
  else if(document.wan.wanconn_type.value ==3 )//l2tp
  {
  if( Number(document.wan.l2tp_mtusize.value) > 1430)
	  document.wan.l2tp_mtusize.value = '1430';
 displayl2tp();
  }
  else if(document.wan.wanconn_type.value == 4 )//pptp
  {
  if( Number(document.wan.pptp_mtusize.value) > 1436)
	  document.wan.pptp_mtusize.value = '1436';
	displaypptp();
  }
  else if(document.wan.wanconn_type.value == 5 )//ruspppoe
  {
  if( Number(document.wan.pptp_mtusize.value) > 1492)
	  document.wan.pptp_mtusize.value = '1492';
	displayPppoe();	
  display2ndWan();	
  }

  reset2ndWan();
  if(document.wan.mac_clone_display.value == 1)
  {
 enableRadioGroup(document.wan.mac_clone);
  }
  else
  {
 disableRadioGroup(document.wan.mac_clone);
 disableTextField(document.wan.mac_clone_value);
  }
  if (wmode != "STATIC")
  {
	disableTextField(document.wan.wan_dns1);
	disableTextField(document.wan.wan_dns2);
	disableRadioGroup(document.wan.wan_dns3);
  }
  var macclone = '<% getCfgGeneral(1, "macCloneEnabled"); %>';
  if(macclone == '0'){
  	document.wan.mac_clone[0].checked = true;
	disableTextField(document.wan.mac_clone_value);
  }else if(macclone == '1'){
  	document.wan.mac_clone[1].checked = true;
	disableTextField(document.wan.mac_clone_value);
  }else if(macclone == '2'){
  	document.wan.mac_clone[2].checked = true;  
	document.wan.mac_clone_value.disalbed = false;
  }
}
function idleTimeEnabled()
{
  document.getElementById('idletime_label').style.display = '';
  document.getElementById('idletime_text').style.display = '';
}
function idleTimeDisabled()
{
  document.getElementById('idletime_label').style.display = 'none';
  document.getElementById('idletime_text').style.display = 'none';
}
function pptpEnabled()
{
  document.getElementById('pptp_block').style.display = 'block';
}
function l2tpEnabled()
{
  document.getElementById('l2tp_block').style.display = 'block';
}
function pptpDisabled()
{
  document.getElementById('pptp_block').style.display = 'none';
}
function l2tpDisabled()
{
  document.getElementById('l2tp_block').style.display = 'none';
}
function staticIpEnabled()
{
  document.getElementById('staticIp_block').style.display = 'block';
}
function staticIpDisabled()
{
  document.getElementById('staticIp_block').style.display = 'none';
}
function dhcpClientEnabled()
{
  document.getElementById('dhcpClient_block').style.display = 'block';
}
function dhcpClientDisabled()
{
  document.getElementById('dhcpClient_block').style.display = 'none';
}
function pppoeEnabled()
{
  document.getElementById('pppoe_block').style.display = 'block';
}
function pppoeDisabled()
{
  document.getElementById('pppoe_block').style.display = 'none';
}
function dnsEnabled()
{
  document.getElementById('dns_block').style.display = 'block';
}
function dnsDisabled()
{
  document.getElementById('dns_block').style.display = 'none';
}
function dnsipEnabled()
{
  document.getElementById('dns_ip_block').style.display = 'block';
}
function dnsipDisabled()
{
  document.getElementById('dns_ip_block').style.display = 'none';
}
function maccloneEnabled()
{
  document.getElementById('macclone').style.display = 'block';
}
function maccloneDisabled()
{
  document.getElementById('macclone').style.display = 'none';
}

function disable2ndWan()
{
  document.getElementById('secondwan_block').style.display = 'none';
}
function display2ndWan()
{
 document.getElementById('secondwan_block').style.display = 'block';
}

function dnsSelection()
{
 if (document.wan.dns_ctrl[0].checked)
 {
  disableTextField(document.wan.wan_dns1);
  disableTextField(document.wan.wan_dns2);
  disableTextField(document.wan.wan_dns3);
 }
 else
 {
  enableTextField(document.wan.wan_dns1);
  enableTextField(document.wan.wan_dns2);
  enableRadioGroup(document.wan.wan_dns3);
 }
}
function macSelection()
{
 if (document.wan.mac_clone[0].checked)
 {
  document.wan.mac_clone_value.value = document.wan.mac_default_value.value;
  disableTextField(document.wan.mac_clone_value);
 }
 else if (document.wan.mac_clone[1].checked)
 {
  document.wan.mac_clone_value.value = document.wan.mac_client_value.value;
  disableTextField(document.wan.mac_clone_value);
 }
 else if (document.wan.mac_clone[2].checked)
 {
  document.wan.mac_clone_value.value = document.wan.mac_manual_value.value;
  enableTextField(document.wan.mac_clone_value);
 }
}
function secondWanSelection()
{
 if (document.wan.secondwantype[0].checked)
 {
  enableTextField(document.wan.secondwanip);
  enableTextField(document.wan.secondwanmask);
 }
 else if (document.wan.secondwantype[1].checked)
 {
  disableTextField(document.wan.secondwanip);
  disableTextField(document.wan.secondwanmask);
 }
}

function displayStaticIp(){
  enableTextField(document.wan.wan_dns1);
  enableTextField(document.wan.wan_dns2);
  enableTextField(document.wan.wan_dns3);
   staticIpEnabled();
   dnsipEnabled();
   maccloneEnabled();
}
function displayDhcpClient(){
 dnsSelection();
    dhcpClientEnabled();
   dnsEnabled();
   dnsipEnabled();
   maccloneEnabled();
   if(document.wan.wantype.value == 1)
   {
   document.getElementById('dhcpplus_username_label').style.display = 'none';
   document.getElementById('dhcpplus_username_text').style.display = 'none';
   document.getElementById('dhcpplus_password_label').style.display = 'none';
   document.getElementById('dhcpplus_password_text').style.display = 'none';
   }
 else if(document.wan.wantype.value == 7)
   {
   document.getElementById('dhcpplus_username_label').style.display = '';
   document.getElementById('dhcpplus_username_text').style.display = '';
   document.getElementById('dhcpplus_password_label').style.display = '';
   document.getElementById('dhcpplus_password_text').style.display = '';
   }
}
function displayPppoe(){
 dnsSelection();
   pppoeEnabled();
   dnsEnabled();
   dnsipEnabled();
   maccloneEnabled();
 if (document.wan.pppoe_contype.value == 0)
 {
  idleTimeDisabled();
 }
 else if(document.wan.pppoe_contype.value == 1)
 {
  idleTimeEnabled();
  enableTextField(document.wan.pppoe_idletime);
  if(document.wan.pppoe_idletime.value == "0")
  {
   document.wan.pppoe_idletime.value = "5";
  }
 }
 else if(document.wan.pppoe_contype.value == 2)
 {
  idleTimeDisabled();
 }
}

function displayl2tp(){
	dnsSelection();
	l2tpEnabled();
   dnsEnabled();
   dnsipEnabled();
   maccloneEnabled();
   l2tpchangeIpType();

}
function displaypptp(){
	dnsSelection();
	pptpEnabled();
   dnsEnabled();
   dnsipEnabled();
   maccloneEnabled();
   pptpchangeIpType();
}

function pppoe_contypechang()
{
 with(document.wan)
 {
  if(pppoe_contype.value == 0)
  {
    //pppoe_cntbtn.disabled = true;
    //pppoe_discntbtn.disabled = true;
    idleTimeDisabled();
  }
  else if(pppoe_contype.value == 1)
  {
    //pppoe_cntbtn.disabled = true;
    //pppoe_discntbtn.disabled = true;
    idleTimeEnabled();
    enableTextField(pppoe_idletime);
    if(pppoe_idletime.value == "0")
    {
     pppoe_idletime.value = "5";
    }
  }
  else if(pppoe_contype.value == 2)
  {
    if(wanPPPoeConnection.value == 0) {
        //pppoe_cntbtn.disabled=false;
        //pppoe_discntbtn.disabled=true;
     }
    else {
        //pppoe_cntbtn.disabled=true;
        //pppoe_discntbtn.disabled=false;
     }
    idleTimeDisabled();
  }
 }
}

/* 
function pppoe_btn_Connect()
{
 with(document.wan)
 {
  pppoe_cntbtn.disabled = true;
  pppoe_discntbtn.disabled = false;
 }
}
function pppoe_btn_Disconnect()
{
 with(document.wan)
 {
  pppoe_cntbtn.disabled = false;
  pppoe_discntbtn.disabled = true;
 }
}
*/
function updateState()
{
}
function disableAll()
{
 l2tpDisabled();
 pptpDisabled();
 staticIpDisabled();
 dhcpClientDisabled();
 pppoeDisabled();
 dnsDisabled();
 dnsipDisabled();
 maccloneDisabled();
 disable2ndWan();
}
function wantypechang()
{
 disableAll();
 if (document.wan.wantype.value==0)
 {
    displayStaticIp();
 }
 else if(document.wan.wantype.value==1 || document.wan.wantype.value==7)
 {
  displayDhcpClient();
 }
 //else if(document.wan.wantype.value >=2 && document.wan.wantype.value <=6)
 else if(document.wan.wantype.value ==2 )
 {
  if( Number(document.wan.pppoe_mtusize.value) > 1492)
	  document.wan.pppoe_mtusize.value = '1492';
  document.wan.localTimeAbs.value = GetTimeAbs();
  displayPppoe();
 }
 
  else if(document.wan.wantype.value ==3 )//l2tp
  {
  if( Number(document.wan.l2tp_mtusize.value) > 1430)
	  document.wan.l2tp_mtusize.value = '1430';
 displayl2tp();
  }
  else if(document.wan.wantype.value == 4 )//pptp
  {
  if( Number(document.wan.pptp_mtusize.value) > 1436)
	  document.wan.pptp_mtusize.value = '1436';
	displaypptp();
  }
 else if(document.wan.wantype.value ==5 ) //ruspppoe
 {
  if( Number(document.wan.pppoe_mtusize.value) > 1492)
	  document.wan.pppoe_mtusize.value = '1492';
  document.wan.localTimeAbs.value = GetTimeAbs();
  displayPppoe();
  display2ndWan();	  
 }
  
 }
 
 function reset2ndWan()
{
  if(document.wan.wanconn_type.value == 5 ){
  display2ndWan();
  if(secondwan_type == 0)
  {
   document.wan.secondwantype[0].checked=true;
   document.wan.secondwantype[1].checked=false;
  }else
  {
   document.wan.secondwantype[0].checked=false;
   document.wan.secondwantype[1].checked=true;
  }
  secondWanSelection();
  document.wan.secondwanip.value = secondwan_ip;
  document.wan.secondwanmask.value = secondwan_mask;
 }else
  disable2ndWan();
}

 
 function pptpchangeIpType()
 {
   if(document.wan.pptp_iptype[0].checked == true)
   {
   document.getElementById('pptp_ipaddr_block').style.display = 'none';
   document.getElementById('pptp_netmask_block').style.display = 'none';
   document.getElementById('pptp_gateway_block').style.display = 'none';
   }
 else 
   {
   document.getElementById('pptp_ipaddr_block').style.display = '';
   document.getElementById('pptp_netmask_block').style.display = '';
   document.getElementById('pptp_gateway_block').style.display = '';
   } 
 
 }
  function l2tpchangeIpType()
 {
   if(document.wan.l2tp_iptype[0].checked == true)
   {
   document.getElementById('l2tp_ipaddr_block').style.display = 'none';
   document.getElementById('l2tp_netmask_block').style.display = 'none';
   document.getElementById('l2tp_gateway_block').style.display = 'none';
   }
 else 
   {
   document.getElementById('l2tp_ipaddr_block').style.display = '';
   document.getElementById('l2tp_netmask_block').style.display = '';
   document.getElementById('l2tp_gateway_block').style.display = '';
   } 
 
 }
  
var wjson = {
0	:	["STATIC", 	"<#wan_eth_base_070#>"],
1	:	["DHCP", 	"<#wan_eth_base_071#>"],
2	:	["PPPOE", 	"<#wan_eth_base_072#>"],
3	:	["L2TP", 	"L2TP"],
4	:	["PPTP", 	"PPTP"],
5	:	["RUPPPOE", 	"<#wan_eth_base_073#>"]
};

var wmode = "<% getCfgGeneral(1, "wanConnectionMode"); %>";
var wdns = "<% getCfgGeneral(1, "wan_dhcp_autodns"); %>";
var pppoe_mode = "<% getCfgGeneral(1, "wan_pppoe_opmode"); %>";
/*
if (wmode =="")
{
	wmode = "<% getCfgGeneral(1, "wanConnectionMode"); %>";
}
*/
function initValue()
{
	var wmtu = "<% getCfgGeneral(1, "wan_mtu"); %>";
	var whostname = "<% getCfgGeneral(1, "wan_dhcp_hn"); %>";
	var wdns; 
	
	if ( "<% getCfgGeneral(1, "wan_pptp_user_encode"); %>" != "" && "<% getCfgGeneral(1, "wan_pptp_pass_encode"); %>" != "")
	{
		document.wan.show_pptp_usrname.value = Base64.Decode("<% getCfgGeneral(1, "wan_pptp_user_encode"); %>");
		document.wan.pptp_psword.value = Base64.Decode("<% getCfgGeneral(1, "wan_pptp_pass_encode"); %>");	
	}
	else
	{
		document.wan.show_pptp_usrname.value = "pptp_user";
		document.wan.pptp_usrname.value = "pptp_user";
		document.wan.pptp_psword.value = "pptp_passwd";	
	}
	
	if ( "<% getCfgGeneral(1, "wan_l2tp_user_encode"); %>" != "" && "<% getCfgGeneral(1, "wan_l2tp_pass_encode"); %>" != "")
	{
		document.wan.show_l2tp_usrname.value = Base64.Decode("<% getCfgGeneral(1, "wan_l2tp_user_encode"); %>");
		document.wan.l2tp_psword.value = Base64.Decode("<% getCfgGeneral(1, "wan_l2tp_pass_encode"); %>");	
	}
	else
	{
		document.wan.show_l2tp_usrname.value = "l2tp_user";
		document.wan.l2tp_usrname.value = "l2tp_user";
		document.wan.l2tp_psword.value = "l2tp_passwd";	
	}
	
	if ( "<% getCfgGeneral(1, "wan_pppoe_user_encode"); %>" != "")
	{
		document.wan.show_pppoe_usrname.value = Base64.Decode("<% getCfgGeneral(1, "wan_pppoe_user_encode"); %>");
	}	
	
	if (wmode == "STATIC")
	{
		document.wan.staip_mtusize.value = wmtu;
		document.wan.wan_dns1.value = "<% getCfgGeneral(1, "wan_primary_dns"); %>";
		document.wan.wan_dns2.value = "<% getCfgGeneral(1, "wan_secondary_dns"); %>";
		
	}
	else if (wmode == "DHCP")
	{
		document.wan.dhcpc_mtusize.value = wmtu;
		document.wan.dhcpc_hostname.value = whostname;
		wdns = "<% getCfgGeneral(1, "wan_dhcp_autodns"); %>";
		if(wdns == "1")//enable
		{
			document.wan.dns_ctrl[0].checked = true;
			document.wan.dns_ctrl[1].checked = false;
		}
		else//disable
		{
			document.wan.dns_ctrl[0].checked = false;
			document.wan.dns_ctrl[1].checked = true;
			document.wan.wan_dns1.value = "<% getCfgGeneral(1, "wan_dhcp_primary_dns"); %>";
			document.wan.wan_dns2.value = "<% getCfgGeneral(1, "wan_dhcp_secondary_dns"); %>";
		}

		dnsSelection();
	}
	else if (wmode == "PPPOE" || wmode == "RUPPPOE")
	{
		document.wan.pppoe_mtusize.value = wmtu;		
		wdns = "<% getCfgGeneral(1, "wan_pppoe_autodns"); %>";
		if(wdns == "1")//enable
		{
			document.wan.dns_ctrl[0].checked = true;
			document.wan.dns_ctrl[1].checked = false;
		}
		else//disable
		{
			document.wan.dns_ctrl[0].checked = false;
			document.wan.dns_ctrl[1].checked = true;
			document.wan.wan_dns1.value = "<% getCfgGeneral(1, "wan_pppoe_primary_dns"); %>";
			document.wan.wan_dns2.value = "<% getCfgGeneral(1, "wan_pppoe_secondary_dns"); %>";
		}
		dnsSelection();
	}
	else if (wmode == "PPTP")
	{
		document.wan.pptp_mtusize.value = wmtu;		
		var ipmode = "<% getCfgGeneral(1, "wan_pptp_mode"); %>";
		if(ipmode == "1")//dhcp
		{
			document.wan.pptp_iptype[0].checked = true;
			document.wan.pptp_iptype[1].checked = false;
		}
		else//static
		{
			document.wan.pptp_iptype[0].checked = false;
			document.wan.pptp_iptype[1].checked = true;
		}		
		pptpchangeIpType();

		wdns = "<% getCfgGeneral(1, "wan_pptp_autodns"); %>";
		if(wdns == "1")//enable
		{
			document.wan.dns_ctrl[0].checked = true;
			document.wan.dns_ctrl[1].checked = false;
		}
		else//disable
		{
			document.wan.dns_ctrl[0].checked = false;
			document.wan.dns_ctrl[1].checked = true;
			document.wan.wan_dns1.value = "<% getCfgGeneral(1, "wan_pptp_primary_dns"); %>";
			document.wan.wan_dns2.value = "<% getCfgGeneral(1, "wan_pptp_secondary_dns"); %>";
		}
		dnsSelection();
		
	}

	else if (wmode == "L2TP")
	{
		document.wan.l2tp_mtusize.value = wmtu;		
		
		var ipmode = "<% getCfgGeneral(1, "wan_l2tp_mode"); %>";
		if(ipmode == "1")//dhcp
		{
			document.wan.l2tp_iptype[0].checked = true;
			document.wan.l2tp_iptype[1].checked = false;
		}
		else//static
		{
			document.wan.l2tp_iptype[0].checked = false;
			document.wan.l2tp_iptype[1].checked = true;
		}
		l2tpchangeIpType();

		wdns = "<% getCfgGeneral(1, "wan_l2tp_autodns"); %>";
		if(wdns == "1")//enable
		{
			document.wan.dns_ctrl[0].checked = true;
			document.wan.dns_ctrl[1].checked = false;
		}
		else//disable
		{
			document.wan.dns_ctrl[0].checked = false;
			document.wan.dns_ctrl[1].checked = true;
			document.wan.wan_dns1.value = "<% getCfgGeneral(1, "wan_l2tp_primary_dns"); %>";
			document.wan.wan_dns2.value = "<% getCfgGeneral(1, "wan_l2tp_secondary_dns"); %>";
		}
		dnsSelection();
	}	
	macSelection();	
}
</SCRIPT>

</head>
<body onload="initValue();">
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_125#>";
 SideItem="<#menu.ap_068#>";
 HelpItem="wanif";
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
  <td class="topheader"><#wan_eth_base_000#></td>
 </tr>
 <tr>
  <td class="content">
   <p><#wan_eth_base_036#></p>
  </td>
 </tr>
</table>
<form method=POST Action="/goform/form2Wan.cgi" name="wan">
<table id="body_header" border="0" cellSpacing="0">
 <tr>
  <td class="topheader"><#wan_eth_base_037#></td>
 </tr>
 <tr>
  <td class="content" align="left">
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
<INPUT TYPE="hidden" NAME="wanPPPoeConnection" VALUE="0"> 
    <tr>
     <td class="form_label_left"><#wan_eth_base_038#></td>
     <td style="display:none;">
     <input type="text" name="localTimeAbs" size="12" maxlength="12" value="">
                    </td>
<script language="javascript">
for (var i in wjson)
{
	if( wmode == wjson[i][0] )
		dw('<input type="hidden" name="wanconn_type" value="' + i + '">');
}
</script>
     
     <td class="form_label_right">
      <select size="1" name="wantype" onChange="wantypechang()">
<script language="javascript">

for (var i in wjson)
{
	if(wjson[i][0] == wmode )
		dw('<OPTION VALUE=\"' + i + '\" SELECTED>' + wjson[i][1] + '</OPTION>');
	else
		dw('<OPTION VALUE=\"' + i + '\" >' + wjson[i][1] + '</OPTION>');		
}
//<OPTION VALUE="0" SELECTED> 静态IP</OPTION>
//<OPTION VALUE="1" > DHCP客户端</OPTION>
//<OPTION VALUE="2" > PPPoE</OPTION>
</script>
      </select>
                    </td>
    </tr>
   </table>
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="pptp_block" style="display:block">
	<!--PPTP-->
    <tr>
     <td class="form_label_left"><#wan_eth_base_043#></td>
     <td class="form_label_right">
      <input type="text" name="show_pptp_usrname" size="32" maxlength="256" value="">
	  <input type="hidden" name="pptp_usrname" size="32" maxlength="256" value="">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_044#></td>
     <td class="form_label_right">
      <input type="password" name="pptp_psword" size="32" maxlength="256" value="">
                    </td>
    </tr>
	<!--IP模式-->
	<tr>
     <td class="form_label_left">Ip Type</td>
     <td class="form_label_right">
		<input type=hidden name=pptp_mode value ="0">
	  <input onClick=pptpchangeIpType(); type=radio checked value=1 name=pptp_iptype>Dynamic IP(DHCP)
	  <input onClick=pptpchangeIpType(); type=radio  value=0 name=pptp_iptype>Static IP
	 </td>
	</tr>
	
	<tr id ="pptp_ipaddr_block" >
     <td class="form_label_left"><#wan_eth_base_039#></td>
     <td class="form_label_right">
      <input type="text" name="pptp_ipaddr" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_pptp_ip"); %>">
                    </td>
    </tr>
    <tr id ="pptp_netmask_block" >
     <td class="form_label_left"><#wan_eth_base_040#></td>
     <td class="form_label_right">
      <input type="text" name="pptp_netmask" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_pptp_netmask"); %>">
                    </td>
    </tr>
    <tr id ="pptp_gateway_block" >
     <td class="form_label_left"><#wan_eth_base_041#></td>
     <td class="form_label_right">
      <input type="text" name="pptp_gateway" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_pptp_gateway"); %>">
                    </td>
    </tr>

    <tr>
     <td class="form_label_left">Server</td>
     <td class="form_label_right">
      <input type="text" name="pptp_server" size="30" maxlength="30" value="<% getCfgGeneral(1, "wan_pptp_server"); %>">
                    </td>
    </tr>
	<!--
    <tr>
     <td class="form_label_left">Server DNS</td>
     <td class="form_label_right">
      <input type="text" name="pptp_serverdns" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_pptp_server_dns"); %>">(Optional)
                    </td>
    </tr>
	-->
    <tr>
     <td class="form_label_left"><#wan_eth_base_042#></td>
     <td class="form_label_right">
      <input type="text" name="pptp_mtusize" size="6" maxlength="6" value="1436">
                    </td>
    </tr>
   </table>
	<!--PPTP -->
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="l2tp_block" style="display:block">
	<!--L2TP-->
    <tr>
     <td class="form_label_left"><#wan_eth_base_043#></td>
     <td class="form_label_right">
      <input type="text" name="show_l2tp_usrname" size="32" maxlength="256" value="">
	  <input type="hidden" name="l2tp_usrname" size="32" maxlength="256" value="">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_044#></td>
     <td class="form_label_right">
      <input type="password" name="l2tp_psword" size="32" maxlength="256" value="">
                    </td>
    </tr>
	<!--IP模式-->
	<tr>
     <td class="form_label_left">Ip Type</td>
     <td class="form_label_right">
		<input type=hidden name=l2tp_mode value ="0">
	 <input onClick=l2tpchangeIpType(); type=radio checked value=1 name=l2tp_iptype>Dynamic IP(DHCP)
	  <input onClick=l2tpchangeIpType(); type=radio  value=0 name=l2tp_iptype>Static IP
	 </td>
	</tr>
	
	<tr id ="l2tp_ipaddr_block" >
     <td class="form_label_left"><#wan_eth_base_039#></td>
     <td class="form_label_right">
      <input type="text" name="l2tp_ipaddr" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_l2tp_ip"); %>">
                    </td>
    </tr>
    <tr id ="l2tp_netmask_block" >
     <td class="form_label_left"><#wan_eth_base_040#></td>
     <td class="form_label_right">
      <input type="text" name="l2tp_netmask" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_l2tp_netmask"); %>">
                    </td>
    </tr>
    <tr id ="l2tp_gateway_block" >
     <td class="form_label_left"><#wan_eth_base_041#></td>
     <td class="form_label_right">
      <input type="text" name="l2tp_gateway" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_l2tp_gateway"); %>">
                    </td>
    </tr>

    <tr>
     <td class="form_label_left">Server</td>
     <td class="form_label_right">
      <input type="text" name="l2tp_server" size="30" maxlength="30" value="<% getCfgGeneral(1, "wan_l2tp_server"); %>">
                    </td>
    </tr>
	<!--
    <tr>
     <td class="form_label_left">Server DNS</td>
     <td class="form_label_right">
      <input type="text" name="l2tp_serverdns" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_l2tp_server_dns"); %>">(Optional)
                    </td>
    </tr>
	-->
    <tr>
     <td class="form_label_left"><#wan_eth_base_042#></td>
     <td class="form_label_right">
      <input type="text" name="l2tp_mtusize" size="6" maxlength="6" value="1430">
                    </td>
    </tr>
   </table>
	<!--L2TP -->

	
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="staticIp_block" style="display:block">
	<tr>
     <td class="form_label_left"><#wan_eth_base_039#></td>
     <td class="form_label_right">
      <input type="text" name="staip_ipaddr" size="15" maxlength="15" value="<% getWanIp(); %>">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_040#></td>
     <td class="form_label_right">
      <input type="text" name="staip_netmask" size="15" maxlength="15" value="<% getWanNetmask(); %>">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_041#></td>
     <td class="form_label_right">
      <input type="text" name="staip_gateway" size="15" maxlength="15" value="<% getWanGateway(); %>">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_042#></td>
     <td class="form_label_right">
      <input type="text" name="staip_mtusize" size="6" maxlength="6" value="1500">
                    </td>
    </tr>
   </table>
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="dhcpClient_block" style="display:block">
    <tr>
     <td class="form_label_left" id="dhcpplus_username_label" style="display:none;"><#wan_eth_base_043#></td>
     <td class="form_label_right" id="dhcpplus_username_text" style="display:none;">
      <input type="text" name="dhcpplus_username" size="31" maxlength="31" value="">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left" id="dhcpplus_password_label" style="display:none;"><#wan_eth_base_044#></td>
     <td class="form_label_right" id="dhcpplus_password_text" style="display:none;">
      <input type="password" name="dhcpplus_password" size="18" maxlength="18" value="">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_045#></td>
     <td class="form_label_right">
     <input type="text" name="dhcpc_hostname" size="15" maxlength="15" value="<% getCfgGeneral(1, "wan_dhcp_hn"); %>">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_042#></td>
     <td class="form_label_right">
     <input type="text" name="dhcpc_mtusize" size="6" maxlength="6" value="1500">
                    </td>
    </tr>
   </table>
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="pppoe_block" style="display:block">
    <tr>
     <td class="form_label_left"><#wan_eth_base_043#></td>
     <td class="form_label_right">
      <input type="text" name="show_pppoe_usrname" size="32" maxlength="64" value="">
	  <input type="hidden" name="pppoe_usrname" size="32" maxlength="64" value="">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_044#></td>
     <td class="form_label_right">
      <input type="password" name="pppoe_psword" size="32" maxlength="256" value="<% getPPPoePass(); %>">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_046#></td>
     <td class="form_label_right">
      <input type="text" name="pppoe_sername" size="32" maxlength="32" value="<% getCfgGeneral(1, "wan_pppoe_srvname"); %>"<#wan_eth_base_052#>
                    </td>
    </tr>
    <tr style="display:none">
     <td class="form_label_left"><#wan_eth_base_047#></td>
     <td class="form_label_right">
      <input type="text" name="pppoe_acname" size="15" maxlength="15" value="">
                    </td>
    </tr>
    <tr>
     <td class="form_label_left" id="idletime_label" style="display:none;"><#wan_eth_base_048#></td>
     <td class="form_label_right" id="idletime_text" style="display:none;">
<input type="text" name="pppoe_idletime" size="6" maxlength="6" value="<% getCfgGeneral(1, "wan_pppoe_optime"); %>"> (1-1000 ><#wan_eth_base_049#>)</td> 
                   </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_042#></td>
     <td class="form_label_right">
      <input type="text" name="pppoe_mtusize" size="6" maxlength="6" value="1492">
                   </td>
    </tr>
    <tr style="display:none">
     <td class="form_label_left"><#wan_eth_base_050#></td>
     <td class="form_label_right">
      <input type="text" name="pppoe_staticip" size="15" maxlength="15" value="">
                   </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_051#></td>
     <td class="form_label_right">
      <select name="pppoe_contype" onChange="pppoe_contypechang()">
<option value="0" selected ><#wan_eth_base_052#></option>
<option value="1" ><#wan_eth_base_053#></option>
<!--<option value="2" ><#wan_eth_base_054#></option>-->
      </select>&nbsp;&nbsp;&nbsp;&nbsp;
<!--
	  <input type="submit" value="<#wan_eth_base_055#>" name="pppoe_cntbtn" disabled="true" >&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value=<#wan_eth_base_056#>" name="pppoe_discntbtn" disabled="true">
-->
<script language="javascript">
	if( pppoe_mode == "KeepAlive" )
		document.wan.pppoe_contype.value = 0;
	else
		document.wan.pppoe_contype.value = 1;
</script>

     </td>
    </tr>
   </table>
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="dns_block" style="display:block">
    <tr>
     <td class="form_label_left"><#wan_eth_base_057#></td>
     <td class="form_label_right">
		<input type="radio" name="dns_ctrl" value="0"  checked onClick="dnsSelection()">
	 <script language="javascript">
	/*
	 if( wdns == '1' )
		dw('<input type="radio" name="dns_ctrl" value="0" checked onClick="dnsSelection()">');
	else
		dw('<input type="radio" name="dns_ctrl" value="0" onClick="dnsSelection()">');
	*/
		</script>
     </td>
     <td class="form_label_right"><#wan_eth_base_058#></td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_059#></td>
     <td class="form_label_right">
		<input type="radio" name="dns_ctrl" value="1" onClick="dnsSelection()">
	 <script language="javascript">
	/*
	if( wdns == '0' )
		dw('<input type="radio" name="dns_ctrl" value="1" checked onClick="dnsSelection()">');
	else
		dw('<input type="radio" name="dns_ctrl" value="1" onClick="dnsSelection()">');
	*/
		</script>
     </td>
    </tr>
   </table>
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="dns_ip_block" style="display:block">
    <tr>
     <td class="form_label_left"><#wan_eth_base_060#></td>
     <td class="form_label_right">
<input type="text" name="wan_dns1" size="15" maxlength="15" value=""> 
     </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_061#></td>
     <td class="form_label_right">
<input type="text" name="wan_dns2" size="15" maxlength="15" value=""> 
      &nbsp;<#wan_eth_base_062#>
     </td>
    </tr>
    <tr style="display:none">
     <td class="form_label_left"><#wan_eth_base_063#></td>
     <td class="form_label_right">
<input type="text" name="wan_dns3" size="15" maxlength="15" value=0.0.0.0> 
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<div id="macclone" style="display:block">
<table id="body_header" border="0" cellSpacing="0">
 <tr>
  <td class="topheader"><#wan_eth_base_064#></td>
 </tr>
 <tr>
  <td class="content" align="left">
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
    <tr>
     <td class="form_label_left"><#wan_eth_base_065#></td>
     <td class="form_label_right">
<input type="radio" name="mac_clone" value="0" checked onClick="macSelection()">
     </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_066#></td>
     <td class="form_label_right">
<input type="radio" name="mac_clone" value="1" onClick="macSelection()">
     </td>
    </tr>
    <tr>
     <td class="form_label_left"><#wan_eth_base_067#></td>
     <td class="form_label_right">
<input type="radio" name="mac_clone" value="2" onClick="macSelection()">
     </td>
    </tr>
   </table>
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
    <tr>
     <td class="form_label_left"></td>
     <td class="form_label_right">
<input disabled="disabled" type="text" name="mac_clone_value" size="18" maxlength="17" value="<% getCfgGeneral(1, "macCloneMac"); %>"> 
     </td>
    </tr>
    <tr>
     <td style="display:none;">
<input type="text" name="mac_manual_value" size="18" maxlength="17" value="<% getCfgGeneral(1, "macCloneMac"); %>">
     </td>

	<td style="display:none;">
<input type="text" name="mac_default_value" size="18" maxlength="17" value="<% getCfgGeneral(1, "WAN_MAC_ADDR"); %>">
     </td>
     <td style="display:none;">
<input type="text" name="mac_client_value" size="18" maxlength="17" value="<% d_getPCMac(); %>">
<input type="hidden" name="mac_clone_display" value="1">
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
</div>
<div id="secondwan_block" style="display:block">

<table id="body_header" border="0" cellSpacing="0">
 <tr>
  <td class="topheader"><#wan_eth_base_074#></td>
 </tr>
 <tr>
  <td class="content" align="left">
   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
    <tr>
     <td class="form_label_left"><#wan_eth_base_075#></td>
     <td class="form_label_right">
      <input type="radio" name="secondwantype" value="0" onClick="secondWanSelection()">
     </td>
     <td class="form_label_left"><#wan_eth_base_076#></td>
     <td class="form_label_right">
      <input type="radio" name="secondwantype" value="1" onClick="secondWanSelection()">
     </td>
    </tr>
   <tr>
        <td class="form_label_left"><#wan_eth_base_077#></td>
        <td class="form_label_right">
   <input type="text" name="secondwanip" size="15" maxlength="15" disabled="true" value=0.0.0.0>
        </td>
   </tr>
    <tr>
        <td class="form_label_left"><#wan_eth_base_078#></td>
        <td class="form_label_right">
   <input type="text" name="secondwanmask" size="15" maxlength="15" disabled="true" value=0.0.0.0>
        </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
</div>
<br>
<p align=center>
<input type="submit" value="<#wan_eth_base_068#>" name="save" onClick="return saveChanges()">&nbsp;&nbsp;
<input type="reset" value="<#wan_eth_base_069#>" name="reset" onClick="resetClick()">
 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
</p>
 </form>
<script type="text/javascript">
   resetClick();
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

