<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#virtualSrv_000#></title>
<SCRIPT>
//var curTblNum=0;
//curTblNum=3;
var lanip= "<% getCfgZero(1, "lan_ipaddr"); %>";
var lanmask= "<% getCfgZero(1, "lan_netmask"); %>";
var retPort=/^([0-9]|[:]){1,15}$/;
var retNum=/^[0-9]{1,15}$/;

function portInfo(startPort, endPort, srvName)
{
	this.startPort = startPort;
	this.endPort = endPort;
	this.srvName = srvName;
}
function serverType(name,protocol,port)
{
	this.name=name;
	this.protocol=protocol;
	this.port=port;
}
var servertypes = new Array();
servertypes[0]=new serverType("AUTH",6,113);
servertypes[1]=new serverType("DNS",17,53);
servertypes[2]=new serverType("FTP",6,21);
servertypes[3]=new serverType("IPSEC",17,500);
servertypes[4]=new serverType("POP3",6,110);
servertypes[5]=new serverType("PPTP",6,1723);
servertypes[6]=new serverType("SMTP",6,25);
servertypes[7]=new serverType("SSH",6,22);
servertypes[8]=new serverType("TELNET",6,23);
servertypes[9]=new serverType("TFTP",17,69);
servertypes[10]=new serverType("WEB",6,80);

function cbClick() {
	with ( document.addVrtSrv ) {
		var idx = srvname.selectedIndex;	
		for( var i=0;i<servertypes.length;i++)
		{
		  if(srvname.options[idx].value == servertypes[i].name)
			{
				inprt.value = servertypes[i].port;
				srvprt.value = servertypes[i].port;
				if(servertypes[i].protocol==6) protocol.selectedIndex = 0;
				if(servertypes[i].protocol==17)protocol.selectedIndex = 1;
				break;
			}
		}		
	}
}

function checkOpenPort(startport, endport)
{
	var openedPort = new Array();
	var rmtaccPort = new Array();
rmtaccPort[0]=new portInfo(520,520,"rip");
rmtaccPort[1]=new portInfo(80,80,"web");
rmtaccPort[2]=new portInfo(80,80,"web");
	
	for( var i=0; i<openedPort.length; i++ )
	{
		if( ((startport>=openedPort[i].startPort) && (startport<=openedPort[i].endPort)) ||
			((endport>=openedPort[i].startPort) && (endport<=openedPort[i].endPort)) ||
			((startport<=openedPort[i].startPort) && (endport>=openedPort[i].endPort)) )
		{
			alert("<#virtualSrv_001#>  "+openedPort[i].srvName+"("+openedPort[i].startPort+"-"+
				openedPort[i].endPort+"<#virtualSrv_002#>");
			return false;
		}
	}
	for ( var i=0; i<rmtaccPort.length; i++)
	{
		if ((startport<=rmtaccPort[i].startPort) && (endport>=rmtaccPort[i].endPort))
		{
			alert("<#virtualSrv_003#>");
			return false;
		}
	}
	
	return true;
}

function checkPortRules(){
	var portRules = "<% getCfgGeneral(1,"PortForwardRules"); %>";
	var ruleN = new Array();                                   //将所有规则分开
	ruleN = portRules.split(';');   
	var wanport = new Array();                                 //每一条规则
	var startwanport;
	var endwanport;
	with ( document.addVrtSrv ) {
		var waninprt = inprt.value;
		var invalue = waninprt.split(":");                     //将输入的端口分开
		//alert(invalue);                                        //打印输入的wan端口
		if (waninprt.match("[:]") == null) {                   //输入的wan端口号为单个
			
			var intwaninprt = parseInt(waninprt);              //将得到的wan端口解析为10进制
			
			if (ruleN.length == 0) return ture;
			
			for (var i = 0; i < ruleN.length; i++) {
				wanport[i] = ruleN[i].split(",");              //提取出每条规则
				
				startwanport = parseInt(wanport[i][5]);        //提取出已经输入的规则的wan端口号，10进制
				endwanport = parseInt(wanport[i][6]);
				
				if ((startwanport <= intwaninprt) && (intwaninprt <= endwanport)) {
					alert("<#virtualSrv_043#>");
					return false;
				} 
			}
		} else {                          //输入的端口号是范围
			for (var i = 0; i < ruleN.length; i++) {
				wanport[i] = ruleN[i].split(",");    //提取出每条规则
				
				var wanport0 = parseInt(invalue[0]);
				var wanport1 = parseInt(invalue[1]);
				
				startwanport = parseInt(wanport[i][5]);        //提取出已经输入的规则的wan端口号，10进制
				endwanport = parseInt(wanport[i][6]);
				
				
				if ( ((startwanport <= wanport0 && wanport0 <= endwanport) && (startwanport <=wanport1 && wanport1 <= endwanport) ) ||
					 ((startwanport >= wanport0) && (startwanport <=wanport1 && wanport1 <= endwanport) ) ||
					 ((startwanport <= wanport0 && wanport0 <= endwanport) && (wanport1 >= endwanport) )  ||
					 ((startwanport >= wanport0 ) && (wanport1 >= endwanport) )
				) {
				
					alert("<#virtualSrv_043#>");
					return false;
				} 
			}
		}
	}
	return true;
}

