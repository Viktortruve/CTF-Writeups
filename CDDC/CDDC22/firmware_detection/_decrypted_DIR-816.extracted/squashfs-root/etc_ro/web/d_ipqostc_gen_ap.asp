<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<TITLE><#ipqostc_gen_ap_000#></TITLE>
<STYLE type=text/css>
.STYLE1 {color: #FF0000}
</STYLE>
<SCRIPT language="javascript" type="text/javascript">
var lanip="192.168.1.1";
var lanmask="255.255.255.0";
var numReg=/^[0-9]+$/;

function getSumOfUpRateCeiling()
{
        var qosTbl=document.getElementById('qosTable');
        var rows=qosTbl.rows;
	var sumUpRateCeiling = 0;
	
        for(var i=2;i<rows.length;i++)
	{		
		sumUpRateCeiling += parseInt(rows[i].cells[4].innerText);
		//sumUpRateCeiling += parseInt(rows[i].cells[8].innerText); //because something display none
        }

	return sumUpRateCeiling;
}

function getSumOfDownRateCeiling()
{
  	var qosTbl=document.getElementById('qosTable');
        var rows=qosTbl.rows;
	var sumDownRateCeling = 0;

	for(var i=2;i<rows.length;i++)
	{		
		sumDownRateCeling += parseInt(rows[i].cells[5].innerText);
		//sumDownRateCeling += parseInt(rows[i].cells[9].innerText); //because something display none 
        }

	return sumDownRateCeling;
}

function on_apply_bandwidth()
{

	
	var total=parseInt(document.qostc.total.value);
	var downtotal=parseInt(document.qostc.downtotal.value);
    
	if(document.qostc.tcauto.checked==true)
	{
	  document.qostc.tcauto.value='1';
	}
	else
	{
	  document.qostc.tcauto.value='0';
	}
	
	if (document.qostc.tcauto.checked == false && document.qostc.total.value != "")
	{
		if(getSumOfUpRateCeiling() > total && total != 0)
		{
			alert("<#ipqostc_gen_ap_001#>");
			document.qostc.total.focus();
			return false;
		}
		
	}
	if (document.qostc.tcauto.checked == false && document.qostc.downtotal.value != "")
	{
		if(getSumOfDownRateCeiling() > downtotal && downtotal != 0)
		{
			alert("<#ipqostc_gen_ap_002#>");
			document.qostc.downtotal.focus();
			return false;
		}
	}
	
	
	if ( document.qostc.total.value!="" ) {
		if ( !numReg.exec( document.qostc.total.value )) 
		{
			alert("<#ipqostc_gen_ap_003#>");
			document.qostc.total.focus();
			return false;
		}
	}	
	if ( document.qostc.downtotal.value!="" ) {
		if (!numReg.exec( document.qostc.downtotal.value )) 
		{
			alert("<#ipqostc_gen_ap_004#>");
			document.qostc.downtotal.focus();
			return false;
		}
	}

	/*
	if ( document.qostc.pppoe.value!="" ) {
		if ( validateKey( document.qostc.pppoe.value ) == 0 ) {
			alert("<#ipqostc_gen_ap_005#>");
			document.qostc.pppoe.focus();
			return false;
		}
	}

	if ( document.qostc.ipoa.value!="" ) {
		if ( validateKey( document.qostc.ipoa.value ) == 0 ) {
			alert("<#ipqostc_gen_ap_006#>");
			document.qostc.ipoa.focus();
			return false;
		}
	}

	if ( document.qostc.ipoe.value!="" ) {
		if ( validateKey( document.qostc.ipoe.value ) == 0 ) {
			alert("<#ipqostc_gen_ap_007#>");
			document.qostc.ipoe.focus();
			return false;
		}
	}

	*/
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

function onSelProt()
{
	with(document.qostcrule) {
		if (proto.selectedIndex >= 2)
		{
			sport.disabled = false;
			dport.disabled = false;
		} else {
			sport.disabled = true;
			dport.disabled = true;
		}
	}
}

function on_Add()
{
	if (document.getElementById){  // DOM3 = IE5, NS6
		document.getElementById('tcrule').style.display = 'block';
	} else {
		if (document.layers == false) {// IE4
			document.all.tcrule.style.display = 'block';
		}
	}
	onSelProt();
}

function saveClick(rml)
{
	var lst = '';

	if (ruleStr.length)
	{
		var flag = 0;
		if (rml.length > 0) 
		{
			for (i = 0; i < rml.length; i++) 
			{
				if ( rml[i].checked == true )
				{
					lst += rml[i].value + ',';
					flag = 1;
				}
			}
		}
		else if ( rml.checked == true )
		{
			lst += rml.value+',';
			flag = 1;
		}
		document.qostcruledel.removeRuleList.value = lst;
		
		if (flag == 1)
		{
			if (!confirm('<#ipqostc_gen_ap_053#>'))
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
		else if (flag == 0)
		{
			alert("<#ipqostc_gen_ap_054#>");
			return false;
		}
	}
	else
	{
		alert("<#ipqostc_gen_ap_052#>");
		return false;
	}
	

}

function on_apply()
{
	var total=parseInt(document.qostc.total.value);
	var downtotal=parseInt(document.qostc.downtotal.value);

	with(document.qostcrule) 
	{
		
		if ((srcip.value=="") && (dstip.value=="") && (sport.value=="") && (dport.value=="") && 
			(proto.value==0))
		{
			alert("<#ipqostc_gen_ap_008#>");
			return false;
		}

		if ( srcip.value!="" )
		{
			if (validateKey( srcip.value ) == 0 ||
				!checkDigitRange(srcip.value,2,0,255) ||
				!checkDigitRange(srcip.value,3,0,255) ||
				!checkDigitRange(srcip.value,4,0,254) ||
				!checkDigitRange(srcip.value,1,0,223) ) 
			{
				alert("<#ipqostc_gen_ap_009#>");
				srcip.focus();
				return false;
			}

		}

		if(srcnetmask.value!="" )
		{
			if(!checkMask(srcnetmask))
			{
				return false;
			}
		}		

		if ( dstip.value!="" )
		{
			if (validateKey( dstip.value ) == 0 ||
				!checkDigitRange(dstip.value,2,0,255) ||
				!checkDigitRange(dstip.value,3,0,255) ||
				!checkDigitRange(dstip.value,4,0,254) ||
				!checkDigitRange(dstip.value,1,0,223) )
			{
				alert("<#ipqostc_gen_ap_010#>");
				dstip.focus();
				return false;
			}
		}

		if(dstnetmask.value!="" )
		{
			if(!checkMask(dstnetmask))
			{
				return false;
			}
		}		

		if ( sport.value!="" )
		{
			var Sport=parseInt(sport.value);		
			if(!numReg.exec(sport.value )|| Sport <0 || Sport > 65536)
			{
				sport.focus();
				alert("<#ipqostc_gen_ap_011#>"+ sport.value + "<#ipqostc_gen_ap_012#>");

				return false;
			}
			
			if (Sport > 0 && Sport < 65535)
			{
				if (proto.value < 2) {
					sport.focus();
					alert("<#ipqostc_gen_ap_013#>");
					return false;
				}
			}
		}

		if ( dport.value!="" )
		{
			var Dport=parseInt(dport.value);
			if(!numReg.exec(dport.value ) || Dport <0 || Dport > 65536)
			{
				dport.focus();
				alert("<#ipqostc_gen_ap_014#>"+ dport.value + "<#ipqostc_gen_ap_012#>");
				return false;
			}
			if (Dport > 0 && Dport<65535)
			{
				if (proto.value < 2) {
					dport.focus();
					alert("<#ipqostc_gen_ap_013#>");
					return false;
				}
			}
		}
		
		var UprateFloor=parseInt(uprateFloor.value);
		if(!numReg.exec(uprateFloor.value ) || UprateFloor<=0)
		{
			uprateFloor.focus();
			alert("<#ipqostc_gen_ap_015#>");
			return false;
		}

		var UprateCeiling=parseInt(uprateCeiling.value);
		if(!numReg.exec(uprateCeiling.value ) || UprateCeiling<=0)
		{
			uprateCeiling.focus();
			alert("<#ipqostc_gen_ap_015#>");
			return false;
		}

		if(total > 0 && UprateCeiling > total)
		{
			uprateCeiling.focus();
			alert("<#ipqostc_gen_ap_016#>");
			return false;
		}		
		
		if(UprateFloor > UprateCeiling)
		{
			uprateFloor.focus();
			alert("<#ipqostc_gen_ap_017#>");
			return false;
		}
		
		var DownrateFloor=parseInt(downrateFloor.value);
		if(!numReg.exec(downrateFloor.value ) || DownrateFloor<=0)
		{
			downrateFloor.focus();
			alert("<#ipqostc_gen_ap_015#>");
			return false;
		}
		
		var DownrateCeiling=parseInt(downrateCeiling.value);
		if(!numReg.exec(downrateCeiling.value ) || DownrateCeiling<=0)
		{
			downrateCeiling.focus();
			alert("<#ipqostc_gen_ap_015#>");
			return false;
		}
		if(downtotal > 0 && DownrateCeiling > downtotal)
		{
			downrateCeiling.focus();
			alert("<#ipqostc_gen_ap_018#>");
			return false;
		}		
		if(DownrateFloor > DownrateCeiling)
		{
			downrateFloor.focus();
			alert("<#ipqostc_gen_ap_019#>");
			return false;
		}
		if(total != 0 && (total - UprateCeiling) < getSumOfUpRateCeiling())
		{
			alert("<#ipqostc_gen_ap_020#>");
			return false;
		}
		if(downtotal !=0 && (downtotal - DownrateCeiling) < getSumOfDownRateCeiling())
		{
			alert("<#ipqostc_gen_ap_021#>");
			return false;
		}
		create_backmask();
		document.getElementById("loading").style.display="";
		return true;
	}
}
</SCRIPT>
</head>

<body>
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_127#>";
	SideItem="<#menu.ap_100#>";
	HelpItem="Qos_tc";
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
		<td class="topheader"><#ipqostc_gen_ap_022#></td>
	</tr>
	<tr>
		<td class="content">
			<p><#ipqostc_gen_ap_023#><br>
			</p>
		</td>
	</tr>
</table>
<form action="/goform/form2IPQoSTcRate" method=POST name=qostc>
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#ipqostc_gen_ap_022#></td>
	</tr>

	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left"><#ipqostc_gen_ap_024#>
					</td>
					<td class="form_label_right"><#ipqostc_gen_ap_025#>
						<input type="text" name=total id=total size="6" maxlength="6" value="0">kbps
    					</td>
        				<td class="form_label_right"><#ipqostc_gen_ap_026#>
        					<input type="text" name=downtotal id=downtotal size="6" maxlength="6" value="0">kbps
    					</td>    
  				</tr>
			</table>
		</td>
	</tr>

	<tr style="display:none">
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left"><label><#ipqostc_gen_ap_027#><input type="checkbox" name="tcauto" value ="0"  id="tcauto" 
					onclick="onClickTcAuto()" ></label>
					</td>
					<td class="form_label_right">
						&nbsp;
    					</td>
  				</tr>
			</table>
		</td>
	</tr>

</table>

<p align=center>
<input type="submit" name="applyItflimit" onClick="return on_apply_bandwidth();" value="<#ipqostc_gen_ap_028#>">
<input type="hidden" value="Send" name="submit.htm?ipqostc_gen_ap.htm">
<input type="hidden" name="tokenid" id="tokenid0" value="" >
</p>
</form>

<form action="/goform/form2IPQoSTcDel" method=POST name=qostcruledel>
<div id="tcruletable" style="display:block">

<table id=body_header border=0 cellSpacing=0>
	<tr>
		<td class=topheader><#ipqostc_gen_ap_029#></td>
	</tr>
	<tr>
		<td class=content>
			<table id=qosTable class=formlisting border=0>
				<tr>
					<td align=center width="5%" rowspan="2" bgcolor="#808080"></td>
					<!--
					<td align=center width="5%" rowspan="2" bgcolor="#808080"><#ipqostc_gen_ap_030#></td>
	
					<td align=center width="5%" rowspan="2" bgcolor="#808080"><#ipqostc_gen_ap_031#></td>
					<td align=center width="5%" rowspan="2" bgcolor="#808080"><#ipqostc_gen_ap_032#></td>
					-->	
					<td align=center width="15%" rowspan="2" bgcolor="#808080"><#ipqostc_gen_ap_033#></td>
					<!--
					<td align=center width="15%" rowspan="2" bgcolor="#808080"><#ipqostc_gen_ap_034#></td>
					-->
					<td align=center width="10%" colspan="2" bgcolor="#808080"><#ipqostc_gen_ap_035#></td>
					<td align=center width="10%" colspan="2" bgcolor="#808080"><#ipqostc_gen_ap_036#></td>
					<td align=center width="5%" rowspan="2" bgcolor="#808080"><#ipqostc_gen_ap_037#></td>
				</tr>
					<tr>
					<td align=center width="10%" bgcolor="#808080"><#ipqostc_gen_ap_038#></td>
					<td align=center width="10%" bgcolor="#808080"><#ipqostc_gen_ap_039#></td>
					<td align=center width="10%" bgcolor="#808080"><#ipqostc_gen_ap_040#></td>
					<td align=center width="10%" bgcolor="#808080"><#ipqostc_gen_ap_041#></td>
				</tr>

                <script language="JavaScript" type="text/javascript">
                var i,j;
                var PROTOCL = new Array("","ICMP","TCP","UDP","TCP/UDP");
				var ruleStr="<% getCfgGeneral(1, "ip_ctl_carrules");%>";
				var rule = new Array;
				var rule1 = new Array;
				if(ruleStr.length != 0)
			   {
				  if(ruleStr.indexOf(";") > 0)
				  	  ruleTypeNum = ruleStr.match(/;/g).length; // 规则种类数
				  rule = ruleStr.split(';');
				  
				 for(i=0;i<ruleTypeNum;i++)
				 {
				   
				    rule1=rule[i].split(',');
				    document.write("<tr>");
					document.write("<td align='center' bgcolor='#C0C0C0'><b><font size=2>"+(i+1)+"</font></b></td>");
					/*
					document.write("<td align='center' bgcolor='#C0C0C0'><b><font size=2>"+PROTOCL[rule1[0]]+"</font></b></td>");
					document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[1]+"</font></b></td>");
					document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[2]+"</font></b></td>");
					*/
					if(rule1[3].length==0)
					{
					 document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+" "+"</font></b></td>");
					}
					else
					{ 
					  document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[3]+"/"+rule1[4]+"</font></b></td>");
					}
					/*
					if(rule1[5].length==0)
					{
					  document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+" "+"</font></b></td>");
					}
					else
					{
					  document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[5]+"/"+rule1[6]+"</font></b></td>");
					}
					*/
					document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[7]+"</font></b></td>");
					document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[8]+"</font></b></td>");
					document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[9]+"</font></b></td>");
					document.write("<TD align='center' bgcolor='#C0C0C0'><b><font size=2>"+rule1[10]+"</font></b></td>");
				    document.write("<TD align='center' bgcolor='#C0C0C0'><b><input type='checkbox'name='removeQ' value='"+i+"'><b></td>");
					document.write("</tr>");
				
              }
		  }
         </script>
			</table>
		</td>
	</tr>
