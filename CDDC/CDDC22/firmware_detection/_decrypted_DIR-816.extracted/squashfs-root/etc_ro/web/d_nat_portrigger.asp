<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#nat_portrigger_000#></title>

<SCRIPT language=javascript>
TOTAL_ROW = 8;
remain = 31;
var appName = "";
NO_SEL_MSG = '<#nat_portrigger_001#>';
RE_ALL_MSG = '<#nat_portrigger_002#>';
var ruleStr="";
function initValue()
{
	var portTrigEn = "<% getCfgZero(1, "PortTriggerEnable"); %>";
	if(portTrigEn == "1") {
		document.form2Trigger.pt_status[0].checked = true;   // 启用
	} else {
	  document.form2Trigger.pt_status[1].checked = true;	 // 禁用
	}
}

function saveClick()
{
	if(document.form2Trigger.pt_status[0].checked == true) {
		document.form2Trigger.pt_status.value = 1;   	// 启用
	} else {
		document.form2Trigger.pt_status.value = 0;		// 禁用
	}
	document.form2Trigger.submit();
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}





function isValidPort(port) {
   var fromport = 0;
   var toport = 100;

   portrange = port.split(':');
   if ( portrange.length < 1 || portrange.length > 2 ) {
       return false;
   }
   if ( isNaN(portrange[0]) )
       return false;
   fromport = parseInt(portrange[0]);
   
   if ( portrange.length > 1 ) {
       if ( isNaN(portrange[1]) )
          return false;
       toport = parseInt(portrange[1]);
       if ( toport <= fromport )
           return false;      
   }
   
   if ( fromport < 1 || fromport > 65535 || toport < 1 || toport > 65535 )
       return false;
   
   return true;
}

function clearAll()
{
   with (document.form2PortriggerRule) {
      for (i = 0; i < TOTAL_ROW; i++) {
         matchPort_s[i].value = matchPort_e[i].value = relatePort_s[i].value = relatePort_e[i].value = "";
         protocol[i].value = oProto[i].value = 1;
				 //dir[i].value = 1;
      }
   }
}

