if (HelpItem=='Acl'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_000#>;
} else if (HelpItem=='PortTriggering'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_001#>;
} else if (HelpItem=='Dmz'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_002#>;
} else if (HelpItem=='Url'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_003#>;
} else if (HelpItem=='Filtering'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'You can prevent certain local IP accessing Internet with IP port filter and block accessing to certain Internet services. <br><br>' +
					'<a href="d_helpadv.asp#IPFiltering">More...</a>';
} else if (HelpItem=='Ddns'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_006#>;
} else if (HelpItem=='Netsniper'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'You can configure the Net Snipper which allows multiple computers to share the network through this router. <br><br>' +
					'<a href="d_helpadv.asp#Netsniper">More...</a>';
} else if (HelpItem=='Igmp'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_007#>;
} else if (HelpItem=='Qos_tc'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_008#>;
} else if (HelpItem=='Upnp'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_009#>;
} else if (HelpItem=='Telnet'){
  document.getElementById('helpLabel').innerHTML = '<b>Helpful Hints...</b> <br><br> ' +
					'You can configure Telent on this page. It will run in the background if enabled.<br><br>' +
					'<a href="d_helpadv.asp#Telnet">More...</a>';
}else if (HelpItem=='Routing'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_010#>;
} else if (HelpItem=='Virtual'){
  document.getElementById('helpLabel').innerHTML = <#advhelp_011#>;
}