</table>
<br>
<p align=center>
    <input type="hidden" name=removeRuleList>
	<input type="hidden" name="tokenid" id="tokenid1" value="" >
    <input type="button" class="button" onClick="on_Add()" value="<#ipqostc_gen_ap_042#>">
    <input type="submit" name="save" onClick="return saveClick(this.form.removeQ);" value="<#ipqostc_gen_ap_043#>">
</p>  

</div>
</form>

<div id="tcrule" style="display:none">
<p></p>
<table cellSpacing="1" cellPadding="0" border="0">	
<form action="/goform/form2IPQoSTcAdd" method=POST name=qostcrule>

  <tr style="display:none">
    <td><font size=2><#ipqostc_gen_ap_030#>:</font></td>
    <td>
      <select name="proto" onChange="return onSelProt()">
        <option value="0"><#ipqostc_gen_ap_044#></option>
        <option value="1">ICMP</option>
        <option value="2">TCP </option>
        <option value="3">UDP </option>
        <option value="4">TCP/UDP</option>
      </select>
    </td>
  </tr>

  <tr>
    <td><font size=2><#ipqostc_gen_ap_033#>:</font></td>
    <td><input type="text" name="srcip" size="20" maxlength="46" style="width:150px"></td>

    <td style="display:none"><font size=2><#ipqostc_gen_ap_045#>:</font></td>
    <td style="display:none"><input type="text" name="srcnetmask" size="20" maxlength="46" style="width:150px"></td>

  </tr>

  <tr style="display:none">
    <td><font size=2><#ipqostc_gen_ap_034#>:</font></td>
    <td><input type="text" name="dstip" size="20" maxlength="46" style="width:150px"></td>
    <td><font size=2><#ipqostc_gen_ap_046#>:</font></td>
    <td><input type="text" name="dstnetmask" size="20" maxlength="46" style="width:150px"></td>
  </tr>
  <tr style="display:none">
    <td><font size=2><#ipqostc_gen_ap_031#>:</font></td>
    <td><input type="text" name="sport" size="5" maxlength="5" style="width:80px"></td>
    <td><font size=2><#ipqostc_gen_ap_032#>:</font></td>
    <td><input type="text" name="dport" size="5"  maxlength="5" style="width:80px"></td>
  </tr>

  <tr>
    <td><font size=2><#ipqostc_gen_ap_047#>:</font></td>
    <td><input type="text" name="uprateFloor" size="6" style="width:80px">kb/s</td>
    <td><font size=2><#ipqostc_gen_ap_048#>:</font></td>
    <td><input type="text" name="uprateCeiling" size="6" style="width:80px">kb/s</td>    
  </tr>
  <tr>
    <td><font size=2><#ipqostc_gen_ap_049#>:</font></td>
    <td><input type="text" name="downrateFloor" size="6" style="width:80px">kb/s</td>
    <td><font size=2><#ipqostc_gen_ap_050#></font></td>
    <td><input type="text" name="downrateCeiling" size="6" style="width:80px">kb/s</td>    
  </tr>  
