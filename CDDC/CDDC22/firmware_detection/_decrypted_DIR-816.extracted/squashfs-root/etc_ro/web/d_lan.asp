<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#tcpiplan_dhcp_000#></title>
<SCRIPT>
var lanip="<% getLanIp(); %>";
var lanmask="<% getCfgGeneral(1, "lan_netmask"); %>";
function resetClick()
{
   document.tcpip.reset;
}

function saveChanges()
{
	if (!checkIP(document.tcpip.ip))
		return false;
	if (!checkMaskSpecial(document.tcpip.mask))
		return false;
	if (!checkIpNetwork(document.tcpip.ip, document.tcpip.mask))
		return false;


	if(document.tcpip.ip.value != document.dhcpd.lan_ip.value || document.tcpip.mask.value != document.dhcpd.lan_mask.value)
	{	
		var msg="<#tcpiplan_dhcp_001#>";
		
		if (!confirm(msg))
			return false;
	}

	
}

// for dhcp server
var initDhcpDisable;

function openWindow(url, windowName) {
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

	window.open( url, windowName, settings );
}

function dhcpdEnabled()
{
  document.getElementById('dhcpserver_block').style.display = 'block';
	if(document.dhcpd.setVendor)
		enableButton( document.dhcpd.setVendor);
	if(document.dhcpd.setOpt60)
		enableButton( document.dhcpd.setOpt60);
}

function dhcpdDisabled()
{
  document.getElementById('dhcpserver_block').style.display = 'none';

	if(document.dhcpd.setVendor){

		disableButton( document.dhcpd.setVendor);
	}	
	if(document.dhcpd.setOpt60){

		disableButton( document.dhcpd.setOpt60);
	}	
}

function dhcpdRelayEnabled()
{
  document.getElementById('dhcprelay_block').style.display = 'block';
	if(document.dhcpd.setVendor)
		disableButton( document.dhcpd.setVendor);
	if(document.dhcpd.setOpt60)
		disableButton( document.dhcpd.setOpt60);	
}
function dhcpdRelayDisabled()
{
  document.getElementById('dhcprelay_block').style.display = 'none';
}


function resetDhcpServerClick()
{
  	if (initDhcpDisable==0)
  	{
  	
  		dhcpdDisabled();
  		dhcpdRelayDisabled();
  	}
  	else if(initDhcpDisable==2){

  		dhcpdRelayEnabled();
  		dhcpdDisabled();
  	}
  	else{
  		dhcpdEnabled();
  		dhcpdRelayDisabled();
  	}
}

function checkSubnet(ip, mask, client)
{
  ip_d = getDigit(ip, 4);
  mask_d = getDigit(mask, 4);
  if ( (ip_d & mask_d) != (client & mask_d ) )
	return false;

  return true;
}

function checkpoolsize(start,end)
{
	for(var i=1;i<4;i++)
	{
		if(getDigit(start, i) !=getDigit(end, i) )
		 return false;
	}

	return true;
}