//判读外部端口是否存在范围重叠的情况。
function isSameWanPort(ext_port_s,ext_port_e)
{
    var ruleStrT = '<% getCfgZero(1, "acl_rules"); %>';
	//alert("ruleStrT="+ruleStrT+" ext_port_s="+ext_port_s+"ext_port_e="+ext_port_e);
	if(ruleStrT.length != 0)
	{
	    //alert("ruleStrT.length != 0");
		var i;
		var ruleTypeNum = 1;
		var rule = new Array;
		var rule1 = new Array;

		if(ruleStrT.indexOf(";") > 0)
			ruleTypeNum = ruleStrT.match(/;/g).length+1; // 规则种类数
        // alert("ruleTypeNum="+ruleTypeNum);
		rule = ruleStrT.split(";");
		for(i = 0; i < ruleTypeNum; i++)
		{	
			rule1 = rule[i].split(",");
			//alert("ruel1[1]="+rule1[1]+"rule1[2]="+rule1[2]);
			if(rule1[1] != "web")
			{
				continue;
			}	
			if(ext_port_s>parseInt(rule1[2]))
			{
				continue;
			}	
			if(ext_port_e<parseInt(rule1[2]))
			{
				continue;
			}	
			return false;
		}
		return true;
	}
}

//判读外部端口是否存在范围重叠的情况。
// Asherons Call|1|9000,9005,2,9000,9013,2|;Aim Talk|1|1111,2222,1,3333,4444,1|
function isSameNatTriggerPort(ex_port_s,ex_port_e)
{
    var str = '<% getCfgZero(1, "PortTriggerRules"); %>';
	if(str.length != 0)
	{
		var i;
		var num = 1;
		var rule = new Array;
		var rule_detail = new Array;
		var match_port_s,match_port_e,relate_port_s,relate_port_e;

		if(str.indexOf(";") > 0){
			num = str.match(/;/g).length+1;
		}
		rule = str.split(";");
		for(i = 0; i < num; i++)
		{	
			rule_detail = rule[i].split("|");
			for(var h=2;h<=rule_detail.length-2;h++){
				match_port_s = rule_detail[h].split(",")[0];
				match_port_e = rule_detail[h].split(",")[1];
				relate_port_s = rule_detail[h].split(",")[3];
				relate_port_e = rule_detail[h].split(",")[4];
				for(var j=ex_port_s;j<=ex_port_e;j++){
					for(var k=match_port_s;k<=match_port_e;k++){
						if(j==k){
							return false;
						}
					}
					for(var k=relate_port_s;k<=relate_port_e;k++){
						if(j==k){
							return false;
						}
					}
				}
			}	
		}
		return true;
	}
}


