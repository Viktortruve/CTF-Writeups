#!/bin/sh
# 2014-09-28 linsd add for resolv l2tp servername 
OPENL2TP_FILE=/etc/openl2tpd.conf
RESOLV_CONF="/etc/resolv.conf"

OPENL2TP_SERVER_IP=`nvram_get 2860 wan_l2tp_server`
OPENL2TP_USE_DNS=`nvram_get 2860 wan_l2tp_use_dns`
OPENL2TP_OPMODE=`nvram_get 2860 wan_l2tp_opmode`
OPENL2TP_IDLETIME=`nvram_get 2860 wan_l2tp_optime`
OPENL2TP_MTU=`nvram_get 2860 wan_mtu`
OPENL2TP_AUTHTYPE=`nvram_get 2860 wan_l2tp_automode`
OPENL2TP_DFROUTE=`nvram_get 2860 wan_l2tp_dfroute`
OPENL2TP_AUTODNS=`nvram_get 2860 wan_l2tp_autodns`

if [ "$OPENL2TP_USE_DNS" == "1" ]; then

	sdns=`nvram_get 2860 wan_l2tp_server_dns`
	if [ "$sdns" != "" ]; then
		echo nameserver $sdns > $RESOLV_CONF
	fi
	killall -q dnsmasq
	dnsmasq &
	
#	OPENL2TP_SERVER_IP=`pppoe-discovery -d $OPENL2TP_SERVER_IP`
#	if [ "$OPENL2TP_SERVER_IP" == "" ]; then
#		echo "[openl2tp.sh] get server ip error!"
#		cat /etc/resolv.conf
#	fi
fi
	OPENL2TP_SERVER_IP=`pppoe-discovery -d $OPENL2TP_SERVER_IP`
	if [ "$OPENL2TP_SERVER_IP" == "" ]; then
		echo "[openl2tp.sh] get server ip error!"
		cat /etc/resolv.conf
	fi

#rm $RESOLV_CONF -rf
killall -q dnsmasq
dnsp=`nvram_get 2860 dnsPEnabled`
if [ "$dnsp" = "1" ]; then
	dnsmasq &
fi

route add $OPENL2TP_SERVER_IP gw $1

echo "ppp profile modify profile_name=default \\"  > $OPENL2TP_FILE
echo "mru=$OPENL2TP_MTU mtu=$OPENL2TP_MTU \\"  >> $OPENL2TP_FILE
if [ $OPENL2TP_AUTHTYPE == "pap" ]; then
	echo "auth_pap=yes \\"  >> $OPENL2TP_FILE
elif [ $OPENL2TP_AUTHTYPE == "chap" ]; then
	echo "auth_chap=yes \\"  >> $OPENL2TP_FILE
elif [ $OPENL2TP_AUTHTYPE == "none" ]; then
	echo "auth_none=yes \\"  >> $OPENL2TP_FILE
else
	echo "auth_eap=no \\"  >> $OPENL2TP_FILE
fi
if [ $OPENL2TP_DFROUTE == "1" ]; then
echo "default_route=yes "  >> $OPENL2TP_FILE
else
echo "default_route=no "  >> $OPENL2TP_FILE
fi

echo "tunnel create tunnel_name=ralink dest_ipaddr=$OPENL2TP_SERVER_IP \\" >> $OPENL2TP_FILE
if [ $OPENL2TP_OPMODE == "KeepAlive" ]; then
	echo "persist=yes" >> $OPENL2TP_FILE
elif [ $OPENL2TP_OPMODE == "OnDemand" ]; then
	OPENL2TP_IDLETIME=`expr $OPENL2TP_IDLETIME \* 60`
	echo "persist=no \\" >> $OPENL2TP_FILE
	echo "idle_timeout=$OPENL2TP_IDLETIME" >> $OPENL2TP_FILE
fi

echo "session create tunnel_name=ralink \\" >> $OPENL2TP_FILE
echo "session_name=ralink" >> $OPENL2TP_FILE