function saveDhcpServerChanges()
{
  if ( document.dhcpd.dhcpserver.value==1) {
	if (document.dhcpd.dhcpRangeStart.value=="") {
   	   	alert("<#tcpiplan_dhcp_002#>");
		document.dhcpd.dhcpRangeStart.value = document.dhcpd.dhcpRangeStart.defaultValue;
		document.dhcpd.dhcpRangeStart.focus();
		return false;
	}
	if (!checkIP( document.dhcpd.dhcpRangeStart)) {
		document.dhcpd.dhcpRangeStart.focus();
		return false;
	}
	
	if (document.dhcpd.dhcpRangeEnd.value=="") {
   	   	alert("<#tcpiplan_dhcp_003#>");
		document.dhcpd.dhcpRangeEnd.value = document.dhcpd.dhcpRangeEnd.defaultValue;
		document.dhcpd.dhcpRangeEnd.focus();
		return false;
	}
	if (!checkIP( document.dhcpd.dhcpRangeEnd)) {
		document.dhcpd.dhcpRangeEnd.focus();
		return false;
	}

	if (!Lan1EqLan2(document.dhcpd.dhcpRangeStart.value, lanmask, document.dhcpd.dhcpRangeEnd.value, lanmask)) {
		alert("<#tcpiplan_dhcp_004#>");
		document.dhcpd.dhcpRangeStart.focus();
		return false;
	}

	if (!Lan1EqLan2(document.dhcpd.dhcpRangeStart.value, lanmask, lanip, lanmask)) {
		alert("<#tcpiplan_dhcp_005#>");
		document.dhcpd.dhcpRangeStart.focus();
		return false;
	}

	if(!ipaddrCompare(document.dhcpd.dhcpRangeStart.value, document.dhcpd.dhcpRangeEnd.value)) {
		alert('<#tcpiplan_dhcp_006#>');
		document.dhcpd.dhcpRangeStart.focus();
		return false;
	}


	if (  document.dhcpd.ltime.value  == 0 ) {
		alert('<#tcpiplan_dhcp_007#>');
		document.dhcpd.ltime.focus();
		return false;
	}
	if ( validateKey( document.dhcpd.ltime.value ) == 0 ) {
		alert('<#tcpiplan_dhcp_008#>');
		document.dhcpd.ltime.focus();
		return false;
	}
	//check lease time range, mins
	var maxleasetime=365*24*60;
	if ( !checkDigitRange(document.dhcpd.ltime.value,1,1,maxleasetime) ) {
   	   	alert('<#tcpiplan_dhcp_009#>');
		document.dhcpd.ltime.value = document.dhcpd.ltime.defaultValue;
		document.dhcpd.ltime.focus();
		return false;
	}
/*
    	if(!checkSpecialChar(document.dhcpd.dname.value,1))
    	{
    		alert("<#tcpiplan_dhcp_010#>!");
    		document.dhcpd.dname.focus();
    		return false;
    	}
/*
  	if(checkIP(document.dhcpd.dns1) == false)
	{
  		document.dhcpd.dns1.focus();
  		return false;
    }
  	if( (document.dhcpd.dns2.value != '') && checkIP(document.dhcpd.dns2) == false){
  		document.dhcpd.dns2.focus();
  		return false;
    }
  	if( (document.dhcpd.dns3.value != '') && checkIP(document.dhcpd.dns3) == false){
  		document.dhcpd.dns3.focus();
  		return false;
    }    
*/

  }

  if ( document.dhcpd.dhcpserver.value==1) 
  {
  	if(!checkIP(document.dhcpd.relayaddr))
  	{	
  		return false;
  	}
  }
	create_backmask();
	document.getElementById("loading").style.display="";
  return true;
}


function dhcpTblClick(url) {
	if ( document.dhcpd.dhcpserver.value==1 ) {
		openWindow(url, 'DHCPTbl' );
	}
}

function dhcpRtTblClick(url) {
	if ( document.dhcpd.dhcpserver.value==1 ) {
		openWindow(url, 'DHCPRtTbl' );
	}
}

function dhcpVendorTblClick(url) {
	if ( document.dhcpd.dhcpserver.value==1 ) {
		openWindow(url, 'DHCPVendorClassTbl' );
	}
}

function dhcpCUCOpt60TblClick(url) {
	if ( document.dhcpd.dhcpserver.value==1 ) {
		openWindow(url, 'DHCPCUCOpt60Tbl' );
	}
}

function ShowIP(ipVal) {
	document.write(getDigit(ipVal,1));
	document.write('.');
	document.write(getDigit(ipVal,2));
	document.write('.');
	document.write(getDigit(ipVal,3));
	document.write('.');
}

function dhcpmodechang(){
	if (document.dhcpd.dhcpserver.value==0)
	{
  		dhcpdDisabled();
  		dhcpdRelayDisabled();
  	}
  	else if(document.dhcpd.dhcpserver.value==2)
  	{
  		dhcpdRelayEnabled();
  		dhcpdDisabled();
  	}else{
  	dhcpdRelayDisabled();
  		dhcpdEnabled();
  	}
}

