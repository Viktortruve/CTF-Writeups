<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#time_020#></title>

<SCRIPT>
function ntpStartFunc( form , ntpstart){
//  form.elements[0].value=ntpstart;
//  form.submit();
	document.location.href='d_time.asp';
}

function checkTime()
{	
	var year=document.time.year;
	var mon=document.time.month;
	var day=document.time.day;
	var hour=document.time.hour;
	var min=document.time.min;
	var sec=document.time.sec;

	if (year.value=="") {
		alert("<#time_000#>");
		year.value = year.defaultValue;
		year.focus();
		return false;
	}
	if ( validateKey( year.value ) == 0 ) {
		alert("<#time_001#>");
		year.value = year.defaultValue;
		year.focus();
		return false;
	}
	if ( !checkDigitRange(year.value,1,0,9999) ) {
		alert("<#time_002#>");
		year.value = year.defaultValue;
		year.focus();
		return false;
	}
	
	if (day.value=="") {
		alert("<#time_003#>");
		day.value = day.defaultValue;
		day.focus();
		return false;
	}
	if ( validateKey( day.value ) == 0 ) {
		alert("<#time_004#>");
		day.value = day.defaultValue;
		day.focus();
		return false;
	}
	if ( !checkDigitRange(day.value,1,1,31) ) {
		alert("<#time_005#>");
		day.value = day.defaultValue;
		day.focus();
		return false;
	}

	if (hour.value=="") {
		alert("<#time_006#>");
		hour.value = hour.defaultValue;
		hour.focus();
		return false;
	}
	if ( validateKey( hour.value ) == 0 ) {
		alert("<#time_007#>");
		hour.value = hour.defaultValue;
		hour.focus();
		return false;
	}
	if ( !checkDigitRange(hour.value,1,0,23) ) {
		alert("<#time_008#>");
		hour.value = hour.defaultValue;
		hour.focus();
		return false;
	}

	if (min.value=="") {
		alert("<#time_009#>");
		min.value = min.defaultValue;
		min.focus();
		return false;
	}
	if ( validateKey( min.value ) == 0 ) {
		alert("<#time_010#>");
		min.value = min.defaultValue;
		min.focus();
		return false;
	}	
	if ( !checkDigitRange(min.value,1,0,59) ) {
		alert("<#time_011#>");
		min.value = min.defaultValue;
		min.focus();
		return false;
	}

	if (sec.value=="") {
		alert("<#time_012#>");
		sec.value = sec.defaultValue;
		sec.focus();
		return false;
	}
	if ( validateKey( sec.value ) == 0 ) {
		alert("<#time_013#>");
		sec.value = sec.defaultValue;
		sec.focus();
		return false;
	}	
	if ( !checkDigitRange(sec.value,1,0,59) ) {
		alert("<#time_014#>");
		sec.value = sec.defaultValue;
		sec.focus();
		return false;
	}
	var tmp = year.value + "-" + mon.value + "-" + day.value + " " + hour.value + ":" + min.value + ":" + sec.value;
	document.time.datetime.value=tmp;
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

function checkUrlChar(url)
{
	var urlRegex=/^[a-zA-Z0-9]{1}[a-zA-Z0-9-.]{1,253}[a-zA-Z0-9]{1}$/;   
	var ipRegex=/^([0-9]{1,3}\.{1}){3}[0-9]{1,3}$/;

	if(!ipRegex.exec(url.value)){
		if (!urlRegex.exec(url.value))
		{
 			alert("<#time_015#>");
 			url.focus();
 			return false;		
		}	
	}else{
		if( !checkIP(url))
		{
			return false;
		}
	}
	
	return true;	
}

function saveChanges()
{
	
    if(document.ntp.ntpstate[1].checked)
 	{
 		if(document.ntp.ntpserver.value == "" && document.ntp.ntpserver2.value == "")
 		{
			alert("<#time_016#>");
			document.ntp.ntpserver.focus();
			return false;
 		}
 		
 		if(document.ntp.ntpserver.value != "")
 		{
			if(!checkUrlChar(document.ntp.ntpserver))
	 		{
	 			return false;
	 		}
 		}

		if(document.ntp.ntpserver2.value != "")
 		{
 			if(!checkUrlChar(document.ntp.ntpserver2))
			{
	 			return false;
 			}
 		}  		
	}	
 	var intetval=document.ntp.ntpinterval;
 	if (intetval.value=="") {
		alert("<#time_017#>");
		intetval.value = intetval.defaultValue;
		intetval.focus();
		return false;
	}
	if ( validatePosInt( intetval.value ) == 0 ) {
		alert("<#time_018#>");
		intetval.value = intetval.defaultValue;
		intetval.focus();
		return false;
	}
	if ( !checkDigitRange(intetval.value,1,1,300) ) {
		alert("<#time_018#>");
		intetval.value = intetval.defaultValue;
		intetval.focus();
		return false;
	}
	create_backmask();
	document.getElementById("loading").style.display="";
 	return true;
}

function checkState()
{
	
	if(document.ntp.ntpstate[1].checked){
		//enable ntp
		enableTextField(document.ntp.ntpserver);
		enableTextField(document.ntp.ntpserver2);
		enableTextField(document.ntp.ntpinterval);    
		enableTextField(document.ntp.ntptimezone); 
	} else {
		disableTextField(document.ntp.ntpserver);
		disableTextField(document.ntp.ntpserver2);
		disableTextField(document.ntp.ntpinterval);    
		disableTextField(document.ntp.ntptimezone); 
	}
}

function initValue()
{
	var tz = "<% getCfgGeneral(1, "TZ"); %>";
	document.ntp.ntptimezone.value = tz;

	var ctime = "<% d_getCurrentTimeASP(); %>";
	var patt3 = new RegExp("^([0-9]{1,5})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,5}):([0-9]{1,5}):([0-9]{1,5}) , ([A-Za-z0-9_]+)","g");
	var cresult, ctmp, cflag = 0;//	2014-05-21 18:33:52
	while( (cresult = patt3.exec( ctime )) != null )
	{
		ctmp = cresult;
		cflag = 1;
	}
	
	if(cflag == 1)
	{
		document.time.year.value=ctmp[1];
		document.time.month.value=String(Number(ctmp[2]));
		document.time.day.value=ctmp[3];
		document.time.hour.value=ctmp[4];
		document.time.min.value=ctmp[5];
		document.time.sec.value=ctmp[6];
	}
	
	
	var ntp_en = "<% getCfgGeneral(1,"NTPEnable"); %>";
	if(ntp_en == '0'){
		document.ntp.ntpstate[0].checked = true;
	}else{
		document.ntp.ntpstate[1].checked = true;
	}
	checkState();
}

</SCRIPT>
</head>

<body onload="initValue();">
<blockquote>

<script language="JavaScript">
	TabHeader="<#menu.ap_128#>";
	SideItem="<#menu.ap_114#>";
	HelpItem="datetime";
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
		<td class="topheader"><#time_021#></td>
	</tr>
	<tr>
		<td class="content">
			<p><#time_022#></p>
		</td>
	</tr>
</table>

<form method=POST Action="/goform/form2systime.cgi" name="time">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#time_023#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
                <tr>
                    <td class="form_label_left"><#time_024#></td>
                    <td class="form_label_right">
<INPUT TYPE="TEXT" NAME="year" SIZE="4" MAXLENGTH="4" VALUE="2012" >
<#time_038#>
<SELECT NAME="month" WIDTH=30 >
<OPTION VALUE="1" > 1</OPTION>
<OPTION VALUE="2" > 2</OPTION>
<OPTION VALUE="3" > 3</OPTION>
<OPTION VALUE="4" > 4</OPTION>
<OPTION VALUE="5" SELECTED> 5</OPTION>
<OPTION VALUE="6" > 6</OPTION>
<OPTION VALUE="7" > 7</OPTION>
<OPTION VALUE="8" > 8</OPTION>
<OPTION VALUE="9" > 9</OPTION>
<OPTION VALUE="10" > 10</OPTION>
<OPTION VALUE="11" > 11</OPTION>
<OPTION VALUE="12" > 12</OPTION>
</SELECT>
<#time_039#><INPUT TYPE="TEXT" NAME="day" SIZE="2" MAXLENGTH="2" VALUE="18" >
<#time_040#><INPUT TYPE="TEXT" NAME="hour" SIZE="2" MAXLENGTH="2" VALUE="13" >
<#time_041#><INPUT TYPE="TEXT" NAME="min" SIZE="2" MAXLENGTH="2" VALUE="14" >
<#time_042#><INPUT TYPE="TEXT" NAME="sec" SIZE="2" MAXLENGTH="2" VALUE="38" >
<#time_043#>                    </td>
                </tr>
<tr style="display:none;"><td class="form_label_left"><#time_037#></td>
<td>
<SELECT NAME="daylightsaving" WIDTH=30 >
<OPTION VALUE="0" > +6:00</OPTION>
<OPTION VALUE="1" > +5:00</OPTION>
<OPTION VALUE="2" > +4:00</OPTION>
<OPTION VALUE="3" > +3:00</OPTION>
<OPTION VALUE="4" > +2:00</OPTION>
<OPTION VALUE="5" > +1:00</OPTION>
<OPTION VALUE="6" SELECTED> 0:00</OPTION>
<OPTION VALUE="7" > -1:00</OPTION>
<OPTION VALUE="8" > -2:00</OPTION>
<OPTION VALUE="9" > -3:00</OPTION>
<OPTION VALUE="10" > -4:00</OPTION>
<OPTION VALUE="11" > -5:00</OPTION>
<OPTION VALUE="12" > -6:00</OPTION>
</SELECT>
</td></tr>
			</table>
		</td>
	</tr>
</table>
<br>
<p align=center>
<INPUT TYPE="hidden" NAME="datetime" VALUE="">
<input type="submit" value="<#time_035#>"  onClick="return checkTime()">
<INPUT TYPE="RESET" NAME="reset" VALUE="<#time_036#>" onClick="ntpStartFunc( this.form, '1');">
<INPUT TYPE="hidden" NAME="submit.htm?d_time.asp" VALUE="Send">
 <input type="hidden" name="tokenid" id="tokenid0" value="" >
</p>
</form>

<form method=POST Action="/goform/form2ntp.cgi" name="ntp">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#time_025#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left"><#time_026#></td>
					<td class="form_label_radio" style="text-align: left;">
<INPUT TYPE="RADIO" NAME="ntpstate" VALUE="0" onClick="checkState()" CHECKED ><#time_045#>
<INPUT TYPE="RADIO" NAME="ntpstate" VALUE="1" onClick="checkState()"  ><#time_046#>
                    </td>
				</tr>

                <tr>
                    <td class="form_label_left"><#time_027#></td>
                    <td class="form_label_right">
<INPUT TYPE="TEXT" NAME="ntpserver" SIZE="64" MAXLENGTH="255" VALUE="<% getCfgGeneral(1, "NTPServerIP"); %>" >
                    </td>
                </tr>

                <tr style="display:none;">
                    <td class="form_label_left"><#time_028#></td>
                    <td class="form_label_right">
<INPUT TYPE="TEXT" NAME="ntpserver2" SIZE="64" MAXLENGTH="255" VALUE="" >
                    </td>
                </tr-->

                <tr>
                    <td class="form_label_left"><#time_029#></td>
                    <td class="form_label_right">
<#time_044#><INPUT TYPE="TEXT" NAME="ntpinterval" SIZE="5" MAXLENGTH="3" VALUE="<% getCfgGeneral(1, "NTPSync"); %>" >
<#time_041#>                    </td>
                </tr>

                <tr>
                    <td class="form_label_left"><#time_030#></td>
                    <td class="form_label_right">
	  <SELECT NAME="ntptimezone" WIDTH=30 tid="SNTP_SEL_TimeZone">
      <option value="UCT_-11" id="manNTPMidIsland"><#Time_Service_1#></option>
      <option value="UCT_-10" id="manNTPHawaii"><#Time_Service_2#></option>
      <option value="NAS_-09" id="manNTPAlaska"><#Time_Service_3#></option>
      <option value="PST_-08" id="manNTPPacific"><#Time_Service_4#></option>
      <option value="MST_-07" id="manNTPMountain"><#Time_Service_5#></option>
      <option value="AST_-07" id="manNTPArizona"><#Time_Service_6#></option>
      <option value="CST_-06" id="manNTPCentral"><#Time_Service_7#></option>
      <option value="UCT_-06" id="manNTPMidUS"><#Time_Service_8#></option>
      <option value="UCT_-05" id="manNTPIndianaEast"><#Time_Service_9#></option>
      <option value="EST_-05" id="manNTPEastern"><#Time_Service_10#></option>
      <option value="AST_-04" id="manNTPAtlantic"><#Time_Service_11#></option>
      <option value="UCT_-04" id="manNTPBolivia"><#Time_Service_12#></option>
      <option value="UCT_-03" id="manNTPGuyana"><#Time_Service_13#></option>
      <option value="EBS_-03" id="manNTPBrazilEast"><#Time_Service_14#></option>
      <option value="NOR_-02" id="manNTPMidAtlantic"><#Time_Service_15#></option>
      <option value="EUT_-01" id="manNTPAzoresIslands"><#Time_Service_16#></option>
      <option value="UCT_000" id="manNTPGambia"><#Time_Service_17#></option>
      <option value="GMT_000" id="manNTPEngland"><#Time_Service_18#></option>
      <option value="MET_001" id="manNTPCzechRepublic"><#Time_Service_19#></option>
      <option value="MEZ_001" id="manNTPGermany"><#Time_Service_20#></option>
      <option value="UCT_001" id="manNTPTunisia"><#Time_Service_21#></option>
      <option value="EET_002" id="manNTPGreece"><#Time_Service_22#></option>
      <option value="SAS_002" id="manNTPSouthAfrica"><#Time_Service_23#></option>
      <option value="IST_003" id="manNTPIraq"><#Time_Service_24#></option>
      <option value="MSK_003" id="manNTPMoscowWinter"><#Time_Service_25#></option>
      <option value="UCT_004" id="manNTPArmenia"><#Time_Service_26#></option>
      <option value="UCT_005" id="manNTPPakistan"><#Time_Service_27#></option>
      <option value="UCT_00530" id="manNTPPakistan"><#Time_Service_40#></option>
      <option value="UCT_006" id="manNTPBangladesh"><#Time_Service_28#></option>
      <option value="UCT_007" id="manNTPThailand"><#Time_Service_29#></option>
      <option value="CST_008" id="manNTPChinaCoast"><#Time_Service_30#></option>
      <option value="CCT_008" id="manNTPTaipei"><#Time_Service_31#></option>
      <option value="SST_008" id="manNTPSingapore"><#Time_Service_32#></option>
      <option value="AWS_008" id="manNTPAustraliaWA"><#Time_Service_33#></option>
      <option value="JST_009" id="manNTPJapan"><#Time_Service_34#></option>
      <option value="KST_009" id="manNTPKorean"><#Time_Service_35#></option>
      <option value="UCT_010" id="manNTPGuam"><#Time_Service_36#></option>
      <option value="UCT_011" id="manNTPSolomonIslands"><#Time_Service_37#></option>
      <option value="UCT_012" id="manNTPFiji"><#Time_Service_38#></option>
      <option value="NZS_012" id="manNTPNewZealand"><#Time_Service_39#></option>
    </select>

<!--SELECT NAME="ntptimezone" WIDTH=30><OPTION VALUE="-1200" > (GMT-12:00) 国际日期变更线以西</OPTION>
<OPTION VALUE="-1100" > (GMT-11:00) 中途岛，萨摩亚</OPTION>
<OPTION VALUE="-1000" > (GMT-10:00) 夏威夷</OPTION>
<OPTION VALUE="-900" > (GMT-09:00) 阿拉斯加州</OPTION>
<OPTION VALUE="-800" > (GMT-08:00) 太平洋时间，蒂华纳</OPTION>
<OPTION VALUE="-700" > (GMT-07:00) 亚利桑那州，山地时间</OPTION>
<OPTION VALUE="-600" > (GMT-06:00) 中美洲，中部时间，墨西哥城</OPTION>
<OPTION VALUE="-500" > (GMT-05:00) 东部时间，印第安那州，哥伦比亚，巴拿马</OPTION>
<OPTION VALUE="-400" > (GMT-04:00) 太平洋时间</OPTION>
<OPTION VALUE="-330" > (GMT-03:30) 纽芬兰</OPTION>
<OPTION VALUE="-300" > (GMT-03:00) 格陵兰</OPTION>
<OPTION VALUE="-200" > (GMT-02:00) 中大西洋</OPTION>
<OPTION VALUE="-100" > (GMT-01:00) 亚速尔群岛</OPTION>
<OPTION VALUE="0" > (GMT) 格林威治标准时间：冈比亚，利比里亚，摩洛哥，英格兰</OPTION>
<OPTION VALUE="100" > (GMT+01:00) 西班牙， 突尼斯，法国，德国，意大利</OPTION>
<OPTION VALUE="200" > (GMT+02:00) 南非，希腊，乌克兰，罗马尼亚，土耳其</OPTION>
<OPTION VALUE="300" > (GMT+03:00) 伊拉克，约旦，科威特</OPTION>
<OPTION VALUE="400" > (GMT+04:00) 亚美尼亚</OPTION>
<OPTION VALUE="430" > (GMT+04:30) 喀布尔</OPTION>
<OPTION VALUE="500" > (GMT+05:00) 巴基斯坦</OPTION>
<OPTION VALUE="530" > (GMT+05:30) 加尔各答, 金奈, 孟买, 新德里</OPTION>
<OPTION VALUE="545" > (GMT+05:45) 加德满都</OPTION>
<OPTION VALUE="600" > (GMT+06:00) 孟加拉国</OPTION>
<OPTION VALUE="630" > (GMT+06:30) 仰光</OPTION>
<OPTION VALUE="700" > (GMT+07:00) 曼谷</OPTION>
<OPTION VALUE="800" SELECTED> (GMT+08:00) 北京，香港，台北，新加坡，  澳大利亚</OPTION>
<OPTION VALUE="900" > (GMT+09:00) 日本，韩国</OPTION>
<OPTION VALUE="930" > (GMT+09:30) 阿德莱德, 达尔文</OPTION>
<OPTION VALUE="1000" > (GMT+10:00) 关岛，悉尼</OPTION>
<OPTION VALUE="1100" > (GMT+11:00) 所罗门群岛，新喀里多尼亚</OPTION>
<OPTION VALUE="1200" > (GMT+12:00) 斐济，新西兰</OPTION>
<OPTION VALUE="1300" > (GMT+13:00) 萨摩亚群岛</OPTION>
</SELECT-->
</td>
                </tr>

                <tr>
                    <td class="form_label_left"><#time_031#></td>
                    <td class="form_label_right">
<script language="javascript">
//	2012年5月18日 05时14分38秒, 星期五 
var Week  = [
[ "Monday"		,	"<#Monday#>"],
[ "Tuesday"		,	"<#Tuesday#>"],
[ "Wednesday"	,	"<#Wednesday#>"],
[ "Thursday"	,	"<#Thursday#>"],
[ "Friday"		,	"<#Friday#>"],
[ "Saturday"	,	"<#Saturday#>"],
[ "Sunday"		,	"<#Sunday#>"]
];
	var ctime = "<% d_getCurrentTimeASP(); %>";
	var patt3 = new RegExp("^([0-9]{1,5})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,5}):([0-9]{1,5}):([0-9]{1,5}) , ([A-Za-z0-9_]+)","g");
	var cresult, ctmp, cweek='', cflag = 0;//	2014-05-21 18:33:52
	while( (cresult = patt3.exec( ctime )) != null )
	{
		ctmp = cresult[1] + '<#time_047#> ' + cresult[2] + '<#time_048#> ' + cresult[3] + ' , ' + cresult[4] + '<#time_050#>' + cresult[5] + '<#time_051#>' +  cresult[6] + '<#time_052#>' ;
		for(var i = 0 ; i < Week.length; i++)
		{
			if( Week[i][0] == cresult[7])
			{
				cweek = Week[i][1];
			}
		}
		dw( ctmp + ' , ' + cweek);
		cflag = 1;
	}
	if( cflag == 0)
	{
		dw( ctime );
	}
</script>
</td>
                </tr>
			</table>
		</td>
	</tr>
</table>
<br>
<p align=center>
<input type="submit" value="<#time_035#>"  onClick="return saveChanges()">
<INPUT TYPE="RESET" NAME="reset" VALUE="<#time_036#>" onClick="ntpStartFunc( this.form, '1');">
<INPUT TYPE="hidden" NAME="submit.htm?d_time.asp" VALUE="Send">
 <input type="hidden" name="tokenid" id="tokenid1" value="" >
</p>
</form>

<form method=POST Action="/goform/form2ntpstart.cgi">
<table id="body_header" border="0" cellSpacing="0">
	<tr>
		<td class="topheader"><#time_032#></td>
	</tr>
	<tr>
		<td class="content" align="left">
			<table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr>
					<td class="form_label_left"><#time_033#></td>
					<td class="form_label_right">
						<INPUT TYPE="BUTTON" VALUE="<#time_034#>" onClick="ntpStartFunc( this.form, '1');">
                    </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<INPUT TYPE="HIDDEN" NAME="ntpstart" VALUE="start" >
<INPUT TYPE="hidden" NAME="submit.htm?d_time.asp" VALUE="Send">
<input type="hidden" name="tokenid" id="tokenid2" value="" >
<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_time] tokenid ="+tokenid);
	
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

