#!/bin/sh
#
# $Id: //WIFI_SOC/release/SDK_4_1_0_0/source/user/rt2880_app/scripts/internet.sh#3 $
#
# usage: internet.sh
#

. /sbin/config.sh
. /sbin/global.sh

#lan_ip=`nvram_get 2860 lan_ipaddr`
#stp_en=`nvram_get 2860 stpEnabled`
#nat_en=`nvram_get 2860 natEnabled`
radio_off1=`nvram_get 2860 RadioOff`

enadle_ssid1_2860=`nvram_get 2860 ssidenable1`
enadle_ssid1_rtdev=`nvram_get rtdev ssidenable1`
apcli_2860=`nvram_get 2860 ApCliEnable`
apcli_rtdev=`nvram_get rtdev ApCliEnable`

cli_mode=`nvram_get 2860 CliMode`
echo "Internet cli_mode=$cli_mode"
if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
	radio_off2=`nvram_get rtdev RadioOff`
fi
#wifi_off=`nvram_get 2860 WiFiOff`
#ra_Bssidnum=`nvram_get 2860 BssidNum`
#if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
#	rai_Bssidnum=`nvram_get rtdev BssidNum`
#fi

genDevNode()
{
#Linux2.6 uses udev instead of devfs, we have to create static dev node by myself.
if [ "$CONFIG_HOTPLUG" == "y" -a "$CONFIG_USB" == "y" -o "$CONFIG_MMC" == "y" ]; then
	mounted=`mount | grep mdev | wc -l`
	if [ $mounted -eq 0 ]; then
	mount -t ramfs mdev /dev
	mkdir /dev/pts
	mount -t devpts devpts /dev/pts

        mknod   /dev/video0      c       81      0
		mknod	/dev/ppp	     c	     108	 0   $cons
        mknod   /dev/spiS0       c       217     0
        mknod   /dev/i2cM0       c       218     0
        mknod   /dev/flash0      c       200     0
        mknod   /dev/swnat0      c       210     0
        mknod   /dev/hwnat0      c       220     0
        mknod   /dev/acl0        c       230     0
        mknod   /dev/ac0         c       240     0
        mknod   /dev/mtr0        c       250     0
        mknod   /dev/nvram       c       251     0
        mknod   /dev/gpio        c       252     0
        mknod   /dev/rdm0        c       253     0
        mknod   /dev/pcm0        c       233     0
        mknod   /dev/i2s0        c       234     0	
        mknod   /dev/cls0        c       235     0
	
	fi
	echo "# <device regex> <uid>:<gid> <octal permissions> [<@|$|*> <command>]" > /etc/mdev.conf
        echo "# The special characters have the meaning:" >> /etc/mdev.conf
        echo "# @ Run after creating the device." >> /etc/mdev.conf
        echo "# $ Run before removing the device." >> /etc/mdev.conf
        echo "# * Run both after creating and before removing the device." >> /etc/mdev.conf
        echo "sd[a-z][1-9] 0:0 0660 */sbin/automount_boot.sh \$MDEV" >> /etc/mdev.conf
        echo "sd[a-z] 0:0 0660 */sbin/automount_boot.sh \$MDEV" >> /etc/mdev.conf
	echo "mmcblk[0-9]p[0-9] 0:0 0660 */sbin/automount_boot.sh \$MDEV" >> /etc/mdev.conf
	echo "mmcblk[0-9] 0:0 0660 */sbin/automount_boot.sh \$MDEV" >> /etc/mdev.conf
	if [ "$CONFIG_USB_SERIAL" = "y" ] || [ "$CONFIG_USB_SERIAL" = "m" ]; then
		echo "ttyUSB0 0:0 0660 @/sbin/autoconn3G.sh connect" >> /etc/mdev.conf
	fi
	if [ "$CONFIG_BLK_DEV_SR" = "y" ] || [ "$CONFIG_BLK_DEV_SR" = "m" ]; then
		echo "sr0 0:0 0660 @/sbin/autoconn3G.sh connect" >> /etc/mdev.conf
	fi
	if [ "$CONFIG_USB_SERIAL_HSO" = "y" ] || [ "$CONFIG_USB_SERIAL_HSO" = "m" ]; then
		echo "ttyHS0 0:0 0660 @/sbin/autoconn3G.sh connect" >> /etc/mdev.conf
	fi
fi
}