// for dhcp static ip
var sel=0;
function resetDhcpIpClick()
{
   document.dhcpip.reset;
}
function dhcpIptable(ip1,ip2,ip3,ip4,mac)
{
	this.ip1=ip1;
	this.ip2=ip2;
	this.ip3=ip3;
	this.ip4=ip4;
	//this.mac=mac;
	this.mac=mac.replace(/:/g,"");
}

	var DhcpIpTables=new Array();
function checkPoolIP(ipaddr,macaddr)
{
	var tmp = "<% getLanIp(); %>".split('.');
	var lanip1=tmp[0];//192
	var lanip2=tmp[1];//168
	var lanip3=tmp[2];
	var lanip4=tmp[3];
	var startip="<% getCfgGeneral(1, "dhcpStart"); %>".split('.')[3];
	var endip="<% getCfgGeneral(1, "dhcpEnd"); %>".split('.')[3];
var max_num=32;

	var poolstartip= getDigit(document.dhcpip.lan_dhcpRangeStart.value,1)*256*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeStart.value,2)*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeStart.value,3)*256
					+getDigit(document.dhcpip.lan_dhcpRangeStart.value,4);

	var poolendip=   getDigit(document.dhcpip.lan_dhcpRangeEnd.value,1)*256*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeEnd.value,2)*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeEnd.value,3)*256
					+getDigit(document.dhcpip.lan_dhcpRangeEnd.value,4);
	var setipaddr =  getDigit(ipaddr.value,1)*256*256*256
					+getDigit(ipaddr.value,2)*256*256
					+getDigit(ipaddr.value,3)*256
					+getDigit(ipaddr.value,4);
	macaddr.value = macaddr.value.toUpperCase();
	
	if(DhcpIpTables.length >= max_num)
	{
		alert("<#tcpiplan_dhcp_011#>");
		ipaddr.focus();
		return false;
	}
	
	if(setipaddr < poolstartip || setipaddr > poolendip)
	{
		alert("<#tcpiplan_dhcp_012#>");
		ipaddr.focus();
		return false;
	}

	if(!sel)
	{
		for(var i=0; i<DhcpIpTables.length; i++)
		{
			if(DhcpIpTables[i].ip4 ==getDigit(ipaddr.value,4)
			&& DhcpIpTables[i].ip3 ==getDigit(ipaddr.value,3)
			&& DhcpIpTables[i].ip2 ==getDigit(ipaddr.value,2)
			&& DhcpIpTables[i].ip1 ==getDigit(ipaddr.value,1))
			{
				alert("<#tcpiplan_dhcp_013#>");
				ipaddr.focus();
				return false;
			}	
			if(DhcpIpTables[i].mac==macaddr.value )
			{
				alert("<#tcpiplan_dhcp_014#>");
				macaddr.focus();
				return false;
			}	
		}
	}

	return true;
}

var radionum;