function btnApply() {
	with ( document.addVrtSrv ) {		
	     if(radiosrv[1].checked){
	     	if(!checkSpecialChar(txtsrvname.value,1))
	     	   {
	     	   	alert("<#virtualSrv_004#>");
	     	   	return false;
	     	   }
		
	     }
		fromwanitf.value="any";
		
		if ( inprt.value == '' || !retPort.test(inprt.value) ) {
			msg = '<#virtualSrv_005#>' + inprt.value + '<#virtualSrv_006#>';	
			alert(msg);
			return false;
		}
	
		if ( srvprt.value == '' || !retPort.test(srvprt.value) ) {
    		msg = '<#virtualSrv_007#>' + srvprt.value + '<#virtualSrv_006#>';
    		alert(msg);
    		return false;
   		}
		
		var inrangevalue = inprt.value;
		var invalue = inrangevalue.split(':');
		var startPort;
		var endPort;
		var wanOpenPortRange=0;
		var wanOpenPortRangeInterval=0;
		if(inrangevalue.match("[:]") == null)
		{
			startPort=parseInt(invalue[0]);
			endPort=parseInt(invalue[0]);
		}
		else
		{
			startPort=parseInt(invalue[0]);
			endPort=parseInt(invalue[1]);
			wanOpenPortRange=1;
			wanOpenPortRangeInterval=endPort-startPort;
		}
		if (startPort > endPort || startPort<1 || endPort>65535)
		{
			msg = '<#virtualSrv_008#>';
			alert(msg);
			return false;
		}
		
		if(protocol.selectedIndex == 0)
		{
			// 1, check ACL Wan port
			if(!isSameWanPort(startPort, endPort))
			{
			  alert('<#virtualSrv_044#>');
			  return false;
			}
			// 2, check VirtualServer Port- no need
			// 3, check NAT trigger Port
			if(!isSameNatTriggerPort(startPort, endPort))
			{
			  alert('<#virtualSrv_045#>');
			  return false;
			} 
		}
		//if ( !checkOpenPort(startPort, endPort) ) {
		//	inprt.focus();
		//	return false;
		//}
		//add by ramen to support lan port range
		inrangevalue=srvprt.value;
		invalue = inrangevalue.split(':');
		if(inrangevalue.match("[:]") == null)
		{
			startPort=parseInt(invalue[0]);
			endPort=parseInt(invalue[0]);
		}
		else
		{
		    if(!wanOpenPortRange)
			     {
							msg = '<#virtualSrv_009#>';
							alert(msg);
							return false;
				 }
			startPort=parseInt(invalue[0]);
			endPort=parseInt(invalue[1]);

		}

		if (startPort > endPort || startPort<1 || endPort>65535)
		{
			msg = '<#virtualSrv_010#>';
			alert(msg);
			return false;
		}
		if((endPort-startPort)&&(wanOpenPortRangeInterval!=(endPort-startPort))){
		   msg="<#virtualSrv_011#>";
		   alert(msg);
		   return false;
		}

		if (!checkIP(srvaddr))
			return false;
		if(srvaddr.value == lanip)
		{
		alert("<#virtualSrv_012#>");
		srvaddr.focus();
		return false;
		}

		if (!Lan1EqLan2(srvaddr.value, lanmask, lanip, lanmask)) {
			alert('<#virtualSrv_013#>');
			srvaddr.focus();
			return false;
		}
	}
	
	if (!checkPortRules()) return false;
	
	var curTblNum=document.getElementById('curTblNum');

	if(curTblNum.value >= 12)
	{
		alert('<#virtualSrv_014#>');
		return false;
	}
	create_backmask();
	document.getElementById("loading").style.display="";
}
</script>

</head>


<body>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_127#>";
	SideItem="<#menu.ap_050#>";
	HelpItem="Virtual";
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
		<td class=topheader><#virtualSrv_015#></td>
	</tr>
	<tr>
		<td class=content>
			<p><#virtualSrv_016#>
            </p>
		</td>
	</tr>
</table>
<br>
<form action="/goform/form2AddVrtsrv.cgi" method=POST name="addVrtSrv">
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#virtualSrv_017#></td>
	</tr>
	<tr>
		<td class=content>
  			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
    			<tr>
                    <td class="form_label_left">
                    <input type="radio" name="radiosrv" value="0" checked><#virtualSrv_018#>
                    </td>
                    <td class='form_label_right'>
                    <select name='srvname' size="1" style="width:200" onChange='cbClick()'>
		            <option value="AUTH" selected>AUTH</option>
		            <option value="DNS">DNS</option>
		            <option value="FTP">FTP</option>
		            <option value="IPSEC">IPSEC</option>
		            <option value="POP3">POP3</option>
		            <option value="PPTP">PPTP</option>
		            <option value="SMTP">SMTP</option>
		            <option value="SSH">SSH</option>
		            <option value="TELNET">TELNET</option>
		            <option value="TFTP">TFTP</option>
		            <option value="WEB">WEB</option>
		            </select>
                    </td>
                </tr>
                <tr>
                    <td class='form_label_left'>
                    <input type="radio" name="radiosrv" value="1"><#virtualSrv_019#>
                    </td>
                    <td class='form_label_right'>
                    <input type='text' size="15" name="txtsrvname" maxlength="15">
                    </td>
                </tr>
                <tr>
                    <td class='form_label_left'>
                    <#virtualSrv_020#>
                    </td>
                    <td class='form_label_right'>
                    <select name='protocol' size="1" style="width:200">
                    <option value="1">TCP</option>
                    <option value="2">UDP</option>
                    </select>
                    </td>
                </tr>
          
                <tr style="
display: none;			">
                    <td class='form_label_left'>
                    <#virtualSrv_021#>
                    </td>
                    <td class='form_label_right'>
                    <select name='wansetting' size="1" style="width:200" ONCHANGE="wansettingchange();">
                    <option value="0"><#virtualSrv_022#></option>
                    <option value="1"><#virtualSrv_023#></option>
                    </select>
                    </td>
                </tr>
                <tr id="fromwanipid" style="