setMDEV()
{
#Linux2.6 uses udev instead of devfs, we have to create static dev node by myself.
if [ "$CONFIG_HOTPLUG" == "y" -a "$CONFIG_USB" == "y" -o "$CONFIG_MMC" == "y" ]; then
	echo "# <device regex> <uid>:<gid> <octal permissions> [<@|$|*> <command>]" > /etc/mdev.conf
        echo "# The special characters have the meaning:" >> /etc/mdev.conf
        echo "# @ Run after creating the device." >> /etc/mdev.conf
        echo "# $ Run before removing the device." >> /etc/mdev.conf
        echo "# * Run both after creating and before removing the device." >> /etc/mdev.conf
        echo "sd[a-z][1-9] 0:0 0660 */sbin/automount.sh \$MDEV" >> /etc/mdev.conf
        echo "sd[a-z] 0:0 0660 */sbin/automount.sh \$MDEV" >> /etc/mdev.conf
	echo "mmcblk[0-9]p[0-9] 0:0 0660 */sbin/automount.sh \$MDEV" >> /etc/mdev.conf
	echo "mmcblk[0-9] 0:0 0660 */sbin/automount.sh \$MDEV" >> /etc/mdev.conf
	if [ "$CONFIG_USB_SERIAL" = "y" ] || [ "$CONFIG_USB_SERIAL" = "m" ]; then
		echo "ttyUSB0 0:0 0660 @/sbin/autoconn3G.sh connect" >> /etc/mdev.conf
	fi
	if [ "$CONFIG_BLK_DEV_SR" = "y" ] || [ "$CONFIG_BLK_DEV_SR" = "m" ]; then
		echo "sr0 0:0 0660 @/sbin/autoconn3G.sh connect" >> /etc/mdev.conf
	fi
	if [ "$CONFIG_USB_SERIAL_HSO" = "y" ] || [ "$CONFIG_USB_SERIAL_HSO" = "m" ]; then
		echo "ttyHS0 0:0 0660 @/sbin/autoconn3G.sh connect" >> /etc/mdev.conf
	fi

        #enable usb hot-plug feature
        echo "/sbin/mdev" > /proc/sys/kernel/hotplug
fi
}

set_vlan_map()
{
	# vlan priority tag => skb->priority mapping
	vconfig set_ingress_map $1 0 0
	vconfig set_ingress_map $1 1 1
	vconfig set_ingress_map $1 2 2
	vconfig set_ingress_map $1 3 3
	vconfig set_ingress_map $1 4 4
	vconfig set_ingress_map $1 5 5
	vconfig set_ingress_map $1 6 6
	vconfig set_ingress_map $1 7 7

	# skb->priority => vlan priority tag mapping
	vconfig set_egress_map $1 0 0
	vconfig set_egress_map $1 1 1
	vconfig set_egress_map $1 2 2
	vconfig set_egress_map $1 3 3
	vconfig set_egress_map $1 4 4
	vconfig set_egress_map $1 5 5
	vconfig set_egress_map $1 6 6
	vconfig set_egress_map $1 7 7
}

ifRaxWdsxDown()
{
	ifconfig apcli0 down 1>/dev/null 2>&1
	ifconfig mesh0 down 1>/dev/null 2>&1
	ifconfig wds0 down 1>/dev/null 2>&1
	ifconfig wds1 down 1>/dev/null 2>&1

	iwpriv ra0 set RadioOn=1 1>/dev/null 2>&1
	ifconfig ra0 down 1>/dev/null 2>&1
	ifconfig ra1 down 1>/dev/null 2>&1

	echo -e "\n##### disable 1st wireless interface #####"
}

ifRaixWdsxDown()
{
	ifconfig apclii0 down 1>/dev/null 2>&1
	ifconfig meshi0 down 1>/dev/null 2>&1
	ifconfig wdsi0 down 1>/dev/null 2>&1
	ifconfig wdsi1 down 1>/dev/null 2>&1
	
	iwpriv rai0 set RadioOn=1 1>/dev/null 2>&1
	ifconfig rai0 down 1>/dev/null 2>&1
	ifconfig rai1 down 1>/dev/null 2>&1

	echo -e "\n##### disable 2nd wireless interface #####"
}

addBr0()
{
	brctl addbr br0

	# configure stp forward delay
	if [ "$wan_if" = "br0" -o "$lan_if" = "br0" ]; then
		stp=`nvram_get 2860 stpEnabled`
		if [ "$stp" = "1" ]; then
			brctl setfd br0 15
			brctl stp br0 1
		else
			brctl setfd br0 1
			brctl stp br0 0
		fi
		enableIPv6dad br0 2
	fi

}

addRax2Br0()
{
	brctl addif br0 ra0
	if [ "$enadle_ssid1_2860" = "1" ]; then
		ifconfig ra1 0.0.0.0
		brctl addif br0 ra1
	fi
	if [ "$apcli_2860" = "1" ]; then
		ifconfig apcli0 up
		brctl addif br0 apcli0
	fi


	echo -e "\n##### enable 1st wireless interface #####"
}

addWds2Br0()
{
	wds_en=`nvram_get 2860 WdsEnable`
	if [ "$wds_en" != "0" ]; then
		ifconfig wds0 up 1>/dev/null 2>&1
		ifconfig wds1 up 1>/dev/null 2>&1
		brctl addif br0 wds0
		brctl addif br0 wds1
	fi
}

addMesh2Br0()
{
	meshenabled=`nvram_get 2860 MeshEnabled`
	if [ "$meshenabled" = "1" ]; then
		ifconfig mesh0 up 1>/dev/null 2>&1
		brctl addif br0 mesh0
		meshhostname=`nvram_get 2860 MeshHostName`
		iwpriv mesh0 set  MeshHostName="$meshhostname"
	fi
}