function getradionum() {
	
	if (document.dhcpip.select.length) {
		for(var j = 0; j < document.dhcpip.select.length; j++)   
	  	{ 
	    	if(document.dhcpip.select[j].checked) {
				//alert(j);
				radionum = j;
				//break;
			}
		}
	} else {
		radionum = 0;
	}
	
}
function updateCheckPoolIP(ipaddr,macaddr)
{
	getradionum();
	var tmp = "<% getLanIp(); %>".split('.');
	var lanip1=tmp[0];//192
	var lanip2=tmp[1];//168
	var lanip3=tmp[2];
	var lanip4=tmp[3];
	var startip="<% getCfgGeneral(1, "dhcpStart"); %>".split('.')[3];
	var endip="<% getCfgGeneral(1, "dhcpEnd"); %>".split('.')[3];
var max_num=32;

	var poolstartip= getDigit(document.dhcpip.lan_dhcpRangeStart.value,1)*256*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeStart.value,2)*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeStart.value,3)*256
					+getDigit(document.dhcpip.lan_dhcpRangeStart.value,4);

	var poolendip=   getDigit(document.dhcpip.lan_dhcpRangeEnd.value,1)*256*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeEnd.value,2)*256*256
					+getDigit(document.dhcpip.lan_dhcpRangeEnd.value,3)*256
					+getDigit(document.dhcpip.lan_dhcpRangeEnd.value,4);
	var setipaddr =  getDigit(ipaddr.value,1)*256*256*256
					+getDigit(ipaddr.value,2)*256*256
					+getDigit(ipaddr.value,3)*256
					+getDigit(ipaddr.value,4);
	macaddr.value = macaddr.value.toUpperCase();
	
	if(DhcpIpTables.length > max_num)
	{
		alert("<#tcpiplan_dhcp_011#>");
		ipaddr.focus();
		return false;
	}
	
	if(setipaddr < poolstartip || setipaddr > poolendip)
	{
		alert("<#tcpiplan_dhcp_012#>");
		ipaddr.focus();
		return false;
	}

	if(sel)
	{	
		//alert("radionum is" + radionum);
		
		for(var i=0; i<DhcpIpTables.length; i++)
		{	
			//alert("i = " + i);
			if(DhcpIpTables[i].ip4 ==getDigit(ipaddr.value,4)
			&& DhcpIpTables[i].ip3 ==getDigit(ipaddr.value,3)
			&& DhcpIpTables[i].ip2 ==getDigit(ipaddr.value,2)
			&& DhcpIpTables[i].ip1 ==getDigit(ipaddr.value,1))
			{	
				//alert(i);
				if (i == radionum) {               //如果是当前选中的，IP地址和MAC地址都没有改变，弹出警告
					if (DhcpIpTables[i].mac==macaddr.value ) {
						ipaddr.focus();
						alert("<#tcpiplan_dhcp_046#>");
						return false;
					} else {                      //当前选中的IP地址没有改变，MAC地址改变了，需判断是否和别的MAC地址重复
							for (var j = 0; j < DhcpIpTables.length; j++) {
								if (DhcpIpTables[j].mac==macaddr.value) {
									if (j == radionum) continue;
									alert("<#tcpiplan_dhcp_014#>");
									macaddr.focus();
									return false;
								}
							}
					}
					/*else {
					if (i == radionum) return true;
					alert("<#tcpiplan_dhcp_013#>");
					ipaddr.focus();
					return false;
				}*/
				} else {              //当前选中的IP地址，被改变，并且和已经存在的重复了，直接弹出IP地址被占用
						alert("<#tcpiplan_dhcp_013#>");
						ipaddr.focus();
						return false;
				}
			} /*else {                //没有找到重复的IP地址，也就是说IP地址的填写是正确的
				for(k = 0; k < DhcpIpTables.length; k++) {
						if(DhcpIpTables[k].mac==macaddr.value) {
							if (k == radionum) {alert(k);return true;}     //自身的MAC地址没有被改变
							alert("<#tcpiplan_dhcp_014#>");
							macaddr.focus();
							return false;
						}
				}*/
		}
		for(k = 0; k < DhcpIpTables.length; k++) {
			if(DhcpIpTables[k].mac==macaddr.value) {
				if (k == radionum) {             ////自身的MAC地址没有被改变
					return true;
				} else {   
					alert("<#tcpiplan_dhcp_014#>");
					macaddr.focus();
					return false;
				}
			}
		}
			/*if(DhcpIpTables[i].mac==macaddr.value )
			{
				alert("<#tcpiplan_dhcp_014#>");
				macaddr.focus();
				return false;	
			}*/
	}  
	return true;
}
var flagDhcpIp = 1;
function saveDhcpIpChanges()
{
	if (flagDhcpIp == 1) {
		//flagDhcpIp = 0;
		sel=0;
		 if (!checkIP(document.dhcpip.ipaddr))
		 {
				document.dhcpip.ipaddr.focus();
		return false;
	  }

		if(!checkMacWithoutColon(document.dhcpip.macaddr,1))
			 {
				alert("<#tcpiplan_dhcp_015#>");
				document.dhcpip.macaddr.focus();
		   return false;
		 }
		 

		  if(!checkPoolIP(document.dhcpip.ipaddr,document.dhcpip.macaddr))
		  {
			document.dhcpip.ipaddr.focus();
			return false;
		  }
		  var nvMacaddr = "";
		  var mac = document.dhcpip.macaddr.value;
	   for (var i = 0; i < mac.length; i++) 
	   {
			nvMacaddr +=( mac.charAt(i) );
			if( ( i%2 == 1 ) && i < (mac.length -1) )nvMacaddr += ':';
	   }
	  document.dhcpip.nvmacaddr.value = nvMacaddr;
	  document.dhcpip.lan_assignment.value = "add";// del update
	  return true;
	} else {
		return false;
	}
}

