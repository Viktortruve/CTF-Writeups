<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#wlan_basic_000#></title>

<style>

.on {display:on}
.off {display:none}
</style>

<SCRIPT>

var PreambleValue=0;
PreambleValue=0;
var wpsEnabled2g = '<% getCfgGeneral(1, "WscModeOption"); %>';

var regDomain, defaultChan, lastBand=0, lastMode=0, WiFiTest=0;
	regDomain = '<% getCfgGeneral(1, "CountryRegion"); %>';
var regDomainList = new Array();

var wepkeys64_key1 = new Array();
var wepkeys64_key2 = new Array();
var wepkeys64_key3 = new Array();
var wepkeys64_key4 = new Array();
var wepkeys128_key1 = new Array();
var wepkeys128_key2 = new Array();
var wepkeys128_key3 = new Array();
var wepkeys128_key4 = new Array();
if ('<% getCfgGeneral(1, "encode_Key1Str1"); %>' != '')
{
	wepkeys64_key1[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key1Str1"); %>');
}
else
{
	wepkeys64_key1[0] = '';
}
if ('<% getCfgGeneral(1, "encode_Key2Str1"); %>' != '')
{
	wepkeys64_key2[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key2Str1"); %>');
}
else
{
	wepkeys64_key2[0] = '';
}

if ('<% getCfgGeneral(1, "encode_Key3Str1"); %>' != '')
{
	wepkeys64_key3[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key3Str1"); %>');
}
else
{
	wepkeys64_key3[0] = '';
}
if ('<% getCfgGeneral(1, "encode_Key4Str1"); %>' != '')
{
	wepkeys64_key4[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key4Str1"); %>');
}
else
{
	wepkeys64_key4[0] = '';
}


if ('<% getCfgGeneral(1, "encode_Key1Str1"); %>' != '')
{
	wepkeys128_key1[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key1Str1"); %>');
}
else
{
	wepkeys128_key1[0] ='';
}

if ('<% getCfgGeneral(1, "encode_Key2Str1"); %>' != '')
{
	wepkeys128_key2[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key2Str1"); %>');
}
else
{
	wepkeys128_key2[0]='';
}

if ('<% getCfgGeneral(1, "encode_Key3Str1"); %>' != '')
{
	wepkeys128_key3[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key3Str1"); %>');
}
else
{
	wepkeys128_key3[0]='';
}

if ('<% getCfgGeneral(1, "encode_Key4Str1"); %>' != '')
{
	wepkeys128_key4[0] = Base64.Decode('<% getCfgGeneral(1, "encode_Key4Str1"); %>');
}
else
{
	wepkeys128_key4[0]='';
}

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


 function isValidWPAPasswd(str)
{

 var patrn=/^[a-zA-Z0-9!#$%&()*+,-./:;=?@[\]^_`{|}~<>]{1}[a-zA-Z0-9!#$%&()*+,-./:;=?@[\]^_`{|}~<>\x20]{6,62}[a-zA-Z0-9!#$%&()*+,-./:;=?@[\]^_`{|}~<>]{1}$/;
 if (!patrn.exec(str)) return false ;

 if(str.indexOf("  ") != -1)
  return false;

 return true;
}

function validateWepKey(idx, str)
{
 if (document.wlanBasicSetup.defaultTxKeyId[idx].checked ==true && str.length==0) {
  idx++;
  alert('<#wlan_basic_001#>');
  return 0;
 }
 if (str.length ==0)
  return 1;

 var keylen;
 if(document.wlanBasicSetup.length.selectedIndex == 0){

  if ( str.length == 5) {

   document.wlanBasicSetup.format.value = 1;
   keylen = 5;
  }else if ( str.length == 10) {

   document.wlanBasicSetup.format.value = 0;
   keylen = 10;
  }else {
   idx++;
   alert('<#wlan_basic_002#>');
   return 0;
  }
 }else{

  if ( str.length == 13) {

   document.wlanBasicSetup.format.value = 1;
   keylen = 13;
  }else if ( str.length == 26) {

   document.wlanBasicSetup.format.value = 0;
   keylen = 26;
  }else {
   idx++;
   alert('<#wlan_basic_003#>');
   return 0;
  }
 }

 if ( str == "*****" ||
  str == "**********" ||
  str == "*************" ||
  str == "**************************" )
  return 1;

 if (document.wlanBasicSetup.format.value == 1)
 {

  var patrn=/^[a-zA-Z0-9!#$%&()*+,-./:;=@[\]^_`{|}~<>]{1}[a-zA-Z0-9!#$%&()*+,-./:;=@[\]^_`{|}~<>\x20]*[a-zA-Z0-9!#$%&()*+,-./:;=@[\]^_`{|}~<>]{1}$/;

  if (!patrn.exec(str)) {
   alert('<#wlan_basic_004#>');
   return 0 ;
  }
  if(str.indexOf("  ",0)!=-1)
  {
   alert("<#wlan_basic_005#>");
   return 0;
  }

  return 1;
 }

 for (var i=0; i<str.length; i++) {
  if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
   (str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
   (str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
   continue;

  alert("<#wlan_basic_006#>");
  return 0;
 }

 return 1;
}
function saveChanges()
{
	
 if(document.wlanBasicSetup.hiddenSSID.checked == false){
 if ( wpsEnabled2g != '0')
 {
	if (confirm("<#wlan_basic_007#>") == 0)
	{
		return false;
	}
 }
 else
 {
	if (confirm("<#wlan_basic_059#>") == 0)
	{
		return false;
	}
  }
 }

// if(getStringByteCount(document.wlanBasicSetup.ssid.value) > 32)
 if(document.wlanBasicSetup.ssid.value.length ==0 || document.wlanBasicSetup.ssid.value.length > 32)
 {
  alert('<#wlan_basic_008#>');
  document.wlanBasicSetup.ssid.focus();
  return false;
 }
	if(includeSpecialKey(document.wlanBasicSetup.ssid.value))
	{
		alert('<#redirect_061#>');
		document.wlanBasicSetup.ssid.focus();
		return false;
	}
	if(includeChinese(document.wlanBasicSetup.ssid.value))
	{
		alert('<#redirect_071#>');
		document.wlanBasicSetup.ssid.focus();
		return false;
	}

 var band;
 if (document.wlanBasicSetup.band.selectedIndex == 0)
  band = 1;
 else if (document.wlanBasicSetup.band.selectedIndex == 1)
  band = 2;
 else if (document.wlanBasicSetup.band.selectedIndex == 2)
  band = 3;
 else if (document.wlanBasicSetup.band.value == 7)
  band = 8;
 else if (document.wlanBasicSetup.band.value == 9)
  band = 10;
 else if (document.wlanBasicSetup.band.value == 10)
  band = 11;
 else
  band = 4;

 basicRate=0;
 operRate=0;
 if (band & 1) {
  basicRate|=0xf;
  operRate|=0xf;
 }
 if ( (band & 2) || (band & 4) ) {
  operRate|=0xff0;
  if (!(band & 1)) {
   if (WiFiTest)
    basicRate=0x15f;
   else
    basicRate=0x1f0;
  }
 }
 if (band & 8) {
  if (!(band & 3))
   operRate|=0xfff;
  if (band & 1)
   basicRate=0xf;
  else if (band & 2)
   basicRate=0x1f0;
  else
   basicRate=0xf;
 }
 operRate|=basicRate;

 document.wlanBasicSetup.basicrates.value = basicRate;
 document.wlanBasicSetup.operrates.value = operRate;

 if(document.wlanBasicSetup.checkWPS2.value != 0){
  if(document.wlanBasicSetup.method.selectedIndex != document.wlanBasicSetup.method_cur.value){
  if ( document.wlanBasicSetup.band.options[document.wlanBasicSetup.band.selectedIndex].value != 6 )
  {
   if (document.wlanBasicSetup.method.selectedIndex == 1){
    if (confirm("<#wlan_basic_009#>") == 0){
     return false;
    }
   }else if (document.wlanBasicSetup.method.selectedIndex == 2){
    if (confirm("<#wlan_basic_010#>") == 0){
     return false;
    }
   }
  }
  }
 }

 if (document.wlanBasicSetup.method.selectedIndex>=2 || (document.wlanBasicSetup.band.options[document.wlanBasicSetup.band.selectedIndex].value == 6 && document.wlanBasicSetup.method.selectedIndex > 0)) {
  var str = document.wlanBasicSetup.tmppskValue.value;
  if (str.length != 64) {

   if (str.length < 8) {
    alert('<#wlan_basic_011#>');
    document.wlanBasicSetup.tmppskValue.focus();
    return false;
   }
   if (str.length > 63) {
    alert('<#wlan_basic_012#>');
    document.wlanBasicSetup.tmppskValue.focus();
    return false;
   }


   /*if(!isValidWPAPasswd(str))
   {
    alert('<#wlan_basic_013#>');
    return false;
   }*/
   if(includeSpecialKey(str))
   {
    alert('<#redirect_065#>');
    return false;
   }
   if(includeChinese(str))
   {
    alert('<#redirect_072#>');
    return false;
   }

   document.wlanBasicSetup.pskFormat.value=0;
  }
  else
  {

   for (var i=0; i<str.length; i++)
   {
    if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
     (str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
     (str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
     continue;
    alert("<#wlan_basic_014#>");
    document.wlanBasicSetup.tmppskValue.focus();
    return false;
   }

   document.wlanBasicSetup.pskFormat.value=1;
  }
 }
	if (document.wlanBasicSetup.tmppskValue.value != "")
	{
		var EncodePs = Base64.Encode(document.wlanBasicSetup.tmppskValue.value);
		document.wlanBasicSetup.pskValue.value = EncodePs;
	}

 if (document.wlanBasicSetup.band.options[document.wlanBasicSetup.band.selectedIndex].value != 6)
 {
 if (document.wlanBasicSetup.method.selectedIndex ==1)
 {
  if ( document.wlanBasicSetup.defaultTxKeyId[0].checked ==true){
   if(validateWepKey(0,document.wlanBasicSetup.show_key1.value)==0) {
    document.wlanBasicSetup.show_key1.focus();
    return false;
   }
  }
  if ( document.wlanBasicSetup.defaultTxKeyId[1].checked ==true){
   if (validateWepKey(1,document.wlanBasicSetup.show_key2.value)==0) {
    document.wlanBasicSetup.show_key2.focus();
    return false;
   }
  }
  if ( document.wlanBasicSetup.defaultTxKeyId[2].checked ==true){
   if (validateWepKey(2,document.wlanBasicSetup.show_key3.value)==0) {
    document.wlanBasicSetup.show_key3.focus();
    return false;
   }
  }
  if ( document.wlanBasicSetup.defaultTxKeyId[3].checked ==true){
   if (validateWepKey(3,document.wlanBasicSetup.show_key4.value)==0) {
    document.wlanBasicSetup.show_key4.focus();
    return false;
   }
  }
 }
 }

 //hidden
 for (var i=1; i<=4; i++)
 {
  var hidden_radiogroup = document.wlanBasicSetup.defaultTxKeyId;
  var hidden_keyfiled = document.getElementById('key'+i);
  var keyfiled = document.getElementById('show_key'+i);

  if(hidden_radiogroup[i-1].checked==true)
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

	document.wlanBasicSetup.tmppskValue.disabled = true;
	
	create_backmask();
	document.getElementById("loading").style.display="";
 return true;
}

function updateTxRate()
{
band=11;
txrate=1;
auto=1;
rf_num=2;


 if (document.wlanBasicSetup.band.selectedIndex == 0)
  band = 1;
 else if (document.wlanBasicSetup.band.selectedIndex == 1)
  band = 2;
 else if (document.wlanBasicSetup.band.selectedIndex == 2)
  band = 3;
 else if (document.wlanBasicSetup.band.value == 7)
  band = 8;
 else if (document.wlanBasicSetup.band.value == 9)
  band = 10;
 else if (document.wlanBasicSetup.band.value == 10)
  band = 11;
 else
  band = 4;


 var txRateOption = document.wlanBasicSetup.txRate;
 txRateOption.options.length = 0;

 rate_mask = [15,1,1,1,1,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8];

 rate_name_s_40 =["Auto","1M","2M","5.5M","11M","6M","9M","12M","18M","24M","36M","48M","54M", "15M","30M","45M","60M","90M","120M","135M","150M","30M","60M","90M","120M","180M","240M","270M","300M"];
 rate_name_l_40 =["Auto","1M","2M","5.5M","11M","6M","9M","12M","18M","24M","36M","48M","54M", "13.5M","27M","40.5M","54M","81M","108M","121.5M","135M","27M","54M","81M","108M","162M","216M","243M","270M"];
 rate_name_s_20 =["Auto","1M","2M","5.5M","11M","6M","9M","12M","18M","24M","36M","48M","54M", "7.2M","14.4M","21.7M","28.9M","43.3M","57.8M","65M","72.2M","14.4M","28.9M","43.3M","57.8M","86.7M","115.6M","130M","144.4M"];
 rate_name_l_20 =["Auto","1M","2M","5.5M","11M","6M","9M","12M","18M","24M","36M","48M","54M", "6.5M","13M","19.5M","26M","39M","52M","58.5M","65M","13M","26M","39M","52M","78M","104M","117M","130M"];


 rate_option_enable=[1,0,0,0,1,0,0,0,0,0,0,0,1, 0, 0,
  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1];
 mask=0;
 if(PreambleValue == '0' && document.wlanBasicSetup.chanwid.selectedIndex == 1)
 {
  rate_name = rate_name_s_40;
 }
 else if(PreambleValue == '1' && document.wlanBasicSetup.chanwid.selectedIndex == 1)
 {
  rate_name = rate_name_l_40;
 }
 else if(PreambleValue == '0' && document.wlanBasicSetup.chanwid.selectedIndex == 0)
 {
  rate_name = rate_name_s_20;
 }
 else if(PreambleValue == '1' && document.wlanBasicSetup.chanwid.selectedIndex == 0)
 {
  rate_name = rate_name_l_20;
 }

 if (auto)
  txrate=0;
 if (band & 1)
  mask |= 1;
 if ((band&2) || (band&4))
  mask |= 2;
 if (band & 8) {
  if (rf_num == 2)
   mask |= 12;
  else
   mask |= 4;
 }
 defidx=0;
 var optionindex=0;
 for (idx=0, i=0; i<=28; i++) {
  if (rate_mask[i] & mask) {
   if (i == 0)
    rate = 0;
   else
    rate = (1 << (i-1));
   if (txrate == rate)
   {

    defidx = optionindex;
   }


   if(rate_option_enable[i])
   {
    txRateOption.options.add(new Option(rate_name[i], i));
    optionindex++
   }
   idx++;
  }
 }
 document.wlanBasicSetup.txRate.selectedIndex=defidx;
}

function updateIputState()
{
 if (document.wlanBasicSetup.band.selectedIndex == 0||
  document.wlanBasicSetup.band.selectedIndex == 1||
  document.wlanBasicSetup.band.selectedIndex == 2){

  document.wlanBasicSetup.chanwid.selectedIndex = 0;
  disableTextField(document.wlanBasicSetup.chanwid);
 }
 else if (document.wlanBasicSetup.band.selectedIndex == 3||
  document.wlanBasicSetup.band.selectedIndex == 4||
  document.wlanBasicSetup.band.selectedIndex == 5){

  enableTextField(document.wlanBasicSetup.chanwid);
 }

 updateTxRate();

 updateChan_channebound();

 checkState();
 updateFormat();
}

function showChannel5G()
{
 document.wlanBasicSetup.chan.length=0;

 for (idx=0, chan=36; chan<=64; idx++, chan+=4) {

  if (chan == defaultChan){
   document.wlanBasicSetup.chan.selectedIndex = idx;
   document.wlanBasicSetup.chan.options[idx] = new Option(chan, chan, true, false);
  }else{
   document.wlanBasicSetup.chan.options[idx] = new Option(chan, chan, false, false);
  }
 }
 document.wlanBasicSetup.chan.length = idx;
}


function showChannel2G(bound_40, band)
{
 start = 0;
 end = 0;
 if (regDomain==0) {
  start = 1;
  end = 11;
 }
 else if(regDomain==1 || regDomain==32)
 {
  start = 1;
  end = 13;
 }
 else if(regDomain==2)
 {
  start = 10;
  end = 11;
 }
 else if(regDomain==3)
 {
  start = 10;
  end = 13;
 }
 else if(regDomain==4)
 {
  start = 14;
  end = 14;
 }
 else if(regDomain==5 || regDomain==31 || regDomain==33)
 {
  start = 1;
  end = 14;
 }
  else if(regDomain==6)
 {
  start = 3;
  end = 9;
 }
   else if(regDomain==7)
 {
  start = 5;
  end = 13;
 }
 else {
  start = 1;
  end = 11;
 }

 document.wlanBasicSetup.chan.length=0;
 idx=0;

 if (0 == defaultChan) {
  document.wlanBasicSetup.chan.selectedIndex = 0;
  document.wlanBasicSetup.chan.options[idx] = new Option("Auto", 0, true, true);
 }else{
  document.wlanBasicSetup.chan.options[idx] = new Option("Auto", 0, false, false);
 }
 idx++;

 for (chan=start; chan<=end; chan++, idx++) {

  if (chan == defaultChan){
   document.wlanBasicSetup.chan.options[idx] = new Option(chan, chan, true, true);
  }else{
   document.wlanBasicSetup.chan.options[idx] = new Option(chan, chan, false, false);
  }
  document.wlanBasicSetup.chan.selectedIndex = defaultChan;
 }
 document.wlanBasicSetup.chan.length = idx;
}

function change_band2g(band_value)
{
	var current_value = document.getElementById('methodSel').value;
	jsRemoveItemFromSelect();
	var objSelect = document.getElementById('methodSel');

	if (band_value == 6)
	{
		objSelect.options.add(new Option("WPA2-PSK(AES)", 4));
		objSelect.options.add(new Option("WPA-PSK/WPA2-PSK AES", 6));
		document.getElementById('methodSel').value = current_value;
		
		if (current_value == 1 || current_value == 2)
		{
			document.getElementById('methodSel').value = 0;
			document.getElementById('optionforwep').style.display = 'none';
			document.getElementById('optionforwpa').style.display = 'none';		
		}
		
		checkState();
	}
	else
	{	
		if (objSelect.options.length == 1 || objSelect.options[1].value != 1)
		{ 	
			objSelect.options.add(new Option("WEP", 1));
			objSelect.options.add(new Option("WPA-PSK(TKIP)", 2));
			objSelect.options.add(new Option("WPA2-PSK(AES)", 4));
			objSelect.options.add(new Option("WPA-PSK/WPA2-PSK AES", 6));
		}
		document.getElementById('methodSel').value = current_value;
		checkState();
	}
}

function updateChan()
{
 var idx_value= document.wlanBasicSetup.band.selectedIndex;
 var band_value= document.wlanBasicSetup.band.options[idx_value].value;
     currentBand = 1;
	 
	 change_band2g(band_value);
	 
 if(band_value==9 || band_value==10 || band_value==7){
  updateChan_channebound();
 }
 else {
  if (lastBand != currentBand) {
     lastBand = currentBand;
     if (currentBand == 2)
    showChannel5G();
     else
    showChannel2G(0, band_value);
  }
  else {

   {
    showChannel2G(0, band_value);
   }
  }
 }
 lastMode = band_value;

 if (document.wlanBasicSetup.band.selectedIndex == 0||
  document.wlanBasicSetup.band.selectedIndex == 1||
  document.wlanBasicSetup.band.selectedIndex == 2){
   document.wlanBasicSetup.chanwid.selectedIndex = 0;
   disableTextField(document.wlanBasicSetup.chanwid);
 }
 else if (document.wlanBasicSetup.band.selectedIndex == 3||
  document.wlanBasicSetup.band.selectedIndex == 4||
  document.wlanBasicSetup.band.selectedIndex == 5){
   document.wlanBasicSetup.chanwid.selectedIndex = 1;
   enableTextField(document.wlanBasicSetup.chanwid);
 }

   updateTxRate();
}

function updateChan_channebound()
{
 var idx_value= document.wlanBasicSetup.band.selectedIndex;
 var band_value= document.wlanBasicSetup.band.options[idx_value].value;
 var bound = document.wlanBasicSetup.chanwid.selectedIndex;
 var adjust_chan;

 currentBand = 1;

 if(band_value==9 || band_value==10 || band_value ==7){
  if(bound ==0)
   adjust_chan=0;
  if(bound ==1)
   adjust_chan=1;
 }else
  adjust_chan=0;

   if (currentBand == 1)
  showChannel2G(adjust_chan, band_value);

   if(lastMode == 0)
    lastMode = band_value;

 updateTxRate();
}

function updateChanWidth()
{
   updateChan_channebound();
}

function updateRegChan()
{
 regDomain = regDomainList[document.wlanBasicSetup.domain.selectedIndex];
 updateChan();
}

function WepKeyChange()
{
 for (var i=1; i<=4; i++)
 {
  var radiogroup = document.wlanBasicSetup.defaultTxKeyId;
  var keyfiled = document.getElementById('show_key'+i);

  if(radiogroup[i-1].checked==true){
   enableTextField(keyfiled);
  }else{
   disableTextField(keyfiled);
  }
 }
}

function checkState()
{
 var obj_method = document.wlanBasicSetup.method;
 var key_value = obj_method.options[obj_method.selectedIndex].value;
 
 var idx_value= document.wlanBasicSetup.band.selectedIndex;
 var band_value= document.wlanBasicSetup.band.options[idx_value].value;
if (band_value == 6)
{
	document.getElementById('optionforwpa').style.display = (document.wlanBasicSetup.method.selectedIndex>=1)? '':'none';
}
else
{
	document.getElementById('optionforwep').style.display = (document.wlanBasicSetup.method.selectedIndex==1)? '':'none';
	document.getElementById('optionforwpa').style.display = (document.wlanBasicSetup.method.selectedIndex>=2)? '':'none';
}
  WepKeyChange();
 document.getElementById('wpainfo1').style.display = 'none';
 document.getElementById('wpainfo2').style.display = 'none';
 document.getElementById('wpainfo3').style.display = 'none';
 if(key_value == 2 || key_value==3)
  document.getElementById('wpainfo1').style.display="";
 else if(key_value==4 || key_value==5)
  document.getElementById('wpainfo2').style.display="";
 else if(key_value==6)
  document.getElementById('wpainfo3').style.display="";
}

function lengthClick()
{
 if (document.wlanBasicSetup.length.selectedIndex==0){

  var keysize = 10;

  for (var i=1; i<=4; i++)
  {
   document.getElementById('key'+i).size =keysize + 2 ;

   if (document.getElementById('key'+i).value.length>10)
    document.getElementById('key'+i).value = document.getElementById('key'+i).value.substring(0,10);

   document.getElementById('key'+i).maxLength=10;
  }
 }else if (document.wlanBasicSetup.length.selectedIndex==1){

  var keysize = 26;

  for (var i=1; i<=4; i++)
  {
   document.getElementById('key'+i).size =keysize + 8 ;

   if (document.getElementById('key'+i).value.length>26)
    document.getElementById('key'+i).value = document.getElementById('key'+i).value.substring(0,26);

   document.getElementById('key'+i).maxLength=26;
  }
 }

 updateFormat();
}

function updateFormat()
{
 if (document.wlanBasicSetup.length.selectedIndex == 0) {
  document.wlanBasicSetup.format.options[0].text = '<#wlan_basic_015#>';
  document.wlanBasicSetup.format.options[1].text = '<#wlan_basic_016#>';
 }
 else {
  document.wlanBasicSetup.format.options[0].text = '<#wlan_basic_017#>';
  document.wlanBasicSetup.format.options[1].text = '<#wlan_basic_018#>';
 }

 setDefaultKeyValue();
}

function setDefaultKeyValue()
{
 var idx = 0;

 if (document.wlanBasicSetup.length.selectedIndex == 0) {
  document.wlanBasicSetup.show_key1.maxLength = 10;
  document.wlanBasicSetup.show_key2.maxLength = 10;
  document.wlanBasicSetup.show_key3.maxLength = 10;
  document.wlanBasicSetup.show_key4.maxLength = 10;

  document.wlanBasicSetup.show_key1.value = wepkeys64_key1[idx];
  document.wlanBasicSetup.show_key2.value = wepkeys64_key2[idx];
  document.wlanBasicSetup.show_key3.value = wepkeys64_key3[idx];
  document.wlanBasicSetup.show_key4.value = wepkeys64_key4[idx];
 }
   else {
  document.wlanBasicSetup.show_key1.maxLength = 26;
  document.wlanBasicSetup.show_key2.maxLength = 26;
  document.wlanBasicSetup.show_key3.maxLength = 26;
  document.wlanBasicSetup.show_key4.maxLength = 26;

  document.wlanBasicSetup.show_key1.value = wepkeys128_key1[idx];
  document.wlanBasicSetup.show_key2.value = wepkeys128_key2[idx];
  document.wlanBasicSetup.show_key3.value = wepkeys128_key3[idx];
  document.wlanBasicSetup.show_key4.value = wepkeys128_key4[idx];
   }
}

function resetClick()
{
 document.getElementById('optionforwep').style.display = (document.wlanBasicSetup.method_cur.value==1)? '':'none';
 WepKeyChange();

 document.getElementById('optionforwpa').style.display = (document.wlanBasicSetup.method_cur.value>=2)? '':'none';

 document.getElementById('wpainfo1').style.display=(document.wlanBasicSetup.method_cur.value)==2? '':'none';
 document.getElementById('wpainfo2').style.display=(document.wlanBasicSetup.method_cur.value)==4? '':'none';
 document.getElementById('wpainfo3').style.display=(document.wlanBasicSetup.method_cur.value)==6? '':'none';
}

function jsRemoveItemFromSelect()
{
	for (var i = 6; i > 0 ; i--)
	{
		document.getElementById('methodSel').options[i] = null;
	}
}

function InitValue()
{
	var mssid_num = 1; //ssid num
	var PhyMode  = '<% getCfgZero(1, "WirelessMode"); %>'; 
	var APIsolated = '<% getCfgZero(1, "NoForwarding"); %>';
	var HiddenSSID  = '<% getCfgZero(1, "HideSSID"); %>';
	var channel_index  = '<% getWlanChannel(); %>';
	var countrycode = '<% getCfgGeneral(1, "CountryCode"); %>';
	var ht_bw = '<% getCfgZero(1, "HT_BW"); %>';
	var AutoChannel = '<% getCfgZero(1, "AutoChannelSelect"); %>';
	var Channel = '<% getCfgZero(1, "Channel"); %>';
	var connectStatus = "<% GetConnectStatus(); %>";
	
	var defaultkeyid = '<% getCfgZero(1, "DefaultKeyID"); %>';

	var authmode = '<% getCfgGeneral(1, "AuthMode"); %>';
	var encrytype = '<% getCfgGeneral(1, "EncrypType"); %>';
	//var pskvalue = '<% getCfgGeneral(1, "ENCODE_WPAPSK1"); %>';
	var pskvalue = '<% getWPAEncode2g(1, "WPAPSK1"); %>';

	var b = defaultkeyid.slice(0,1);
	var KeyType;
	var length;
	
	if ( pskvalue != '')
	{
		document.wlanBasicSetup.tmppskValue.value = Base64.Decode("<% getWPAEncode2g(1, "WPAPSK1"); %>");
	}
	
	var HiddenSSIDArray = HiddenSSID.split(";");
	for (i=0;i<mssid_num;i++)
	{
		if (HiddenSSIDArray[i] == "1")
			document.wlanBasicSetup.hiddenSSID.checked = false;
		else
			document.wlanBasicSetup.hiddenSSID.checked= true;
	}

	var APIsolatedArray = APIsolated.split(";");

	for (i=0;i<mssid_num;i++)
	{
	if (APIsolatedArray[i] == "1")
		document.wlanBasicSetup.block.checked = true;
	else
		document.wlanBasicSetup.block.checked = false;
	}

	document.wlanBasicSetup.band.value = PhyMode;

	if (AutoChannel == "1" || AutoChannel == "2")
	{
		defaultChan = 0;
	}
	else
	{
		defaultChan	= Channel;
	}

	updateChan();

	//document.wlanBasicSetup.chan.value = channel_index;
	document.wlanBasicSetup.chanwid.value = ht_bw;
	
	if (authmode == "OPEN")
	{
		document.wlanBasicSetup.method.value = 0;	
	}
	else if (authmode == "SHARED")
	{
		document.wlanBasicSetup.authType.value = 1;
		document.wlanBasicSetup.method.value = 1;	
	}
	else if (authmode == "WEPAUTO")
	{
		document.wlanBasicSetup.authType.value = 2;
		document.wlanBasicSetup.method.value = 1;	
	}
	else if (authmode == "WPAPSK")
	{
		document.wlanBasicSetup.method.value = 2;	
	}
	else if (authmode == "WPA2PSK")
	{
		document.wlanBasicSetup.method.value = 4;	
	}
	else if (authmode == "WPAPSKWPA2PSK")
	{
		document.wlanBasicSetup.method.value = 6;	
	}

		
	if (b == "1")
	{
		document.wlanBasicSetup.defaultTxKeyId[0].checked = true;
		if ('<% getCfgGeneral(1, "encode_Key1Str1"); %>' != '')
		{
			KeyType = Base64.Decode('<% getCfgGeneral(1, "encode_Key1Str1"); %>');
			document.wlanBasicSetup.show_key1.value = KeyType;
		}
		else
		{
			KeyType = '';
		}
	}	
	else if (b == "2")
	{
		document.wlanBasicSetup.defaultTxKeyId[1].checked = true;
		if ('<% getCfgGeneral(1, "encode_Key2Str1"); %>' != '')
		{
			KeyType = Base64.Decode('<% getCfgGeneral(1, "encode_Key2Str1"); %>');
			document.wlanBasicSetup.show_key2.value = KeyType;
		}
		else
		{
			KeyType = '';
		}
	}
	else if (b == "3")
	{
		document.wlanBasicSetup.defaultTxKeyId[2].checked = true;
		if ('<% getCfgGeneral(1, "encode_Key3Str1"); %>' != '')
		{
			KeyType = Base64.Decode('<% getCfgGeneral(1, "encode_Key3Str1"); %>');
			document.wlanBasicSetup.show_key3.value = KeyType;
		}
		else
		{
			KeyType = '';
		}
	}
	else if (b == "4")
	{
		document.wlanBasicSetup.defaultTxKeyId[3].checked = true;
		if ('<% getCfgGeneral(1, "encode_Key4Str1"); %>' != '')
		{
			KeyType = Base64.Decode('<% getCfgGeneral(1, "encode_Key4Str1"); %>');
			document.wlanBasicSetup.show_key4.value = KeyType;
		}
		else
		{
			KeyType = '';
		}
	}
	else
	{
		document.wlanBasicSetup.defaultTxKeyId[0].checked = true;
		KeyType = "";
	}
	if(KeyType.length == 13 || KeyType.length == 26)
		document.wlanBasicSetup.length.value = 2;
	else
		document.wlanBasicSetup.length.value = 1;

	updateIputState();
	if(connectStatus == '1')
	{
		document.wlanBasicSetup.chan.disabled = true;	
	}	
}

</SCRIPT>

</head>

<body onload="InitValue()">
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_126#>";
 SideItem="<#menu.ap_027#>";
 HelpItem="wlanbasic";
</script>

<script type='text/javascript'>
 mainTableStart();
 logo();
 TopNav();
 ThirdRowStart();
 Write_Item_Images();
 mainBodyStart();
</script>

<form action="/goform/form2WlanBasicSetup.cgi" method=POST name="wlanBasicSetup">
 <table id=box_header border=0 cellSpacing=0>
  <tr>
   <td class=topheader>
    <#wlan_basic_019#>
   </td>
  </tr>

  <tr>
   <td class=content>
    <p><#wlan_basic_020#></p>
   </td>
  </tr>
 </table>


 <table id=body_header border=0 cellSpacing=0 style="display:none">
  <tr>
   <td class=topheader><#wlan_basic_021#>
   </td>
  </tr>

  <tr>
   <td class=content>
    <table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>
     <tr>
     <td class=form_label_40><#wlan_basic_022#></td>
     <td><select size="1" name="domain" onChange="updateRegChan()">
<option value="0">??????</option>
<option value="1" selected>??????</option>
<option value="2">??????(??????)</option>
<option value="3">??????(??????)</option>
<option value="4">??????(??????)</option>
<option value="5">??????</option>
<option value="6">??????</option>
<option value="7">??????????????????</option>
<option value="8">?????????</option>
<option value="9">?????????</option>
<option value="10">????????????</option>
<option value="11">?????????</option>
<option value="12">?????????</option>
<option value="13">????????????</option>
<option value="14">????????????</option>
<option value="15">?????????</option>
<option value="16">?????????</option>
<option value="17">????????????</option>
<option value="18">??????</option>
<option value="19">????????????</option>
<option value="20">?????????</option>
<option value="21">????????????</option>
<option value="22">??????</option>
<option value="23">????????????</option>
<option value="24">???????????????</option>
<option value="25">????????????</option>
<option value="26">????????????</option>
<option value="27">??????</option>
<option value="28">??????</option>
<option value="29">?????????????????????</option>
<option value="30">????????????</option>
<option value="31">??????</option>
<option value="32">????????????</option>
<option value="33">????????????</option>
<option value="34">??????</option>
<option value="35">??????</option>
<option value="36">??????</option>
<option value="37">??????</option>
<option value="38">??????</option>
<option value="39">????????????</option>
<option value="40">??????</option>
<option value="41">????????????</option>
<option value="42">?????????</option>
<option value="43">??????</option>
<option value="44">??????</option>
<option value="45">???????????????</option>
<option value="46">?????????</option>
<option value="47">?????????</option>
<option value="48">?????????</option>
<option value="49">??????</option>
<option value="50">??????</option>
<option value="51">????????????</option>
<option value="52">???????????????</option>
<option value="53">?????????</option>
<option value="54">?????????</option>
<option value="55">????????????</option>
<option value="56">?????????</option>
<option value="57">?????????</option>
<option value="58">?????????</option>
<option value="59">???????????????</option>
<option value="60">??????</option>
<option value="61">????????????????????????</option>
<option value="62">?????????</option>
<option value="63">????????????</option>
<option value="64">????????????</option>
<option value="65">??????</option>
<option value="66">????????????</option>
<option value="67">?????????</option>
<option value="68">?????????</option>
<option value="69">??????</option>
<option value="70">?????????</option>
<option value="71">??????</option>
<option value="72">?????????</option>
<option value="73">????????????</option>
<option value="74">?????????</option>
<option value="75">???????????????</option>
<option value="76">????????????</option>
<option value="77">?????????</option>
<option value="78">????????????</option>
<option value="79">???????????????</option>
<option value="80">??????</option>
<option value="81">?????????</option>
<option value="82">??????</option>
<option value="83">??????</option>
<option value="84">????????????</option>
<option value="85">??????</option>
<option value="86">?????????</option>
<option value="87">?????????</option>
<option value="88">?????????</option>
<option value="89">????????????????????????</option>
<option value="90">??????</option>
<option value="91">?????????</option>
<option value="92">????????????</option>
<option value="93">??????</option>
         </select>
     </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>


 <table id=body_header border=0 cellSpacing=0>
  <tr>
   <td class=topheader><#wlan_basic_023#>
   </td>
  </tr>

  <tr>
   <td class=content>
    <table id="basicSetup" class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>
     <tr>
      <td class=form_label_40><#wlan_basic_024#></td>
      <td>
       <input type="checkbox" name="hiddenSSID" value="0" >
      </td>

     </tr>

     <tr>

      <td class=form_label_40><#wlan_basic_025#></td>

      <td>
       <input type="checkbox" name="block" value="1">
      </td>

     </tr>

     <tr>
      <td class=form_label_40><#wlan_basic_026#></td>
      <td>
       <input type=text name=ssid size="25" maxlength="32" value="<% getCfgToHTML(1, "SSID1"); %>" >
      </td>
     </tr>

     <tr>
     <td class=form_label_40><#wlan_basic_027#></td>
     <td><select size=1 name=band onChange="updateChan()">
		<option value="1">802.11b</option>
		<option value="4">802.11g</option>
		<option value="0">802.11b/g</option>
		<option value="6">802.11n</option>
		<option value="7">802.11n/g</option>
		<option value="9" selected>802.11b/g/n</option>
      </select>
     </td>
     </tr>

     <tr>
     <td class=form_label_40><#wlan_basic_028#></td>
     <td><select size="1" name="chan"> </select>
		 <b>&nbsp; &nbsp;<#wlan_basic_029#></b><% getStatusWlanChannel(); %>
     </td>
     </tr>

     <tr>
     <td class=form_label_40><#wlan_basic_030#></td>
     <td><select size="1" name="chanwid" onChange="updateChanWidth()">
		<option value="0">20M</option>
		<option value="1" selected>Auto 20/40M</option>
		</select>
     </td>
     </tr>

     <tr style="display:none">
     <td class=form_label_40><#wlan_basic_031#></td>
     <td><select size="1" name="txRate">
      </select>
     </td>
     </tr>

     <SCRIPT>
     	/*
		regDomain=3;
		defaultChan=0;
		updateChan();
		*/
     </SCRIPT>
    </table>
   </td>
  </tr>
 </table>

 <table id=body_header border=0 cellSpacing=0>

  <tr>
   <td class=topheader><#wlan_basic_032#>
   </td>
  </tr>

  <tr>
   <td class=content>
    <table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>

	<tr>
      <input type="hidden" name="method_cur" value="0" >
      <td class=form_label_40><#wlan_basic_033#>
      </td>
      <td><select size="1" id="methodSel" name="method" onChange="checkState()">
<option value="0" selected><#wlan_basic_034#></option>
<option value="1">WEP</option>
<option value="2">WPA-PSK(TKIP)</option>
<option value="3">WPA-PSK(AES)</option>
<option value="4">WPA2-PSK(AES)</option>
<option value="5">WPA2-PSK(TKIP)</option>
<option value="6">WPA-PSK/WPA2-PSK AES</option>
       </select>
      </td>
     </tr>

    </table>

   </td>

  </tr>

 </table>

 <div id="optionforwep" style="display:none">

 <table id=body_header border=0 cellSpacing=0>

  <tr>

   <td class=topheader><#wlan_basic_035#></td>

  </tr>

  <tr>

   <td class=content align=center>

    <table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>

     <tr>

      <td class=form_label_40><#wlan_basic_036#></td>

      <td>

       <select size="1" name="authType">

        
        <option value=2 ><#wlan_basic_037#></option>

        <option value=1 ><#wlan_basic_038#></option>

       </select>

      </td>

     </tr>

     <tr>

      <td class=form_label_40><#wlan_basic_039#></td>

      <td><select size="1" name="length" ONCHANGE=lengthClick()>

       <option value=1><#wlan_basic_040#></option>

       <option value=2><#wlan_basic_041#></option>

       </select>

      </td>

     </tr>

     <tr style="display:none">

      <td class=form_label_40><#wlan_basic_042#></td>

      <td><select size="1" name="format" ONCHANGE=setDefaultKeyValue()>

       <option value=1>ASCII</option>

       <option value=0><#wlan_basic_043#></option>

       </select>

      </td>

     </tr>

    </table>

   </td>

  </tr>

 </table>

 <table id=body_header border=0 cellSpacing=0>

  <tr>

   <td class=topheader><#wlan_basic_044#></td>

  </tr>

  <tr>

   <td class=content align=center>

    <table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>

     <tr>

      <td class=form_label_40><#wlan_basic_045#></td>

      <td>

       <input type="radio" name="defaultTxKeyId" value="1" onclick="WepKeyChange();">

       <input type="text" name="show_key1" id="show_key1" size="26" value="">
	   <input type="hidden" name="key1" id="key1" size="26" value="">

      </td>

     </tr>

     <tr>

      <td class=form_label_40><#wlan_basic_046#></td>

      <td>

       <input type="radio" name="defaultTxKeyId" value="2" onclick="WepKeyChange();">

       <input type="text" name="show_key2" id="show_key2" size="26" value="">
	   <input type="hidden" name="key2" id="key2" size="26" value="">

      </td>

     </tr>

     <tr>

      <td class=form_label_40><#wlan_basic_047#></td>

      <td>

       <input type="radio" name="defaultTxKeyId" value="3" onclick="WepKeyChange();">

       <input type="text" name="show_key3" id="show_key3" size="26" value="" >
	   <input type="hidden" name="key3" id="key3" size="26" value="">

      </td>

     </tr>

     <tr>

      <td class=form_label_40><#wlan_basic_048#></td>

      <td>

       <input type="radio" name="defaultTxKeyId" value="4" onclick="WepKeyChange();">

       <input type="text" name="show_key4" id="show_key4" size="26" value="" >
	   <input type="hidden" name="key4" id="key4" size="26" value="" >

      </td>

     </tr>

    </table>

   </td>

  </tr>

 </table>

 </div>

 <div id="optionforwpa" style="display:none">

 <table id=body_header border=0 cellSpacing=0>

  <tr>

   <td class=topheader id="wpainfo1" name = "wpainfo1" style="display:none"><#wlan_basic_049#>

   </td>

   <td class=topheader id="wpainfo2" name = "wpainfo2" style="display:none"><#wlan_basic_050#>

   </td>

   <td class=topheader id="wpainfo3" name = "wpainfo3" style="display:none"><#wlan_basic_051#>

   </td>

  </tr>

  <tr>

   <td class=content align=center>

    <table class=formarea border="0" cellpadding="0" cellspacing="0" width=100%>

     <tr style="display:none">

      <td class=form_label_40><#wlan_basic_052#></td>

      <td><select size="1" name="pskFormat">

       <option value=0 ><#wlan_basic_053#></option>

       <option value=1 ><#wlan_basic_054#></option>

       </select>

             </td>

     </tr>

     <tr id=tr_psk style="">

      <td class=form_label_40><#wlan_basic_055#></td>

      <td>

       <input type="text" name="tmppskValue" size="32" maxlength="64"><#wlan_basic_056#>
      </td>

     </tr>

    </table>

   </td>

  </tr>

 </table>

 </div>

 <p align=center>
<input type="hidden" name="pskValue" size="32" maxlength="64">
<INPUT TYPE="HIDDEN" NAME="checkWPS2" VALUE="<% getCfgZero(1, "WscModeOption"); %>">
 <input type="submit" value="<#wlan_basic_057#>" name="save" onClick="return saveChanges()">&nbsp;&nbsp;

 <input type="reset" value="<#wlan_basic_058#>" name="reset" onClick="resetClick()">

 </p>

 <input type="hidden" name="basicrates" value=0>

 <input type="hidden" name="operrates" value=0>

 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >

 </form>

<script type='text/javascript'>

 mainBodyEnd();
 ThirdRowEnd();
 Footer()
 mainTableEnd()
</script>

<script type='text/javascript'>

</script>

</blockquote>

</body>

</html>