</table>
<br>
<p align=center>
<input type="submit" name="addRule" value="<#ipqostc_gen_ap_051#>" onClick="return on_apply();" style="width:80px">
</p>
</div>
 <input type="hidden" name="tokenid" id="tokenid2" value="" >
 <script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_ipqostc_gen_ap] tokenid ="+tokenid);
	
	for(var i=0;i<3;i++)
	    document.getElementById("tokenid"+i).setAttribute("value",tokenid);
</script> 
</form>
</DIV>
<script>
	mainBodyEnd();
	ThirdRowEnd();
	Footer()
	mainTableEnd()
</script>
</blockquote>
 <script>

window.onload = function() {
	var uptotalStr="<% getCfgGeneral(1, "ip_ctl_uptotal"); %>";
	var dowtotalStr="<% getCfgGeneral(1, "ip_ctl_downtotal"); %>";
	var auto_en="<% getCfgGeneral(1, "ip_ctl_auto"); %>";
	var tcruletable = document.getElementById('tcruletable');
	var tcrule = document.getElementById('tcrule');
	var tcauto = document.getElementById('tcauto');
	var uptotal = document.getElementById('total');
	var downtol = document.getElementById('downtotal');
	
	if(auto_en=='1')
	{
	  tcauto.checked=true;
	  tcauto.value='1';
	}
	else
	{
	  tcauto.checked=false;
	  tcauto.value='0';
	}
	
	if(uptotalStr.length>0)
	{
	  uptotal.value=uptotalStr;
	}
	else
	{
	  uptotal.value='0';
	}
	
	if(dowtotalStr.length>0)
	{
	  downtol.value=dowtotalStr;
	}
	else
	{
	  downtol.value='0';
	}
	/*
	tcauto.onclick = function() {
		turn(this);
	}
	dispatchEvent('click', tcauto);
	*/
	onClickTcAuto();

}

function onClickTcAuto()
{
	var tcruletable = document.getElementById('tcruletable');
	var tcrule = document.getElementById('tcrule');
	var tcauto = document.getElementById('tcauto');
	if (tcauto.checked == true) {
		tcruletable.style.display = 'none';
		tcrule.style.display = 'none';
	} else {
		tcruletable.style.display = 'block';
	}

}
function turn(ele) {
	if (ele.checked) {
		tcruletable.style.display = 'none';
		tcrule.style.display = 'none';
	} else {
		tcruletable.style.display = 'block';
	}
}  

function dispatchEvent(type, ele) {
	ele = typeof ele == 'string' ? document.getElementById(ele) : ele;
	type = type || 'click';	
	if (document.createEvent) {
		var evt = document.createEvent("Events"); 
		evt.initEvent(type, true, true);
		ele.dispatchEvent(evt);
	} else {
		ele.fireEvent('on'+type);
	}
}

</script>
</body>
</html>