function delClick()
{
  document.dhcpip.lan_assignment.value = "del";// del update
  return true;
	
}

function updateClick()
{
	create_backmask();
	document.getElementById("loading").style.display="";
	sel=0;

	if(document.dhcpip.select.length)
	{
	  	for(i=0;i<document.dhcpip.select.length;i++)   
	  	{ 
	    	if(document.dhcpip.select[i].checked)   
	    	sel = 1;
	  	}
	}else
	{
		if(document.dhcpip.select.checked)
	   		sel = 1;
	}

	if (!sel) {
		alert("<#tcpiplan_dhcp_016#>");
		return false;
	}

	if (!checkIP(document.dhcpip.ipaddr))
	{
		return false;
	}

	if(!checkMacWithoutColon(document.dhcpip.macaddr,1))
	{
		alert("<#tcpiplan_dhcp_015#>");
		return false;
	}


	if(!updateCheckPoolIP(document.dhcpip.ipaddr,document.dhcpip.macaddr))
	{
		return false;
	}
	var nvMacaddr = "";
	var mac = document.dhcpip.macaddr.value;
	for (var i = 0; i < mac.length; i++) 
	{
		nvMacaddr +=( mac.charAt(i) );
		if( ( i%2 == 1 ) && i < (mac.length -1) )nvMacaddr += ':';
	}
	document.dhcpip.nvmacaddr.value = nvMacaddr;

	document.dhcpip.lan_assignment.value = "update";// del update
	
	return true;
}
function postDhcpIp( ipaddr, macaddr)
{
	document.dhcpip.ipaddr.value = ipaddr;
	document.dhcpip.macaddr.value = macaddr.replace(/:/g,"");
	document.dhcpip.nvmacaddr.value = macaddr;
}

</SCRIPT>
</head>

<body>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_125#>";
	SideItem="<#menu.ap_019#>";
	HelpItem="lancfg";
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
		<td class="topheader"><#tcpiplan_dhcp_017#></td>
	</tr>
	<tr>
		<td class="content">
			<p><#tcpiplan_dhcp_018#></p>
			<p><#tcpiplan_dhcp_019#></p>
  			<p><#tcpiplan_dhcp_020#></p>
		</td>
	</tr>
</table>
<br>

<form action="/goform/form2lansetup.cgi" method="POST" name="tcpip">
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#tcpiplan_dhcp_021#></td>
	</tr>

	<tr>
		<td class=content align=left>
			<table class=formarea border="0" cellpadding="0" cellspacing="0" width="450">

				<tr>
					<td class=form_label_left><#tcpiplan_dhcp_022#></td>
					<td class=form_label_right><input type="text" name="ip" size="15" maxlength="15" value="<% getLanIp(); %>"></td>
				</tr>

				<tr>
					<td class=form_label_left><#tcpiplan_dhcp_023#></td>
					<td class=form_label_right><input type="text"  name="mask" size="15" maxlength="15" value="<% getCfgGeneral(1, "lan_netmask"); %>"></td>
				</tr> 
			</table>
		</td>
	</tr>
</table>
<br>
<script>
</script>
<p align=center>

<input type="submit" value="<#tcpiplan_dhcp_035#>" onClick="return saveChanges()">


      <input type="hidden" value="Send" name="submit.htm?lan.htm">
</p>
 <input type="hidden" name="tokenid" id="tokenid0" value="" >
</form>

<form action="/goform/form2Dhcpd.cgi" method=POST name="dhcpd">
<input type="hidden" name="lan_ip" value="<% getLanIp(); %>">
<input type="hidden" name="lan_mask" value="<% getCfgGeneral(1, "lan_netmask"); %>">
<table id="body_header" border=0 cellSpacing=0>
	<tr>
		<td class="topheader"><#tcpiplan_dhcp_024#></td>
	</tr>
    <tr>
    	<td class="content" align="left">
        	<table class=formarea border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left"><#tcpiplan_dhcp_025#></td>
					<td class="form_label_right">
                    	<select size="1" name="dhcpserver" onChange="dhcpmodechang()">
