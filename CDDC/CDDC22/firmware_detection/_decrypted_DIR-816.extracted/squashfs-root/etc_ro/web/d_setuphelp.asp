if (HelpItem=='wizard'){
	if(!(("<% getCfgZero(1,"ApCliEnable");%>"==1)||("<% getCfg2Zero(1,"ApCliEnable");%>"==1))){
		document.getElementById('helpLabel').innerHTML = <#setuphelp_000#>;
	}else{
		document.getElementById('helpLabel').innerHTML = <#setuphelp_009#>;
	}
}else if (HelpItem=='lancfg'){
  document.getElementById('helpLabel').innerHTML = <#setuphelp_001#>;

}else if (HelpItem=='dhcpcfg'){
  document.getElementById('helpLabel').innerHTML = <#setuphelp_002#>;

}else if (HelpItem=='dhcpipcfg'){
  document.getElementById('helpLabel').innerHTML = <#setuphelp_003#>;

}else if (HelpItem=='wanif'){
  document.getElementById('helpLabel').innerHTML = <#setuphelp_002#>;

}else if (HelpItem=='pptp'){
  document.getElementById('helpLabel').innerHTML = <#setuphelp_007#>;
  
}else if (HelpItem=='l2tp'){
  document.getElementById('helpLabel').innerHTML = <#setuphelp_008#>;
  
}else if (HelpItem=='wancfghelp2'){
  document.getElementById('helpLabel').innerHTML = '';

}else if (HelpItem=='IPV6Set'){
  document.getElementById('helpLabel').innerHTML = '';

}





