<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="d_stylemain.css">
<title>
 Wireless Router
</title>
<script type="text/javascript">
var ModemVer="<% getCfgGeneral(1, "ProductModemVersion"); %>";
var HardwareVer="<% getCfgGeneral(1, "HardwareVersion"); %>";
var FirmwareVer="<% getCfgGeneral(1, "FirmwareVersion"); %>";

function uipostGoIndex()
{
	var lanip = '<% getCfgZero(1, "lan_ipaddr"); %>';
	document.location.href = "http://" + lanip + "/index.asp"
}
</script>
</head>
<body >
<div class="login">
<table class="productInfo" border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
  <td align="left" height="30" bgcolor="#404343" colspan="1">&nbsp;&nbsp;&nbsp;&nbsp;<#product_info_002#>
<script>
  document.write(ModemVer);
</script>
  </td>
  <td align="right" height="30" bgcolor="#404343" colspan="2"><#product_info_000#>
<script>
  document.write(HardwareVer);
</script>
&nbsp;&nbsp;&nbsp;&nbsp;<#product_info_001#>
<script>
  document.write(FirmwareVer);
</script>
  &nbsp;&nbsp;&nbsp;&nbsp;
  </td>
 </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
  <td align="left"><a href="http://www.dlink.com.tw/" target="_blank"><img src="../images/head_01.gif" border="0"></a></td>
  <td background="../images/head_02.gif" width="600"></td>
  <td align="right"><img src="../images/head_03.gif"></td>
 </tr>
</table>
<table class="login_box">


  	<tbody>

	<tr>
		<td class="letterBg">&nbsp;</td>
	</tr>

	<tr>
		<td height="240">

			<table>
				<tbody>
					<tr>
						<td width="250" nowrap="" class="lable"><#version_000#></td>
						<td nowrap="" class="lable" id="extemal_version"><% getCfgGeneral(1, "ExternelVersion"); %>
						</td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_001#></td>
						<td nowrap="" class="lable" id="intemal_version"><% getCfgGeneral(1, "InternelVersion"); %>
						</td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_002#></td>
						<td nowrap="" class="lable" id="Kernel_Version"><% getCfgGeneral(1, "KernelVersion"); %>
						</td>

					</tr>

					<tr>

						<td width="250" nowrap="" class="lable"><#version_003#></td>
						<td nowrap="" class="lable" id="input_date">Thu Sep 20 12:00:18 CST 2018
						</td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_004#></td>
						<td nowrap="" class="lable" id="input_checksum"><% getCfgGeneral(1, "CheckSum"); %>
						</td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_005#></td>
						<td nowrap="" class="lable" id="lan_mac"> <% getLanMac(); %></td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_006#></td>
						<td nowrap="" class="lable" id="wan_mac"> <% getWanMac(); %></td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_007#></td>
						<td nowrap="" class="lable" id="wlan_mac"> <% getWlanCurrentMac(); %></td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_008#></td>
						<td nowrap="" class="lable" id="5g_wlan_mac"> <% getInicCurrentMac(); %></td>
					</tr>
									
					<tr>
						<td width="250" nowrap="" class="lable"><#version_009#></td>
						<td nowrap="" class="lable" id="wlan0_ssid"> <% getCfgGeneral(1, "SSID1"); %>
						</td>
					</tr>

					<tr>
						<td width="250" nowrap="" class="lable"><#version_010#></td>
						<td nowrap="" class="lable" id="5g_wlan0_ssid"> <% getCfg2ToHTML(1, "SSID1"); %>
						</td>
					</tr>
					
					<tr>
						<td width="250" nowrap="" class="lable"><#version_011#></td>
						<td nowrap="" class="lable" id="wlan_domain"><% getCfg2ToHTML(1, "CountryCode"); %>
						</td>
					</tr>

				</tbody>

			</table>

		</td>

	</tr>

	<tr>

		<td>

			<table>

				<tbody>

					<tr>

						<td>

							<input type="button" name="submit" value="<#version_012#>" onclick="uipostGoIndex()" id="uipostSubmit">

						</td>

					</tr>

				</tbody>

			</table>

		</td>

	</tr>


	</tbody>

</table>

<div class="loginBottom">
</div>
<div class="copywright">
<#product_info_003#>
</div>
</div>
</body>
</html>