<OPTION VALUE="0" SELECTED> None</OPTION>
<OPTION VALUE="1" > DHCP Server</OPTION>
						</select>
					</td>
				</tr>
            </table>
 
            <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500" id="dhcpserver_block"  style="display:block">
                <tr>
                	<td class="form_label_left"><#tcpiplan_dhcp_026#></td>
                    <td class="form_label_right"><input type="text" name="dhcpRangeStart" size="15" maxlength=15 value="<% getCfgGeneral(1, "dhcpStart"); %>">
													<font face="Arial" size="5">- </font>
												<input type="text" name="dhcpRangeEnd" size="15" maxlength=15 value="<% getCfgGeneral(1, "dhcpEnd"); %>">&nbsp;
                   </td>
                </tr>

				<tr>
					<td class="form_label_left"><#tcpiplan_dhcp_027#></td>
					<td class="form_label_right">
						
<script type='text/javascript'>
var dhcpLease = Number('<% getCfgGeneral(1, "dhcpLease"); %>')/60;
dw('<input type="text" name="ltime" size=10 maxlength=9 value="' + dhcpLease + '">');
</script>
<b> <#tcpiplan_dhcp_028#></b>
					</td>
				</tr>

				<tr>
					<td class="form_label_left"><#tcpiplan_dhcp_029#></td>
					<td class="form_label_right">
						<input type="text" name="dname" size=22 maxlength=19 value="<% getCfgGeneral(1, "HostName"); %>">
					</td>
				</tr>

				<tr>
					<td class="form_label_left"><#tcpiplan_dhcp_030#></td>
					<td class="form_label_right"><% getCfgGeneral(1, "dhcpPriDns"); %>
					</td>
				</tr>  

				<tr style="display:none">
					<td class="form_label_left"><#tcpiplan_dhcp_031#></td>
					<td class="form_label_right">
						<input type="text" name="dns2" size=22 maxlength=19 value="<% getCfgGeneral(1, "dhcpSecDns"); %>">
&nbsp;<#tcpiplan_dhcp_032#>
					</td>
				</tr>

				<tr style="display:none">
					<td class="form_label_left"><#tcpiplan_dhcp_033#></td>
					<td class="form_label_right">
						<input type="text" name="dns3" size=22 maxlength=19 value="">
					</td>
				</tr>
				
            </table>
            
            <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="600" id="dhcprelay_block" style="display:block">
				<tr>
					<td class="form_label_left"><#tcpiplan_dhcp_034#></td>
					<td class="form_label_right">
						<input type="text" name="relayaddr" size=15 maxlength=15 value="192.168.2.242">
					</td>
				</tr>
           
            </table>
        </td>
    </tr>
</table>
<br>
<p align=center>
<INPUT TYPE="hidden" NAME="submit.htm?lan.htm" VALUE="Send">
 <input type="hidden" name="tokenid" id="tokenid1" value="" >
<input type="submit" value="<#tcpiplan_dhcp_035#>" name="save" onClick="return saveDhcpServerChanges()">&nbsp;&nbsp;
<input type="reset" value="<#tcpiplan_dhcp_036#>" name="reset" onClick="resetDhcpServerClick()">
</p>
        
<SCRIPT>
	document.dhcpd.dhcpserver.value = '<% getCfgGeneral(1, "dhcpEnabled"); %>';
	initDhcpDisable = document.dhcpd.dhcpserver.value;
	resetDhcpServerClick();
</SCRIPT>
</form>