function appSelect(v)
{
   clearAll();
   with (document.form2PortriggerRule) {
      switch(v) {
      case '0':
         AppName.selectedIndex = 0;
         AppName.options[0].value = "0";
         appName = "";
         break;                                  //trigger   open
      case "Aim Talk":   //  Aim Talk                   TCP 4099,  TCP 5191
         appName = "Aim Talk";
         matchPort_s[0].value = matchPort_e[0].value = 4099;
         relatePort_s[0].value = relatePort_e[0].value = 5191;
				 protocol[0].value = oProto[0].value = 1;
         break;
      case "Asheron's Call":  // Asheron's Call                UDP 9000-9013, UDP 9000-9013
         appName = "Asheron's Call";
         matchPort_s[0].value = relatePort_s[0].value = 9000;
         matchPort_e[0].value = relatePort_e[0].value = 9013;
         protocol[0].value = oProto[0].value = 2;
         break;
      case "Calista IP Phone":  //Calista IP Phone               TCP 5190, UDP 3000
         appName = "Calista IP Phone";
         matchPort_s[0].value = matchPort_e[0].value = 5190;
         relatePort_s[0].value = relatePort_e[0].value = 3000;
         protocol[0].value = 1;
				 oProto[0].value = 2;
         break;
      case "Delta Force (Client/Server)":  //Delta Force (Client/Server)    UDP 3568, BOTH 3100-3999
         appName = "Delta Force (Client/Server)";
         matchPort_s[0].value = matchPort_e[0].value = 3568;
         protocol[0].value = 2;
         relatePort_s[0].value = 3100;
         relatePort_e[0].value = 3999;
         oProto[0].value = 3;
         break;
      case "ICQ":  //ICQ                            UDP 4000, TCP 20000-20059
         appName = "ICQ";
         matchPort_s[0].value = matchPort_e[0].value = 4000;
         protocol[0].value = 2;
         relatePort_s[0].value = 20000;
         relatePort_e[0].value = 20059;
				 oProto[0].value = 1;
         break;
      case "Napster":  //Napster                        TCP 6699, TCP 6699, 6697, 4444, 5555, 6666, 7777, 8888
         appName = "Napster";
         matchPort_s[0].value = matchPort_e[0].value = matchPort_s[1].value = matchPort_e[1].value = matchPort_s[2].value = matchPort_e[2].value = 
         matchPort_s[3].value = matchPort_e[3].value = matchPort_s[4].value = matchPort_e[4].value = matchPort_s[5].value = matchPort_e[5].value = 
         matchPort_s[6].value = matchPort_e[6].value = 6699;
         relatePort_s[0].value = relatePort_e[0].value = 6699;
         relatePort_s[1].value = relatePort_e[1].value = 6697;
         relatePort_s[2].value = relatePort_e[2].value = 4444;
         relatePort_s[3].value = relatePort_e[3].value = 5555;
         relatePort_s[4].value = relatePort_e[4].value = 6666;
         relatePort_s[5].value = relatePort_e[5].value = 7777;
         relatePort_s[6].value = relatePort_e[6].value = 8888;
				 protocol[0].value = oProto[0].value = 1;
				 protocol[1].value = oProto[1].value = 1;
				 protocol[2].value = oProto[2].value = 1;
				 protocol[3].value = oProto[3].value = 1;
				 protocol[4].value = oProto[4].value = 1;
				 protocol[5].value = oProto[5].value = 1;
				 protocol[6].value = oProto[6].value = 1;
         break;
      case "Net2Phone":   // Net2Phone                      UDP 6801, UDP 6801
         appName = "Net2Phone";
         matchPort_s[0].value = matchPort_e[0].value = 6801;
         protocol[0].value = 1;
         relatePort_s[0].value = relatePort_e[0].value = 6801;
         oProto[0].value = 2;
         break;
      case "QuickTime 4 Client":  //  QuickTime 4 Client             TCP 554, UDP 6970-32000 // 2). TCP 554, BOTH 6970-7000
         appName = "QuickTime 4 Client";
         matchPort_s[0].value = matchPort_e[0].value = matchPort_s[1].value = matchPort_e[1].value = 554;
         relatePort_s[0].value = relatePort_s[1].value = 6970;
         relatePort_e[0].value = 32000;
         relatePort_e[1].value = 7000;
         protocol[0].value = protocol[1].value =1;
         oProto[0].value = 2;
		 oProto[1].value = 1;
         break;
      case "Rainbow Six/RogueSpear":   // Rainbow Six/Rogue Spear        TCP 2346, BOTH 2436-2438
         appName = "Rainbow Six/Rogue Spea";
         matchPort_s[0].value = matchPort_e[0].value = 2346;
         relatePort_s[0].value = 2436;
         relatePort_e[0].value = 2438;
				 protocol[0].value =1;
         oProto[0].value = 3;
         break;
      default:
         alert('<#nat_portrigger_003#>');
      }
   }  
}

function radioClick()
{
   with (document.form2PortriggerRule) {
      if (radiosrv[0].checked == true)
         txtAppName.value = '';
   }
   appSelect("0");
}



//判读外部端口是否存在范围重叠的情况。
function isSameExternalPort(ext_port_s,ext_port_e,ext_potol)
{
	
	if(ruleStr.length != 0)
	{
		var i,j;
		var ruleTypeNum = 1;
		var rule = new Array;
		var rule1 = new Array;
		var rule2 = new Array;

		if(ruleStr.indexOf(";") > 0)
			ruleTypeNum = ruleStr.match(/;/g).length+1; // 规则种类数

		rule = ruleStr.split(';');
		for(i = 0; i < ruleTypeNum; i++)
		{
			var ruleNum = rule[i].match(/\|/g).length - 2;
				
			rule1 = rule[i].split('|');
			for(j = 0; j < ruleNum; j++)
			{
			    rule2 = rule1[j+2].split(',');
				
				
				//协议不同，则认为规则不同。oPotol==3,表示为TCP/UDP。
		        if((parseInt(rule2[5])!=3)&&(ext_potol!=3)&&(ext_potol!=parseInt(rule2[5])))
		        {
		           continue;
		        }
				if(ext_port_s>parseInt(rule2[4]))
				{
				   continue;
				}
				
				if(ext_port_e<parseInt(rule2[3]))
				{
				   continue;
				}
				
				//alert("The range of new rule external port:"+ext_port_s+"-"+ext_port_e+"already exists");
				return false;
					
			}
		
		}
	}
		
    return true;

}

