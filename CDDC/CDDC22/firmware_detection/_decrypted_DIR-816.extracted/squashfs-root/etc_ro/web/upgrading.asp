<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<title><#GOLDWEB#></title>
<link href="css/styleweb.css" rel="stylesheet" type="text/css">
<style type="text/css">

.ProgBar { border:1px solid black; width:353px; height:20px; background:#F1F1F1; }
#RealStatus { background:#F56D23; height:20px; float:left;}
.mainFramWidth {max-width:100%; min-width:5%}
.text { font-family:Arial,Helvetica,Geneva,Swiss,SunSans-Regular,sans-serif;
		font-size:18px;
		font-weight:bold;
		color:#F56D23;}

</style>
<script language="JavaScript" type="text/javascript">
var G_LanIP = '<% getCfgGeneral(1, "lan_ipaddr"); %>';
function uiOnload(){
	/*语言替换完后再显示页面*/
	document.body.style.visibility = 'visible';
	/*进度条*/
	uiProgress() ;
}

/*在第n次刷新后进行重定向*/
var times = 0;
var ajax = null;

/* 总时间 = interval x times; */
var interval = 1000;
var total_tm = 127; /*进度条总时间, 单位/秒*/
var rf_time  = Math.round(total_tm/(interval/1000));/*刷新次数*/
//重定向
function DoLogin(){ 
	window.location = "/";
}
//进度条循环次数
var circle_num = 0;
//进度条像素记录
var _percent = 0;
/*进度条函数*/
function SetProgress(){
	var status_bar = document.getElementById('RealStatus');
	/*实时更新进度条*/
	if( _percent >= 353 ) _percent = 353;
	status_bar.style.width = _percent + 'px';

}

var _random; /*随机种子*/
var _random_temp;
/*这个基数决定进度的快慢*/
var _speed = Math.round(50/(total_tm/60));
function uiProgress(){
	_random = Math.random();
	_random_temp = Math.round(_random * _speed) 
	/*在第n次刷新后进行重定向*/
	if(times > rf_time){
				
				//checkOnline();
				update();
	}
	else
	{
		/*更新百分比*/
		document.getElementById('SPAN_TimeNum').innerHTML = total_tm + '<#upgrading_001#>';
		if( _percent <= 353)
		{
			_percent = Math.round(353/127 * (127 - total_tm));
		}	
		SetProgress(); /*随机数*/
		total_tm -= interval/1000;
	}
	
	
	setTimeout("uiProgress()", interval);
	times++;
}

function refresh_all()
{	
  top.location.href = "http://" + G_LanIP; 
} 
function update()
{ 
  self.setTimeout("refresh_all()", "1");
}

</script>
</head>
<body onLoad="uiOnload()" style="visibility:;">

 <table border="0" cellpadding="3" cellspacing="0" class="mainFramWidth" align="center" style="margin-top:100px;">

		<tr>
		    <td class="fontsize" style="color:#FFFFFF;FONT-SIZE:19px;font-weight:700" align="center">
			  <span><#upgrading_000#></span>
			  <span id="lang_rebooting" class="text"></span><span id="P_Note" class="text"><span id="lang_pleasewait" class="text"></span><span id="SPAN_TimeNum" class="text"></span><span id="lang_seconds" class="text"></span></span></td>
			</td>
		</tr>
		<br>
		<tr>
			<td align="center" nowrap="" colspan="2"><div class="ProgBar"><div id="RealStatus"></div></div></td>
		</tr>

	</tr>
	</tr>
 </table>
	<!-- form -->
	<form id="uiPostForm" method="post" action="webproc">
	 <input type="hidden" name="tokenid"  value="<% getTokenidToRamConfig(); %>" >
	</form>
</body>

</html>