addRaix2Br0()
{
	if [ "$CONFIG_RT2880_INIC" == "" -a "$CONFIG_RTDEV" == "" ]; then
		return
	fi
	brctl addif br0 rai0
	if [ "$enadle_ssid1_rtdev" = "1" ]; then
		ifconfig rai1 0.0.0.0
		brctl addif br0 rai1
	fi

	if [ "$apcli_rtdev" = "1" ]; then
		ifconfig apclii0 up
		brctl addif br0 apclii0
	fi
	echo -e "\n##### enable 2nd wireless interface #####"
}

addInicWds2Br0()
{
	if [ "$CONFIG_RT2880_INIC" == "" -a "$CONFIG_RTDEV" == "" ]; then
		return
	fi
	wds_en=`nvram_get rtdev WdsEnable`
	if [ "$wds_en" != "0" ]; then
		ifconfig wdsi0 up 1>/dev/null 2>&1
		ifconfig wdsi1 up 1>/dev/null 2>&1
		brctl addif br0 wdsi0
		brctl addif br0 wdsi1
	fi
}

addRaL02Br0()
{
	if [ "$CONFIG_RT2561_AP" != "" ]; then
		brctl addif br0 raL0
	fi
}

#
#	ipv6 config#
#	$1:	interface name
#	$2:	dad_transmit number
#
enableIPv6dad()
{
	if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
		echo "2" > /proc/sys/net/ipv6/conf/$1/accept_dad
		echo $2 > /proc/sys/net/ipv6/conf/$1/dad_transmits
	fi
}

disableIPv6dad()
{
	if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
		echo "0" > /proc/sys/net/ipv6/conf/$1/accept_dad
	fi
}

#
# Enlarge the system memory reclaim threshold to prevent from OOM kernel message
# when WiFi concurrent + storage full loading situation.
enlargeFreeMemReclaim()
{
	if [ "$CONFIG_USER_STORAGE" == "y" ]; then
		echo "Enlarge min_free_kbytes...."
		echo 8192 > /proc/sys/vm/min_free_kbytes
	fi
}

genSysFiles()
{
	login=`nvram_get 2860 Login`
	pass=`nvram_get 2860 Password`
	if [ "$pass" == "" ]; then
	pass="wxcpx@TW2018!";
	fi
	echo "$login::0:0:Adminstrator:/:/bin/sh" > /etc/passwd
	echo "$login:x:0:$login" > /etc/group
		chpasswd.sh $login $pass
	
	if [ "$CONFIG_PPPOL2TP" == "y" ]; then
	echo "l2tp 1701/tcp l2f" > /etc/services
	echo "l2tp 1701/udp l2f" >> /etc/services
	fi
}

configVIF()
{
	if [ "$CONFIG_TASKLET_WORKQUEUE_SW" == "y" ]; then
		ifconfig eth2 down
		PLATFORM=`nvram_get 2860 Platform | tr A-Z a-z`
		if [ "$wanmode" == "PPPOE" -o "$wanmode" == "L2TP" -o "$wanmode" == "PPTP" ]; then
			echo 1 > /proc/$PLATFORM/schedule
		else
			echo 0 > /proc/$PLATFORM/schedule
		fi
	fi
	ifconfig eth2 0.0.0.0
	if [ "$CONFIG_GE2_RGMII_AN" = "y" ]; then
		ifconfig eth3 up
	fi

	if [ "$CONFIG_RAETH_ROUTER" = "y" -o "$CONFIG_MAC_TO_MAC_MODE" = "y" -o "$CONFIG_RT_3052_ESW" = "y" ]; then
		vconfig rem eth2.1
		vconfig rem eth2.2
		if [ "$CONFIG_RAETH_SPECIAL_TAG" == "y" ]; then
			vconfig rem eth2.3
			vconfig rem eth2.4
			vconfig rem eth2.5
		fi
		rmmod 8021q
		insmod -q 8021q
		vconfig add eth2 1
		set_vlan_map eth2.1
		vconfig add eth2 2
		set_vlan_map eth2.2
		if [ "$CONFIG_RAETH_SPECIAL_TAG" == "y" ]; then
			vconfig add eth2 3
			set_vlan_map eth2.3
			vconfig add eth2 4
			set_vlan_map eth2.4
			vconfig add eth2 5
			set_vlan_map eth2.5

			if [ "$CONFIG_WAN_AT_P0" = "y" ]; then
				ifconfig eth2.1 down
				wan_mac=`nvram_get 2860 WAN_MAC_ADDR`
				if [ "$wan_mac" != "FF:FF:FF:FF:FF:FF" ]; then
					ifconfig eth2.1 hw ether $wan_mac
				fi
				enableIPv6dad eth2.1 1
			else
				ifconfig eth2.5 down
				wan_mac=`nvram_get 2860 WAN_MAC_ADDR`
				if [ "$wan_mac" != "FF:FF:FF:FF:FF:FF" ]; then
					ifconfig eth2.5 hw ether $wan_mac
				fi
				enableIPv6dad eth2.5 1
			fi
		else
			ifconfig eth2.2 down
			wan_mac=`nvram_get 2860 WAN_MAC_ADDR`
			if [ "$wan_mac" != "FF:FF:FF:FF:FF:FF" ]; then
				ifconfig eth2.2 hw ether $wan_mac
			fi
			enableIPv6dad eth2.2 1
		fi

		ifconfig eth2.1 0.0.0.0
		ifconfig eth2.2 0.0.0.0
		if [ "$CONFIG_RAETH_SPECIAL_TAG" == "y" ]; then
			ifconfig eth2.3 0.0.0.0
			ifconfig eth2.4 0.0.0.0
			ifconfig eth2.5 0.0.0.0
		fi

	elif [ "$CONFIG_ICPLUS_PHY" = "y" ]; then
		#remove ip alias
		# it seems busybox has no command to remove ip alias...
		ifconfig eth2:1 0.0.0.0 1>&2 2>/dev/null
	fi
}