function isFrontSameExPort(fcont,ext_port_s,ext_port_e,ext_potol)
{
    with (document.form2PortriggerRule) {
    var i;
    for(i=0;i<fcont;i++)
	{
	    
        var oS = parseInt(relatePort_s[i].value);
        var oE = parseInt(relatePort_e[i].value);
		var oP=  parseInt(oProto[i].value);
		//协议不同，则认为规则不同。oP==3,表示为TCP/UDP。
		if((ext_potol!=3)&&(oP!=3)&&(ext_potol!=oP))
		{
		   continue;
		}
		 
		if(ext_port_s>oE)
		{
		  continue;
		}
				
		if(ext_port_e<oS)
		{
		   continue;
		}
		
		
		
		return false;
    }
	
   }
	return true;
}

function isSameWanPort(ext_port_s,ext_port_e){

	var ruleStrT = '<% getCfgZero(1, "acl_rules"); %>';
	if(ruleStrT.length != 0)
	{
		var i;
		var ruleTypeNum = 1;
		var rule = new Array;
		var rule1 = new Array;

		if(ruleStrT.indexOf(";") > 0)
			ruleTypeNum = ruleStrT.match(/;/g).length+1;
		rule = ruleStrT.split(";");
		for(i = 0; i < ruleTypeNum; i++)
		{	
			rule1 = rule[i].split(",");
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

function isSameVirtualSrvPort(ex_port_s,ex_port_e){  // 192.168.0.55,1130,1130,1,1,1131,1131,AUTH;192.168.0.66,110,110,1,1,110,110,POP3
	
	var PortForwardRule = "<% getCfgGeneral(1,"PortForwardRules"); %>";
	var rule = new Array();
	rule = PortForwardRule.split(';');   
	var wanport = new Array();
	var wanport_s;
	var wanport_e;
	var openport_s;
	var openport_e;
	if(rule.length == 0) 
		return true;
		
	for (var i = 0; i < rule.length; i++) {
		wanport[i] = rule[i].split(",");
		
		wanport_s = parseInt(wanport[i][1]);
		wanport_e = parseInt(wanport[i][2]);
		openport_s = parseInt(wanport[i][5]);
		openport_e = parseInt(wanport[i][6]);
		for(var j=ex_port_s;j<=ex_port_e;j++){
			for(var k=wanport_s;k<=wanport_e;k++){
				if(j==k){
					return false;
				}
			}
			for(var k=openport_s;k<=openport_e;k++){
				if(j==k){
					return false;
				}
			}
		}
	}	
	return true;
}

function btnApply()
{
   var loc = "";
   with ( document.form2PortriggerRule)
   {
      if (radiosrv[0].checked == true)
      {
				if (encodeURI(appName) == '') {
					alert(NO_SEL_MSG);
					return;
				}
				appName=appName.replace(/(^\s*)/g, ""); 
				appName=appName.replace(/(\s*$)/g, ""); 
				//appName=appName.split(/\s+/,1);
				//appName=appName.replace(/(\s)/g, "&nbsp;");
      }
      else
      {
				if (encodeURI(txtAppName.value) == '') {     
				  alert('<#nat_portrigger_004#>');
				  return;
				}
		    /*
				if(!checkSpecialCharForURL(txtAppName.value, 1))
				{
					alert("<#nat_portrigger_005#>");
					txtAppName.focus();
					return;		
				}
				*/
				txtAppName.value=txtAppName.value.replace(/(^\s*)/g, ""); 
				txtAppName.value=txtAppName.value.replace(/(\s*$)/g, ""); 
				//替换掉特殊字符;和|号
				txtAppName.value=txtAppName.value.replace(/;/g, " "); 
                txtAppName.value=txtAppName.value.replace(/\|/g, " "); 
				//txtAppName.value=txtAppName.value.split(/\s+/,1);
				//txtAppName.value=(txtAppName.value).replace(/(\s)/g, "&nbsp;");
      }

      for (i = 0; i < TOTAL_ROW; i++) {
         if (matchPort_s[i].value == "" && matchPort_e[i].value == "" && relatePort_s[i].value == "" && relatePort_e[i].value == "")
            break;
         if (matchPort_s[i].value == "" || matchPort_e[i].value == "" || relatePort_s[i].value == "" || relatePort_e[i].value == "") {
            alert(RE_ALL_MSG);
            return;
         }
      }
      if (i == 0) {
         alert(RE_ALL_MSG);
         return;
      }
      if (i > remain) {
         remain = i - remain;
         alert('xxxx' + remain);
         remain = 31;
         return;
      }
      
      var eCount = i;    
	  var j=0;
      for (i = 0; i < eCount; i++) {
         if ( isValidPort(matchPort_s[i].value) == false ) {
            alert('<#nat_portrigger_006#>' + matchPort_s[i].value + '<#nat_portrigger_007#>');
            return;
         }
         if ( isValidPort(matchPort_e[i].value) == false ) {
            alert('<#nat_portrigger_008#>' + matchPort_e[i].value + '<#nat_portrigger_007#>');
            return;
         }
		 // 1, check ACL Wan port
		 if(!isSameWanPort(matchPort_s[i].value, matchPort_e[i].value))
		 {
			alert('<#virtualSrv_044#>');
			return false;
		 }
		 // 2, check VirtualServer Port
		 if(!isSameVirtualSrvPort(matchPort_s[i].value, matchPort_e[i].value)){
		 	alert("<#virtualSrv_046#>");
			return false;
		 }
		 // 3, check NAT trigger Port- no need
 
         if ( isValidPort(relatePort_s[i].value) == false ) {
            alert('<#nat_portrigger_009#>' + relatePort_s[i].value + '<#nat_portrigger_007#>');
            return;
         }
         if ( isValidPort(relatePort_e[i].value) == false ) {
            alert('<#nat_portrigger_010#>' + relatePort_e[i].value + '<#nat_portrigger_007#>');
            return;
         }
		 // 1, check ACL Wan port
		 
		 if(!isSameWanPort(relatePort_s[i].value, relatePort_e[i].value))
		 {
			alert('<#virtualSrv_044#>');
			return false;
		 }
		 // 2, check VirtualServer Port
		 if(!isSameVirtualSrvPort(relatePort_s[i].value, relatePort_e[i].value)){
		 	alert("<#virtualSrv_046#>");
			return false;
		 }
		 // 3, check NAT trigger Port- no need
		 
         var tS = parseInt(matchPort_s[i].value);
         var tE = parseInt(matchPort_e[i].value);
         if (tS > tE) {
            alert('<#nat_portrigger_011#>' + tS + '-' + tE + '<#nat_portrigger_012#>');
            return;
         }
         var oS = parseInt(relatePort_s[i].value);
         var oE = parseInt(relatePort_e[i].value);
         if ( oS > oE ) {
            alert('<#nat_portrigger_013#>' + oS + '-' + oE + '<#nat_portrigger_012#>');
            return;
         }
		 var oP = parseInt(oProto[i].value);
		 //此处判断当前输入中的是否有重叠的外部端口
		if(i>0)
		{
		    if (isFrontSameExPort(i,oS,oE,oP) == false ) {
		      alert("The range of new rule external port:"+oS+"-"+oE+"exists or include before");
		      return ;
		     }
	    }
		
		 //此处是判断系统中是否已经存在
		if (isSameExternalPort(oS,oE,oP) == false ) {
		     alert("The range of new rule external port:"+oS+"-"+oE+"exists or include");
		     return ;
		 }
		 
		 
      }
      subnum.value = i;
   }
	 document.form2PortriggerRule.submit();
	 create_backmask();
	document.getElementById("loading").style.display="";
}
</script>
<link href="d_stylemain.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="initValue()">
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_127#>";
	SideItem="<#menu.ap_085#>";
	HelpItem="PortTriggering";
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
		<td class="topheader"><#nat_portrigger_014#></td>
	</tr>
	<tr>
		<td class="content">
			<p><#nat_portrigger_015#></p>
		</td>
	</tr>
</table>


<form action="/goform/form2NatPortriggerStatus.cgi" method=POST name="form2Trigger">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#nat_portrigger_016#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left"><b><#nat_portrigger_017#></b></td>
					<td class="form_label_right">
						<input type="radio" name="pt_status" value="1"><#nat_portrigger_018#>&nbsp;&nbsp;
						<input type="radio" name="pt_status" value="0"><#nat_portrigger_019#>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<p align=center>
<input type="submit" value="<#nat_portrigger_020#>" onClick="return saveClick()">&nbsp;&nbsp;
<input type="hidden" NAME="submit.asp?d_nat_portrigger.asp" value="Send">
<input type="hidden" name="tokenid" id="tokenid0" value="" >
</p>
</form>

<form action="/goform/form2PortriggerRule.cgi" method=POST name="form2PortriggerRule">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#nat_portrigger_021#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_radio" style="text-align:left"><input type="radio" name="radiosrv" value="0" onClick="radioClick();" checked><#nat_portrigger_022#></td>
					<td>
						<select onchange=appSelect(this.value) size=1 name=AppName> 
          		            <option value=0 selected><#nat_portrigger_023#></option>
							<option value="Aim Talk">Aim Talk</option>
							<option value="Asheron's Call">Asheron's Call</option>
							<option value="Calista IP Phone">Calista IP Phone</option>
							<option value="Delta Force (Client/Server)">Delta Force (Client/Server)</option>
							<option value="ICQ">ICQ</option>
							<option value="Napster">Napster</option>
							<option value="Net2Phone">Net2Phone</option>
							<option value="QuickTime 4 Client">QuickTime 4 Client</option> 
							<option value="Rainbow Six/RogueSpear">Rainbow Six/RogueSpear</option>
						</select>
					</td>
				</tr>

				<tr>
					<td class="form_label_radio" style="text-align:left; width:220px"><input type="radio" name="radiosrv" value="1"><#nat_portrigger_024#></td>
					<td><input type="text" size="30" name="txtAppName" maxlength="32"  onKeyUp="value=value.replace(/[\W]/g,'')" ></td>
				</tr>
			</table>
			<br>
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="610">
				<TR align=left>
					<TD class=hd><#nat_portrigger_025#></TD>
					<TD class=hd><#nat_portrigger_026#></TD>
					<TD class=hd><#nat_portrigger_027#></TD>
					<TD class=hd><#nat_portrigger_028#></TD>
					<TD class=hd><#nat_portrigger_029#></TD>
					<TD class=hd><#nat_portrigger_030#></TD>
					<!-- <TD class=hd><#nat_portrigger_031#></TD> -->
				</TR>
				<script language="JavaScript" type="text/javascript">
					var i;
					for(i = 0; i < 8; i++)
					{
						document.write("<TR>");
						document.write("<TD><INPUT size=7 name=matchPort_s></TD>");
						document.write("<TD><INPUT size=7 name=matchPort_e></TD>");
						document.write("<TD>");
						document.write("<SELECT name=protocol>");
						document.write("<OPTION value=2 selected>UDP</OPTION>");
						document.write("<OPTION value=1>TCP</OPTION>");
						document.write("<OPTION value=3>TCP/UDP</OPTION>");
						document.write("</SELECT>");
						document.write("</TD> ");
						document.write("<TD><INPUT size=7 name=relatePort_s></TD>");
						document.write("<TD><INPUT size=7 name=relatePort_e></TD>");
						document.write("<TD>");
						document.write("<SELECT name=oProto>");
						document.write("<OPTION value=2 selected>UDP</OPTION>");
						document.write("<OPTION value=1>TCP</OPTION>");
						document.write("<OPTION value=3>TCP/UDP</OPTION>");
						document.write("</SELECT>");
						document.write("</TD>");
						/*
						document.write("<TD>");
						document.write("<SELECT name=dir>");
						document.write("<OPTION value=1 selected><#nat_portrigger_032#></OPTION>");
						document.write("<OPTION value=0 ><#nat_portrigger_033#></OPTION>");
						document.write("</SELECT>");
						document.write("</TD>");
						*/
						document.write("</TR>");
					}
				</script>
			</table>
		</td>
	</tr>
</table>
<p align=center>
<input type="button" value="<#nat_portrigger_020#>" name="save" onClick="return btnApply();">&nbsp;&nbsp;
<input name="subnum" type="hidden" value="">
</p>
 <input type="hidden" name="tokenid" id="tokenid1" value="" >
</form>

<form name="currentList" method=POST action="/goform/form2PortriggerRuleDelete.cgi">
	<input type="hidden" name="ruleType" value="">
	<input type="hidden" name="rule" value="">
	<table id="body_header" border="0" cellspacing="0">
		<tr>
			<td class="topheader"><#nat_portrigger_034#></td>
		</tr>
		<tr>
			<td class="content" align="left">
				<table class="formlisting" border="0" cellpadding="0" cellspacing="0" width="500">
					<tr class="form_label_row">
						<td class="form_label_col"><#nat_portrigger_035#></td>
						<td class="form_label_col"><#nat_portrigger_036#></td>
						<!-- <td class="form_label_col"><#nat_portrigger_037#></td> -->
						<td class="form_label_col"><#nat_portrigger_038#></td>
						<td class="form_label_col"><#nat_portrigger_039#></td>
						<td class="form_label_col"><#nat_portrigger_040#></td>
						<td class="form_label_col"><#nat_portrigger_041#></td>
					</tr>
					<script language="JavaScript" type="text/javascript">
						var PROTOCL = new Array("","TCP","UDP","TCP/UDP");
						var DIRECTION = new Array("incoming","outgoing");//
						//var ruleStr="Dialpad|1|7175,7175,1,51200,51201,1|7175,7175,1,51210,51210,1|;Napster|1|6699,6699,1,6699,6699,1,1|6699,6699,1,6697,6697,1,1|6699,6699,1,4444,4444,1,1|6699,6699,1,5555,5555,1,1|6699,6699,1,6666,6666,1,1|6699,6699,1,7777,7777,1,1|6699,6699,1,8888,8888,1,1|";
					 ruleStr="<% getCfgGeneral(1, "PortTriggerRules"); %>";
			  		if(ruleStr.length != 0)
			  		{
				  		var i,j;
				  		var ruleTypeNum = 1;
				  		var rule = new Array;
				  		var rule1 = new Array;
							var rule2 = new Array;

				  		if(ruleStr.indexOf(";") > 0)
				  			ruleTypeNum = ruleStr.match(/;/g).length+1; // 规则种类数

				  		rule = ruleStr.split(';');
				  		for(i = 0; i < ruleTypeNum; i++)
				  		{
								var ruleNum = rule[i].match(/\|/g).length - 2;
								
								rule1 = rule[i].split('|');
								for(j = 0; j < ruleNum; j++)
								{
									rule2 = rule1[j+2].split(',');
									document.write("<tr>");
									document.write("<td align='center' bgcolor='#C0C0C0'><b>"+rule1[0]+"</b></td>");
									document.write("<td align=\"center\" bgcolor=\"#C0C0C0\"><b>"+PROTOCL[rule2[2]]+"</b></td>");
									/* document.write("<td align=\"center\" bgcolor=\"#C0C0C0\"><b>"+DIRECTION[rule2[6]]+"</b></td>");*/
									document.write("<td align=\"center\" bgcolor=\"#C0C0C0\"><b>"+rule2[0]+"-"+rule2[1]+"</b></td>");
									document.write("<td align=\"center\" bgcolor=\"#C0C0C0\"><b>"+PROTOCL[rule2[5]]+"</b></td>");
									document.write("<td align=\"center\" bgcolor=\"#C0C0C0\"><b>"+rule2[3]+"-"+rule2[4]+"</b></td>");
									document.write("<td align=\"center\" bgcolor=\"#C0C0C0\"><b><input type='button' value='Delete' onClick=\"natPortriggerActionFunc("+ i + "," + j +");\"></b></td>"); //
									document.write("</tr>");
								}
						}
					}
					</script>
				</table>
			</td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="submit.asp?d_nat_portrigger.asp" value="Send" >
	<input type="hidden" name="tokenid" name="tokenid2" value="" >
	<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_nat_portrigger] tokenid ="+tokenid);
	
	for(var i=0;i<3;i++)
	    document.getElementById("tokenid"+i).setAttribute("value",tokenid);
    </script> 
</form>

<script language="JavaScript">
function natPortriggerActionFunc(n,m)
{
  document.currentList.ruleType.value = n;
  document.currentList.rule.value = m;
  document.currentList.submit();
  create_backmask();
  document.getElementById("loading").style.display="";
}

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


