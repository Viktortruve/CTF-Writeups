<html><head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="d_stylemain.css">
<script type="text/javascript" src="d_util.js"></script>
<script type="text/javascript" src="d_share.js"></script>
<script type="text/javascript" src="d_menu.js"></script>
<script type="text/javascript" src="js/forbidView.js"></script>
<title><#url_nokeyword_000#></title>

<script>

function checkUrlKeywordChar(str)
{
 var patrn=/^[a-zA-Z0-9-.]+$/;
 if (!patrn.exec(str)) return false ;
 return true;
}

function initValue()
{
	var urlFilterEn = "<% getCfgGeneral(1, "urlFilterEnable"); %>";
	if(urlFilterEn == "1") {
		document.urlEn.urlcap[1].checked = true;   // 启用
	} else {
	  document.urlEn.urlcap[0].checked = true;	 // 禁用
	}
}

function urlEnClick()
{
	if(document.urlEn.urlcap[0].checked == true) {
		document.urlEn.urlcap.value = 0;   	// 禁用
	} else {
		document.urlEn.urlcap.value = 1;		// 启用
	}
	document.urlEn.submit();
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

function addClick()
{
	if(!checkUrlKeywordChar(document.websURLFilter.urlAdd.value))
	{
		alert("<#url_nokeyword_001#>");
		document.websURLFilter.urlAdd.focus();
		return false;
	}
	var y = document.websURLFilter.urlAdd.value;
	document.websURLFilter.urlAdd.value = y.toLowerCase();
	if(urlFilterStr.length)
	{
		entries = urlFilterStr.split(";");
		for(i = 0; i < entries.length; i++)
		{
			if(entries[i] == document.websURLFilter.urlAdd.value)
			{
				alert("<#url_nokeyword_002#>");
				return false;
			}
		}
	}
	//document.websURLFilter.submit();
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}


function delClick()
{
	var i;
	var entries = new Array();
	
	if(urlFilterStr.length)
	{
		var flg = 0;
		entries = urlFilterStr.split(";");
		
		if ( entries.length > 1)
		{
			for(i = 0; i < entries.length; i++)
			{
				if (document.websURLFilter.keyword[i].checked)
				{
					flg = 1;
				}
			}
		}
		else
		{
			if (document.websURLFilter.keyword.checked)
				{
					flg = 1;
				}
		}
		
		if(flg == 1)
		{
			if (!confirm('<#url_nokeyword_018#>'))
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
		else
		{
			alert("<#url_nokeyword_003#>");
			return false;
		}

	}
	else
	{
		alert("<#url_nokeyword_017#>");
		return false;
	}
	create_backmask();
	document.getElementById("loading").style.display="";
	return true;
}

</script>
<link href="d_stylemain.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="initValue()">
<blockquote>
<script language="JavaScript">
 TabHeader="<#menu.ap_127#>";
 SideItem="<#menu.ap_087#>";
 HelpItem="Url";
</script>
<script type='text/javascript'>
 var urlFilterStr = "<% getCfgGeneral(1, "websURLFilters"); %>";
 mainTableStart();
 logo();
 TopNav();
 ThirdRowStart();
 Write_Item_Images();
 mainBodyStart();
</script>
<table id="box_header" border=0 cellSpacing=0>
 <tr>
  <td class="topheader"><#url_nokeyword_000#></td>
 </tr>
 <tr>
  <td class="content">
   <p><#url_nokeyword_004#></p>
  </td>
 </tr>
</table>
<form action="/goform/form2urlEn.cgi" method="POST" name="urlEn">
	<table id="body_header" border="0" cellSpacing="0">
	 <tr>
	  <td class="topheader"><#url_nokeyword_005#></td>
	 </tr>
	 <tr>
	  <td class="content" align="left">
	   <table class="formarea" border="0" cellpadding="0" cellspacing="0" width="500">
	    <tr>
	     <td class="form_label_left"><#url_nokeyword_006#></td>
	     <td class="form_label_right">
	     		<input type="radio" value="0" name="urlcap"><#url_nokeyword_007#>&nbsp;&nbsp;
	     		<input type="radio" value="1" name="urlcap"><#url_nokeyword_008#>
	     </td>
	    </tr>
	   </table>
	  </td>
	 </tr>
	</table>
	<br>
	<p align=center>
		<input type="submit" value="<#url_nokeyword_009#>" onClick="return urlEnClick()">&nbsp;&nbsp;
		<input type="hidden" name="tokenid" id="tokenid0" value="" >
	</p>
</form>
<br>
<form action="/goform/websURLFilterAddDel" method="POST" name="websURLFilter">
	<table id="body_header" border="0" cellspacing="0">
		<tr>
	  	<td class="topheader"><#url_nokeyword_010#></td>
		</tr>
		<tr>
	  	<td class="content" align="left">
		   	<table class="formarea" border="0" cellpadding="0" cellspacing="0">
					<tr>
		     		<td class="form_label_left"><#url_nokeyword_011#></td>
		     		<td class="form_label_right">
		      		<input type="text" name="urlAdd" size="32" maxlength="32">
		     		</td>
		    	</tr>
		   </table>
		   <br>
		   <p align=center>
		   	<input type="submit" value="<#url_nokeyword_012#>" name="addFQDN" onClick="return addClick()">&nbsp;&nbsp;
		   	<input type="submit" value="<#url_nokeyword_013#>" name="delFQDN" onClick="return delClick()">&nbsp;&nbsp;
		   </p>
		   <br>
		   <font size="2"><b><#url_nokeyword_014#></b></font><br>
			 <table class="formlisting" border="0" cellpadding="0" cellspacing="0" width="500">
				<tr class="form_label_row">
					<td class="form_label_col"><#url_nokeyword_015#> </td>
					<td class="form_label_col"><#url_nokeyword_016#></td>
				</tr>
				<script language="JavaScript" type="text/javascript">
					var i;
					var entries = new Array();
					if(urlFilterStr.length)
					{
						entries = urlFilterStr.split(";");
						for(i = 0; i < entries.length; i++)
						{
							document.write("<tr>")
							document.write("<td align=center width='5%' bgcolor='#C0C0C0'><input type='radio' name='keyword' value='"+i+"'></td>")
							document.write("<td align=center width='35%' bgcolor='#C0C0C0'><font size='2'><b>"+entries[i]+"</b></font></td>")
							document.write("</tr>")
					  }
				  }
				</script>
					<input type="hidden" value="" name="urllistdelnum">
					<input type="hidden" name="tokenid" id="tokenid1" value="" >
			 </table>
	    </td>
	  </tr>
	</table>
	<script>
    var tokenid = "<% getTokenidToRamConfig(); %>";
	console.log("[d_url_nokeyword] tokenid ="+tokenid);
	
	for(var i=0;i<2;i++)
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