display: none;			">
                    <td class='form_label_left'>
                    <#virtualSrv_024#>
                    </td>
                    <td class='form_label_right'>
                    <input type='text' size="15" name="fromwanip" maxlength="15">
                    </td>
                </tr>
                 
                <tr id="wanitfselectid" style="
display: none;			">
                    <td class='form_label_left'>
                    <#virtualSrv_025#>
                    </td>
                    <td class='form_label_right'>
                    <select name='fromwanitf' size="1" style="width:200">
<OPTION VALUE="e2" SELECTED> e2</OPTION>
                    <option value="any"><#virtualSrv_026#></option>
                    </select>
                    </td>
                </tr>
              
                <tr>
                    <td class='form_label_left'>
                   <#virtualSrv_027#>
                    </td>
                    <td class='form_label_right'>
                    <input type='text' size="15" name="inprt"><#virtualSrv_028#>
                    </td>
                </tr>
                <tr>
                    <td class='form_label_left'>
                    <#virtualSrv_029#>
                    </td>
                    <td class='form_label_right'>
                    <input type='text' size="15" name="srvprt">
                    </td>
                </tr>
                <tr>
                    <td class='form_label_left'>
                    <#virtualSrv_030#>
                    </td>
                    <td class='form_label_right'>
                    <input type='text' size="15" name="srvaddr" maxlength="15">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
<p align=center>
<INPUT TYPE="hidden" NAME="wanIpOrItf" VALUE="itf">
<input type="submit" value="<#virtualSrv_031#>" name="save" onClick="return btnApply();">
 <input type="hidden" name="tokenid" id="tokenid0" value="" >
</p>
</form>
<form method=POST Action="/goform/form2naptitfdel.cgi">
<INPUT TYPE="HIDDEN" NAME="actiontype" VALUE="" >
<INPUT TYPE="HIDDEN" NAME="natitfcmd" VALUE="" >
<INPUT TYPE="HIDDEN" NAME="state" VALUE="" >
<INPUT TYPE="HIDDEN" NAME="itf1" VALUE="" >
<INPUT TYPE="HIDDEN" NAME="itf2" VALUE="" >
<INPUT TYPE="HIDDEN" NAME="wanport" VALUE="" >
<INPUT TYPE="HIDDEN" NAME="instnum" VALUE="" >
<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#virtualSrv_032#></td>
	</tr>
	<tr>
		<td class=content>
  			<table class=formlisting border=0>
    			<tr class=form_label_row >
                    <td class='form_label_col'>
                    <b><#virtualSrv_033#></b>
                    </td>
                    <td class='form_label_col'>
                    <b><#virtualSrv_020#></b>
                    </td>
                    <td class='form_label_col'>
                    <b><#virtualSrv_034#></b>
                    </td>
                    <td class='form_label_col'>
                    <b><#virtualSrv_035#></b>
                    </td>
                    <td class='form_label_col' style="display: none;">
                    <b><#virtualSrv_036#></b>
                    </td>
                    <td class='form_label_col'>
                    <b><#virtualSrv_037#></b>
                    </td>
                    <td class='form_label_col'>
                    <b>State</b>
                    </td>
                    <td class='form_label_col'>
                    <b>Action</b>
                    </td>
                </tr>
				<% showVrtsrvRulesASP(); %>
			</table>
        </td>
    </tr>
</table>
<input type="hidden" name="tokenid" id="tokenid1" value="" >
<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_virtualSrv] tokenid ="+tokenid);
	
	for(var i=0;i<2;i++)
	    document.getElementById("tokenid"+i).setAttribute("value",tokenid);
</script> 
</form>
<script language="JavaScript">
function natItfActionFunc( form , actiontype, instnum){
  form.elements[0].value=actiontype;
  form.elements[6].value=instnum;
  form.submit();
  create_backmask();
  document.getElementById("loading").style.display="";
}


/*
function natItfActionFunc( form , actiontype, natitfcmd, state, itf1, itf2,wanport,instnum){
  form.elements[0].value=actiontype;
  form.elements[1].value=natitfcmd;
  form.elements[2].value=state;
  form.elements[3].value=itf1;
  form.elements[4].value=itf2;
  form.elements[5].value=wanport;
  form.elements[6].value=instnum;
  form.submit();
}
*/
</script>
<script>
	     			 document.addVrtSrv.inprt.value = servertypes[0].port;
				document.addVrtSrv.srvprt.value = servertypes[0].port;
				if(servertypes[0].protocol==6) document.addVrtSrv.protocol.selectedIndex = 0;
				if(servertypes[0].protocol==17)document.addVrtSrv.protocol.selectedIndex = 1;
	
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