# opmode adjustment:
#   if AP client was not compiled and operation mode was set "3" -> set $opmode "1"
#   if Station was not compiled and operation mode was set "2" -> set $opmode "1"
if [ "$opmode" = "3" -a "$CONFIG_RT2860V2_AP_APCLI$CONFIG_RT3090_AP_APCLI$CONFIG_RT5392_AP_APCLI$CONFIG_RT5592_AP_APCLI$CONFIG_RT3593_AP_APCLI$CONFIG_MT7610_AP_APCLI$CONFIG_RT3572_AP_APCLI$CONFIG_RT5572_AP_APCLI$CONFIG_RT3680_iNIC_AP_APCLI$CONFIG_RTPCI_AP_APCLI" == "" ]; then
	nvram_set 2860 OperationMode 1
	opmode="1"
fi
if [ "$opmode" = "2" -a "$CONFIG_RT2860V2_STA" == "" ]; then
	nvram_set 2860 OperationMode 1
	opmode="1"
fi

# pppoe send Termination Request first because routine will down eth2 and eth2.2 after
killall -q pppd

genDevNode
genSysFiles

echo 0 > /proc/sys/net/ipv4/ip_forward

# disable ipv6 DAD on all interfaces by default
if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
	echo "0" > /proc/sys/net/ipv6/conf/default/accept_dad
fi

if [ "$CONFIG_DWC_OTG" == "m" ]; then
usbmod_exist=`lsmod | grep dwc_otg | wc -l`
if [ $usbmod_exist == 0 ]; then
insmod -q lm
insmod -q dwc_otg
fi
fi

if [ "$CONFIG_USB_EHCI_HCD" == "m" ]; then
usbmod_exist=`lsmod | grep ehci-hcd | wc -l`
if [ $usbmod_exist == 0 ]; then
insmod -q ehci-hcd
fi
fi

if [ "$CONFIG_USB_OHCI_HCD" == "m" ]; then
usbmod_exist=`lsmod | grep ohci-hcd | wc -l`
if [ $usbmod_exist == 0 ]; then
insmod -q ohci-hcd
fi
fi

if [ "$CONFIG_MTK_MMC" == "m" ]; then
msdcmod_exist=`lsmod | grep mtk_sd | wc -l`
if [ $msdcmod_exist == 0 ]; then
insmod -q mtk_sd
fi
fi

if [ "$CONFIG_UFSD_FS" == "m" ]; then
ufsdmod_exist=`lsmod | grep ufsd | wc -l`
if [ $ufsdmod_exist == 0 ]; then
	insmod -q ufsd
fi
fi

if [ "$CONFIG_GE2_RGMII_AN" = "y" ]; then
	ifconfig eth3 down
fi
killall -9 watchdog 1>/dev/null 2>&1
rmmod ralink_wdt
rmmod cls
rmmod hw_nat
rmmod raeth

# insmod all
insmod -q bridge
insmod -q mii
insmod -q raeth

# avoid eth2 doing ipv6 DAD
disableIPv6dad eth2

