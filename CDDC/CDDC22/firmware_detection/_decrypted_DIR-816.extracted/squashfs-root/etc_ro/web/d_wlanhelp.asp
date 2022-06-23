if (HelpItem=='wlbasic'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br>' +
					'Modify<b><font color="rgb(108,169,213)">Name(SSID)</font></b> ' +
					'是保护您的网络的第一步. ' +
					'修改成您熟悉的名字但注意不要包含任何个人信息.<br><br>' +
					'选择自动信道模式可以使您的路由器选择最好的无线信道.<br><br>' +
					'<a href="d_helpwlan.asp#WlanBasic">More...</a>';

}else if (HelpItem=='wlsecurity'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br>' +
					'如果您设置了无线安全,请确保记录下您设置的 ' +
					'<b><font color="rgb(108,169,213)">加密密钥</font></b> ' +
					'您需要在无线客户端输入密钥信息. <br><br>' +
					'<a href="d_helpwlan.asp#WlanSecu">More...</a>';

}else if (HelpItem=='wladvanced'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'By default these options need not be changed for this router to operate with Wireless.<br> ' +
					'<a href="d_helpwlan.asp#AdvWlan">More...</a>';
} else if (HelpItem=='Ctrl'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'此页面配置无线接入的白名单或黑名单。<br><br>' +
					'<a href="d_helpwlan.asp#WlanActrl">More...</a>';
} else if (HelpItem=='Wps'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'This page helps you to setup wps<br><br>' +
					'<a href="d_helpwlan.asp#WPS">More...</a>';
} else if (HelpItem=='Mbssid'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'本页面用来配置虚拟AP。在这里您可以启用/禁用虚拟AP，以及设置SSID、认证类型等。<br><br>' +
					'<a href="d_helpwlan.asp#MBSSID">More...</a>';
} else if (HelpItem=='Wds'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'无线分布的系统通过无线介质与其他AP相联系，作用类似以太网。'+
					'您必须确保每个WDS设备使用相同的加密算法和密钥。<br><br>' +
					'<a href="d_helpwlan.asp#WDS">More...</a>';
}else if (HelpItem=='wlanbasic'){
  var tips= <#wlanhelp_013#>;
  document.getElementById('helpLabel').innerHTML = <#wlanhelp_007#>; 
} else if (HelpItem=='wlanguest'){
  var tips='<br><strong>Helpful Hints...</strong><p><br><b>网络方案 </b></p><p>此表格是您所创建的访客网络的简短摘要，您最多可同时创建4个访客网络。它提供了此4个访客网络的编号、SSID、加密类型、访客网络是否启用、SSID是否广播等信息。选中每一方案的单选按钮可查看详细信息或更改其设置。</p><p><b>无线设置-方案</b></p><p>启用访客网络 </p><p>一旦选中该复选框，访客网络将被启用。您与来访者都能通过访客网络的SSID连接到网络。</p>';
  document.getElementById('helpLabel').innerHTML = tips+'<br><br>' +
					'<a href="d_helpwlan.asp#MBSSID">More...</a>';					
}else if (HelpItem=='wlwps'){
  var tips= <#wlanhelp_015#>;
  document.getElementById('helpLabel').innerHTML = <#wlanhelp_009#>;					
} else if (HelpItem=='wladv'){
  var tips=<#wlanhelp_003#>;
  document.getElementById('helpLabel').innerHTML = <#wlanhelp_010#>;					
}else if (HelpItem=='wlrepeater'){
  var tips= <#wlanhelp_017#>;
  document.getElementById('helpLabel').innerHTML = <#wlanhelp_011#>;					
}else if (HelpItem=='wlctrl'){
  var tips='<br><strong>Helpful Hints...</strong><br><br><p>By default, the configuration is correct wireless card can access to the user\'s wireless network. </p>';
  document.getElementById('helpLabel').innerHTML = tips+'<br><br>' +
					'<a href="d_helpwlan.asp#wladv">More...</a>';					
}