<form action="/goform/form2Dhcpip.cgi" method="POST" name="dhcpip">
<input type="hidden" name="lan_dhcpRangeStart" value="<% getCfgGeneral(1, "dhcpStart"); %>">
<input type="hidden" name="lan_dhcpRangeEnd" value="<% getCfgGeneral(1, "dhcpEnd"); %>">
<input type="hidden" name="lan_assignment" value="">
<input type="hidden" name="nvmacaddr" value="">
<table id="body_header" border=0 cellSpacing=0>
	<tr>
		<td class="topheader"><#tcpiplan_dhcp_037#></td>
	</tr>
    <tr>
    	<td class="content" align="left">
        	<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
            	<tr>
                	<td class="form_label_left"><#tcpiplan_dhcp_038#></td>
                    <td class="form_label_right"><input type="text" name="ipaddr" size="15" maxlength="15" value="0.0.0.0"></td>
                </tr>
				<tr>
					<td class="form_label_left"><#tcpiplan_dhcp_039#></td>
					<td class="form_label_right"><input type="text" name="macaddr" size="17" maxlength="17" value="000000000000"><#tcpiplan_dhcp_040#></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<p align=center>

<input type="submit" value="<#tcpiplan_dhcp_041#>" onClick="return saveDhcpIpChanges()">&nbsp;&nbsp;
<input type="submit" value="<#tcpiplan_dhcp_042#>" name="update" onClick="return updateClick()">&nbsp;&nbsp;
<input type="submit" value="<#tcpiplan_dhcp_043#>" name="delete" onClick="return delClick()">&nbsp;&nbsp;
<input type="reset" value="<#tcpiplan_dhcp_036#>" name="reset" onClick="resetDhcpIpClick()">
</p>
<br>
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#tcpiplan_dhcp_044#></td>
	</tr>
	<tr>
    	<td class="content" align="left">
        	<table class="formlisting" border="0" cellpadding="0" cellspacing="0" width="500">
            	<tr class="form_label_row">
                	<td class="form_label_col"><#tcpiplan_dhcp_045#></td>
                    <td class="form_label_col"><#tcpiplan_dhcp_038#></td>
                    <td class="form_label_col"><#tcpiplan_dhcp_039#></td>
                </tr>

<script language="JavaScript" type="text/javascript">
var str1=new Array;
var str2=new Array;
var i;
var index;
var tmp=new Array;
var ruleStr="<% getCfgGeneral(1, "DhcpStaticRulesStr"); %>";
if (ruleStr != "")
{
	str1=ruleStr.split("|");
	for (i=0; i<str1.length-1; i++)
	{
		index = i + 1;
		str2=str1[i].split(" ");

		document.write("<TR>");
		document.write('<TD align=center bgcolor="#C0C0C0"><b>' + '<input type="radio" name="select" value="' + i + '" onClick="postDhcpIp( \'' + str2[1] + '\', \'' + str2[0] + '\')"></b></TD>');
		document.write('<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>' + str2[1] + '</b></font></b></TD>');
		document.write('<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>' + str2[0] + '</b></font></b></TD>');
		document.write("</TR>");
		tmp = str2[1].split('.');
		DhcpIpTables[i]=new dhcpIptable(tmp[0],tmp[1],tmp[2],tmp[3],str2[0]);
/*			
		document.write("<td align=\"center\">"+index+"</td>");
		document.write("<td align=\"center\">"+str2[1]+"</td>");
		document.write("<td align=\"center\">"+str2[0]+"</td>");
		document.write("<td align=\"center\"><input type=checkbox tid=\"STATIC_LAN_CHK_IP_\""+ i 
								+"\" name='del_en_"+i+"'id='del_en_"+i+"' onClick=\"changedelte()\"></td>");
<TR>
<TD align=center bgcolor="#C0C0C0"><b><input type="radio" name="select" value="1" onClick="postDhcpIp( '192.168.2.85', '00:E0:86:71:05:99')"></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>192.168.2.85</b></font></b></TD>
<TD align=center bgcolor="#C0C0C0"><b><font size="2"><b>00:E0:86:71:05:99</b></font></b></TD>
</TR>
*/
	}
	checks =str1.length-1;
}
</script>

			</table>
		</td>
	</tr>
</table>
<input type="hidden" NAME="submit.htm?lan.htm" value="Send">
<input type="hidden" name="tokenid" id="tokenid2" value="" >
<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_lan] tokenid ="+tokenid);
	
	for(var i=0;i<3;i++)
	    document.getElementById("tokenid"+i).setAttribute("value",tokenid);
</script> 
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