# In 2.6.36 kernel(MT7620& MT7621), avoid ipv6 traffic unless everything ready
if [ "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
fi
fi

ifRaxWdsxDown
if [ "$CONFIG_DEFAULTS_RALINK_MT7620A_DIR816C" == "" ]; then
if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
	ifRaixWdsxDown
fi
fi

ifconfig eth2.1 down
ifconfig eth2.2 down
ifconfig eth2 down
ifconfig br0 down
sleep 3
brctl delbr br0

if [ "$CONFIG_RT2860V2_AP" != "" ]; then
	rmmod rt2860v2_ap_net
	rmmod rt2860v2_ap
	rmmod rt2860v2_ap_util
fi
if [ "$CONFIG_RT2860V2_STA" != "" ]; then
	rmmod rt2860v2_sta_net
	rmmod rt2860v2_sta
	rmmod rt2860v2_sta_util
fi
if [ "$RT2880v2_INIC_PCI" != "" ]; then
	rmmod iNIC_pci
fi
if [ "$CONFIG_RT3090_AP" != "" ]; then
	rmmod RT3090_ap_net
	rmmod RT3090_ap
	rmmod RT3090_ap_util
fi
if [ "$CONFIG_RT5392_AP" != "" ]; then
	rmmod RT5392_ap
fi
if [ "$CONFIG_RT5592_AP" != "" ]; then
	rmmod RT5592_ap
fi
if [ "$CONFIG_RT3593_AP" != "" ]; then
	rmmod RT3593_ap
fi
#if [ "$CONFIG_MT7610_AP" != "" ]; then
#	rmmod MT7610_ap
#fi
if [ "$CONFIG_RTPCI_AP" != "" ]; then
	rmmod RTPCI_ap
fi
if [ "$CONFIG_RT3572_AP" != "" ]; then
	rmmod RT3572_ap_net
	rmmod RT3572_ap
	rmmod RT3572_ap_util
fi
if [ "$CONFIG_RT5572_AP" != "" ]; then
	rmmod RT5572_ap_net
	rmmod RT5572_ap
	rmmod RT5572_ap_util
fi
if [ "$RT305x_INIC_USB" != "" ]; then
	rmmod iNIC_usb
fi
if [ "$CONFIG_RT3680_iNIC_AP" != "" ]; then
	rmmod RT3680_ap
fi
if [ "$CONFIG_RT2561_AP" != "" ]; then
	rmmod rt2561ap
fi

if [ "$CONFIG_RT2860V2_AP_WAPI$CONFIG_RT3090_AP_WAPI$CONFIG_RT5392_AP_WAPI$CONFIG_RT5592_AP_WAPI$CONFIG_RT3593_AP_WAPI$CONFIG_MT7610_AP_WAPI$CONFIG_RT3572_AP_WAPI$CONFIG_RT5572_AP_WAPI$CONFIG_RT3680_iNIC_AP_WAPI$CONFIG_RTPCI_AP_WAPI" != "" ]; then
	ralink_init gen wapi
fi
ralink_init make_wireless_config rt2860
if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
	ralink_init make_wireless_config rtdev
fi
if [ "$CONFIG_RT2860V2_AP_DFS$CONFIG_RT5592_AP_DFS$CONFIG_RT3593_AP_DFS$CONFIG_MT7610_AP_DFS$CONFIG_RT3572_AP_DFS$CONFIG_RT5572_AP_DFS$CONFIG_RTPCI_AP_DFS" != "" ]; then
	insmod -q rt_timer
fi
if [ "$CONFIG_RT2860V2_STA" != "" -a "$stamode" = "y" ]; then
	insmod -q rt2860v2_sta_util
	insmod -q rt2860v2_sta
	insmod -q rt2860v2_sta_net

	if [ "$CONFIG_RT2860V2_STA_WPA_SUPPLICANT" == "y" ]; then
		ralink_init gen cert
	fi
elif [ "$CONFIG_RT2860V2_AP" != "" ]; then
	insmod -q rt2860v2_ap_util
	insmod -q rt2860v2_ap
	insmod -q rt2860v2_ap_net
fi
# RTDEV_PCI support
if [ "$RT2880v2_INIC_PCI" != "" ]; then
	insmod -q iNIC_pci 
fi
if [ "$CONFIG_RLT_AP_SUPPORT" != "" ]; then
        insmod -q rlt_wifi
fi
if [ "$CONFIG_RT3090_AP" != "" ]; then
	insmod -q RT3090_ap_util
	insmod -q RT3090_ap
	insmod -q RT3090_ap_net
fi
if [ "$CONFIG_RT5392_AP" != "" ]; then
	insmod -q RT5392_ap
fi
if [ "$CONFIG_RT5592_AP" != "" ]; then
	insmod -q RT5592_ap
fi
if [ "$CONFIG_MT7610_AP" != "" ]; then
	echo "xxxxxxxxxxxxxx  insmod -q MT7610_ap   xxxxxxxxxxxxxxx"
	#insmod -q MT7610_ap
	insmod /lib/modules/2.6.36/kernel/drivers/net/wireless/MT7610_ap/MT7610_ap.ko
fi
if [ "$CONFIG_RT3593_AP" != "" ]; then
	insmod -q RT3593_ap
fi
if [ "$CONFIG_RTPCI_AP" != "" ]; then
	insmod -q RTPCI_ap
fi
# RTDEV_USB support
if [ "$RT305x_INIC_USB" != "" ]; then
	insmod -q iNIC_usb 
fi
if [ "$CONFIG_RT3572_AP" != "" ]; then
	insmod -q RT3572_ap_util
	insmod -q RT3572_ap
	insmod -q RT3572_ap_net
fi
if [ "$CONFIG_RT5572_AP" != "" ]; then
	insmod -q RT5572_ap_util
	insmod -q RT5572_ap
	insmod -q RT5572_ap_net
fi
if [ "$CONFIG_RT3680_iNIC_AP" != "" ]; then
	insmod -q RT3680_ap
fi

# RT2561(Legacy) support
if [ "$CONFIG_RT2561_AP" != "" ]; then
	insmod -q rt2561ap
fi
if [ "$CONFIG_RTDEV_PLC" != "" ]; then
	ifconfig plc0 up
fi
vpn-passthru.sh

#wait for module install
sleep 2

# config interface
ifconfig ra0 0.0.0.0 1>/dev/null 2>&1
if [ "$radio_off1" = "1" ]; then
	iwpriv ra0 set RadioOn=0
else
	iwpriv ra0 set RadioOn=1
fi
if [ "$ethconv" = "y" ]; then
	iwpriv ra0 set EthConvertMode=hybrid
	iwpriv ra0 set EthCloneMac=`nvram_get 2860 ethConvertMAC`
fi


if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
	ifconfig rai0 0.0.0.0 1>/dev/null 2>&1	
	if [ "$radio_off2" = "1" ]; then
		iwpriv rai0 set RadioOn=0
	else
		iwpriv rai0 set RadioOn=1
	fi
fi
ifconfig lo 127.0.0.1


# stop all
iptables --flush
iptables --flush -t nat
iptables --flush -t mangle

firewall_init.sh init

#
# init ip address to all interfaces for different OperationMode:
#   0 = Bridge Mode
#   1 = Gateway Mode
#   2 = Ethernet Converter Mode
#   3 = AP Client
#
if [ "$opmode" = "0" ]; then
	configVIF
	if [ "$CONFIG_RAETH_ROUTER" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
		echo "##### restore IC+ to dump switch #####"
		config-vlan.sh 0 0
	elif [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
		echo "##### restore Vtss to dump switch #####"
		config-vlan.sh 1 0
		if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
			sleep 3
		fi
	elif [ "$CONFIG_RT_3052_ESW" = "y" ]; then
		if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
			echo "##### restore Ralink ESW to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				config-vlan.sh 3 0
			else
				config-vlan.sh 2 0
			fi
			echo "##### restore External Switch to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				echo "initialize external switch"
			else
				config-vlan.sh 1 0
			fi
		else
			echo "##### restore Ralink ESW to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				config-vlan.sh 3 0
			else
				config-vlan.sh 2 0
			fi
		fi
	fi
	if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
		sleep 2
	fi
	addBr0
	addRax2Br0
	addWds2Br0
	addMesh2Br0
	APCLI=`nvram_get 2860 apClient`
	if [ "$CONFIG_RT2860V2_AP_APCLI$CONFIG_RT3090_AP_APCLI$CONFIG_RT5392_AP_APCLI$CONFIG_RT5592_AP_APCLI$CONFIG_RT3593_AP_APCLI$CONFIG_MT7610_AP_APCLI$CONFIG_RT3572_AP_APCLI$CONFIG_RT5572_AP_APCLI$CONFIG_RT3680_iNIC_AP_APCLI$CONFIG_RTPCI_AP_APCLI" != "" -a "$APCLI" = "1" ]; then
    	if [ "$cli_mode" = "0" ]; then
    		ifconfig apcli0 up
    		brctl addif br0 apcli0
    	fi
	fi
	brctl addif br0 eth2
	if [ "$CONFIG_GE2_RGMII_AN" = "y" ]; then
		brctl addif br0 eth3
	fi

# RTDEV_MII support: start mii iNIC after network interface is working
	if [ "$CONFIG_RTDEV_MII" != "" ]; then
		rmmod iNIC_mii
		iNIC_Mii_en=`nvram_get rtdev InicMiiEnable`
		if [ "$iNIC_Mii_en" == "1" ]; then
			iwpriv rai0 set RadioOn=1
			ifconfig rai0 down 1>/dev/null 2>&1
			insmod -q iNIC_mii miimaster=eth2
			ifconfig rai0 up 1>/dev/null 2>&1
			if [ "$radio_off2" = "1" ]; then
				iwpriv rai0 set RadioOn=0
			else
				iwpriv rai0 set RadioOn=1
			fi
		fi
	fi

	if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
		addRaix2Br0
		addInicWds2Br0
		addRaL02Br0
		enlargeFreeMemReclaim
	fi
	
	wan.sh
	lan.sh
elif [ "$opmode" = "1" ]; then
	configVIF
	if [ "$CONFIG_RAETH_ROUTER" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
		if [ "$CONFIG_WAN_AT_P0" = "y" ]; then
			echo '##### config IC+ vlan partition (WLLLL) #####'
			config-vlan.sh 0 WLLLL
		else
			echo '##### config IC+ vlan partition (LLLLW) #####'
			config-vlan.sh 0 LLLLW
		fi
	fi
	if [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
		if [ "$CONFIG_WAN_AT_P0" = "y" ]; then
			echo '##### config Vtss vlan partition (WLLLL) #####'
			config-vlan.sh 1 WLLLL
		else
			echo '##### config Vtss vlan partition (LLLLW) #####'
			config-vlan.sh 1 LLLLW
		fi
		if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
			sleep 3
		fi
	fi
	if [ "$CONFIG_RT_3052_ESW" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
		if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
			echo "##### restore Ralink ESW to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				config-vlan.sh 3 0 
			else
				config-vlan.sh 2 0
			fi
			if [ "$CONFIG_WAN_AT_P0" = "y" ]; then
				echo '##### config External Switch vlan partition (WLLLL) #####'
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					echo "initialize external switch (WLLLL)"
				else
					config-vlan.sh 1 WLLLL
				fi
			else
				echo '##### config External Switch vlan partition (LLLLW) #####'
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					echo "initialize external switch (LLLLW)"
				else
					config-vlan.sh 1 LLLLW
				fi
			fi
		else
			if [ "$CONFIG_WAN_AT_P0" = "y" ]; then
				echo '##### config Ralink ESW vlan partition (WLLLL) #####'
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					config-vlan.sh 3 WLLLL
				else
					config-vlan.sh 2 WLLLL
				fi
			else
				echo '##### config Ralink ESW vlan partition (LLLLW) #####'
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					config-vlan.sh 3 LLLLW
				else
					config-vlan.sh 2 LLLLW
				fi
			fi
		fi
	fi

	if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
		sleep 2
	fi

	addBr0
	addRax2Br0
	addWds2Br0
	addMesh2Br0
	if [ "$CONFIG_RAETH_ROUTER" = "y" -o "$CONFIG_MAC_TO_MAC_MODE" = "y" -o "$CONFIG_RT_3052_ESW" = "y" ]; then
		if [ "$CONFIG_RAETH_SPECIAL_TAG" == "y" ]; then
			if [ "$CONFIG_WAN_AT_P4" = "y" ]; then
				brctl addif br0 eth2.1
			fi
			brctl addif br0 eth2.2
			brctl addif br0 eth2.3
			brctl addif br0 eth2.4
			if [ "$CONFIG_WAN_AT_P0" = "y" ]; then
				brctl addif br0 eth2.5
			fi
		else
			brctl addif br0 eth2.1
		fi
	fi

	# IC+ 100 PHY (one port only)
	if [ "$CONFIG_ICPLUS_PHY" = "y" ]; then
		echo '##### connected to one port 100 PHY #####'
		#
		# setup ip alias for user to access web page.
		#
		ifconfig eth2:1 172.32.1.254 netmask 255.255.255.0 up
	fi
	if [ "$CONFIG_GE1_RGMII_AN" = "y" -a "$CONFIG_GE2_RGMII_AN" = "y" ]; then
		echo "##### connected to two Giga PHY port #####"
		brctl addif br0 eth2
	fi
	if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
		addRaix2Br0
		addInicWds2Br0
		addRaL02Br0
		enlargeFreeMemReclaim
	fi
	wan_speed=`nvram_get 2860 wan_speed`
	if [ "$wan_speed" != "" -a "$wan_speed" != "0" ]; then
		config-wanport.sh
	fi
	wan.sh
	lan.sh
	# set the global ipv6 address for LAN/WAN, enable ipv6 forwarding,
	# enable ecmh(multicast) daemon
elif [ "$opmode" = "2" ]; then
	configVIF
	# if (-1 == initStaProfile())
	#   error(E_L, E_LOG, T("internet.c: profiles in nvram is broken"));
	# else
	#   initStaConnection();

	if [ "$CONFIG_RAETH_ROUTER" = "y" -a "$CONFIG_LAN_WAN_SUPPORT" = "y" ]; then
		echo "##### restore IC+ to dump switch #####"
		config-vlan.sh 0 0
	fi
	if [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
		echo "##### restore External Switch to dump switch #####"
		config-vlan.sh 1 0
	fi
	if [ "$CONFIG_RT_3052_ESW" = "y" ]; then
		if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
			echo "##### restore Ralink ESW to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				config-vlan.sh 3 0
			else
				config-vlan.sh 2 0
			fi
			echo "##### restore External Switch to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				echo "initialize external switch"
			else
				config-vlan.sh 1 0
			fi
		else
			echo "##### restore Ralink ESW to dump switch #####"
			if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
				config-vlan.sh 3 0
			else
				config-vlan.sh 2 0
			fi
		fi
	fi
	if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
		sleep 2
	fi
	addBr0
	brctl addif br0 eth2
	if [ "$CONFIG_GE2_RGMII_AN" = "y" ]; then
		brctl addif br0 eth3
	fi
	enableIPv6dad $lan_if 1
	enableIPv6dad $wan_if 1

	if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
		addRaix2Br0
		addInicWds2Br0
		addRaL02Br0
	fi
	
	wan.sh
	lan.sh
elif [ "$opmode" = "3" ]; then
	configVIF
	if [ "$CONFIG_RAETH_ROUTER" = "y" -o "$CONFIG_MAC_TO_MAC_MODE" = "y" -o "$CONFIG_RT_3052_ESW" = "y" ]; then
		if [ "$CONFIG_RAETH_ROUTER" = "y" ]; then
			echo "##### restore IC+ to dump switch #####"
			config-vlan.sh 0 0
		fi
		if [ "$CONFIG_MAC_TO_MAC_MODE" = "y" ]; then
			echo "##### restore Vtss to dump switch #####"
			config-vlan.sh 1 0
		fi
		if [ "$CONFIG_RT_3052_ESW" = "y" ]; then
			if [ "$CONFIG_P5_RGMII_TO_MAC_MODE" = "y" ]; then
				echo "##### restore Ralink ESW to dump switch #####"
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					config-vlan.sh 3 0
				else
					config-vlan.sh 2 0
				fi
				echo "##### restore External Switch to dump switch #####"
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					echo "initialize external switch"
				else
					config-vlan.sh 1 0
				fi
			else
				echo "##### restore Ralink ESW to dump switch #####"
				if [ "$CONFIG_RALINK_RT6855" = "y" -o "$CONFIG_RALINK_RT6855A" = "y" -o "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
					config-vlan.sh 3 0
				else
					config-vlan.sh 2 0
				fi
			fi
		fi
	fi
	if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
		sleep 2
	fi
	addBr0
	addRax2Br0
	addWds2Br0
	addMesh2Br0
    if [ "$cli_mode" = "0" ]; then
    	ifconfig apcli0 0.0.0.0
    	brctl addif br0 apcli0
    fi	

	brctl addif br0 eth2
	if [ "$CONFIG_GE2_RGMII_AN" = "y" ]; then
		brctl addif br0 eth3
	fi

# RTDEV_MII support: start mii iNIC after network interface is working
	if [ "$CONFIG_RTDEV_MII" != "" ]; then
		rmmod iNIC_mii
		iNIC_Mii_en=`nvram_get rtdev InicMiiEnable`
		if [ "$iNIC_Mii_en" == "1" ]; then
			iwpriv rai0 set RadioOn=1
			ifconfig rai0 down 1>/dev/null 2>&1
			insmod -q iNIC_mii miimaster=eth2
			ifconfig rai0 up 1>/dev/null 2>&1
			if [ "$radio_off2" = "1" ]; then
				iwpriv rai0 set RadioOn=0
			else
				iwpriv rai0 set RadioOn=1
			fi
	        if [ "$cli_mode" = "1" ]; then
			    ifconfig apclii0 0.0.0.0
			    brctl addif br0 apclii0
	        fi
		fi
	fi	
	
	if [ "$CONFIG_RTDEV" != "" -o "$CONFIG_RT2561_AP" != "" ]; then
		addRaix2Br0
		addInicWds2Br0
		addRaL02Br0
		if [ "$cli_mode" = "1" ]; then
		    ifconfig apclii0 up
		    brctl addif br0 apclii0
		fi
		enlargeFreeMemReclaim
	fi
	
	killall -q udhcpd
	killall -q udhcpc
	killall -q dhcpplus
	wan.sh
	lan.sh
else
	echo "unknown OperationMode: $opmode"
	exit 1
fi

# INIC support
#if [ "$CONFIG_RT2880_INIC" != "" ]; then
#	ifconfig rai0 down
#	rmmod rt_pci_dev
#	ralink_init make_wireless_config rtdev
#	insmod -q rt_pci_dev
#	ifconfig rai0 up
#	RaAP&
#	sleep 3
#fi
if [ "$opmode" != "0" -a "$opmode" != "3" ]; then
	echo 1 > /proc/sys/net/ipv4/ip_forward
	echo "echo 1 > /proc/sys/net/ipv4/ip_forward"
fi

# in order to use broadcast IP address in L2 management daemon
if [ "$CONFIG_ICPLUS_PHY" = "y" ]; then
	route add -host 255.255.255.255 dev $wan_if
else
	route add -host 255.255.255.255 dev $lan_if
fi


m2uenabled_2860=`nvram_get 2860 M2UEnabled`
m2uenabled_rtdev=`nvram_get rtdev M2UEnabled`
if [ "$m2uenabled_2860" = "1" ]; then
	iwpriv ra0 set IgmpSnEnable=1
	echo "iwpriv ra0 set IgmpSnEnable=1"
fi
if [ "$m2uenabled_rtdev" = "1" ]; then
	iwpriv rai0 set IgmpSnEnable=1
	echo "iwpriv rai0 set IgmpSnEnable=1"
fi


#if [ "$wifi_off" = "1" ]; then
#	ifRaxWdsxDown
#	reg s b0180000
#	reg w 400 0x1080
#	reg w 1204 8
#	reg w 1004 3
#fi

RVT=`nvram_get 2860 RVT`
if [ "$RVT" = "1" ]; then
	insmod -q cls
fi

WDGE=`nvram_get 2860 WatchDogEnable`
if [ "$WDGE" = "1" ]; then
	insmod -q ralink_wdt
	wdg.sh
	watchdog
fi

# In 2.6.36 kernel(MT7620& MT7621), avoid ipv6 traffic unless everything ready
if [ "$CONFIG_RALINK_MT7620" = "y" -o "$CONFIG_RALINK_MT7621" = "y" ]; then
if [ "$CONFIG_IPV6" == "y" -o "$CONFIG_IPV6" == "m" ]; then
echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6
fi
fi

mdev -s
setMDEV
if [ "$CONFIG_RALINKAPP_HOTSPOT" == "y" ]; then
	hotspot.sh
fi
#restart8021XDaemon(RT2860_NVRAM);
#firewall_init();
#management_init();
