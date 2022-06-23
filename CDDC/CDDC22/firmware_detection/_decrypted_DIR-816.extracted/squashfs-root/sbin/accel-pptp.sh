#!/bin/sh
# 2014-09-29 linsd add for support autodns or not
CONF_DIR=/etc/ppp
PPTP_FILE=/etc/options.pptp
PPTP_PAPFILE=/etc/ppp/pap-secrets
PPTP_CHAPFILE=/etc/ppp/chap-secrets
RESOLV_CONF="/etc/resolv.conf"

PPTP_USER_NAME=`nvram_get 2860 wan_pptp_user`
PPTP_PASSWORD=`nvram_get 2860 wan_pptp_pass`
PPTP_SERVER_IP=`nvram_get 2860 wan_pptp_server`
PPTP_USE_DNS=`nvram_get 2860 wan_pptp_use_dns`
PPTP_OPMODE=`nvram_get 2860 wan_pptp_opmode`
PPTP_OPTIME=`nvram_get 2860 wan_pptp_optime`
PPTP_MTU=`nvram_get 2860 wan_mtu`
PPTP_AUTHTYPE=`nvram_get 2860 wan_pptp_automode`
PPTP_AUTODNS=`nvram_get 2860 wan_pptp_autodns`

if [ "$PPTP_USE_DNS" == "1" ]; then
	sdns=`nvram_get 2860 wan_pptp_server_dns`
	if [ "$sdns" != "" ]; then
		echo nameserver $sdns > $RESOLV_CONF
	fi
	killall -q dnsmasq
	dnsmasq &
	
	PPTP_SERVER_IP=`pppoe-discovery -d $PPTP_SERVER_IP`
	if [ "$PPTP_SERVER_IP" == "" ]; then
		echo "[accel-pptp.sh] get server ip error!"
		cat /etc/resolv.conf
	fi
fi
#rm $RESOLV_CONF -rf
killall -q dnsmasq
dnsp=`nvram_get 2860 dnsPEnabled`
if [ "$dnsp" = "1" ]; then
	dnsmasq &
fi

route add $PPTP_SERVER_IP gw $1
if [ ! -d $CONF_DIR ] ; then mkdir -p $CONF_DIR; fi

if [ $PPTP_AUTHTYPE == "pap" ]; then
	echo "\"$PPTP_USER_NAME\" * \"$PPTP_PASSWORD\" * " > $PPTP_PAPFILE
	echo "auth" > $PPTP_FILE
	echo "require-pap" >> $PPTP_FILE
elif [ $PPTP_AUTHTYPE == "chap" ]; then
	echo "\"$PPTP_USER_NAME\" * \"$PPTP_PASSWORD\" * " > $PPTP_CHAPFILE
	echo "auth" > $PPTP_FILE  
	echo "require-chap" >> $PPTP_FILE
else
	echo "noauth" > $PPTP_FILE 
	echo "refuse-eap" >> $PPTP_FILE	
fi
#echo "refuse-chap" >> $PPTP_FILE
#echo "refuse-mschap" >> $PPTP_FILE
#echo "require-mppe-128" >> $PPTP_FILE
#echo "nomppe-stateful" >> $PPTP_FILE
echo "user \"$PPTP_USER_NAME\""  >> $PPTP_FILE
echo "password \"$PPTP_PASSWORD\"" >> $PPTP_FILE
echo "connect true" >> $PPTP_FILE
echo "plugin \"pptp.so\"" >> $PPTP_FILE
echo "pptp_server $PPTP_SERVER_IP" >> $PPTP_FILE
echo "maxfail 0" >> $PPTP_FILE
if [ "$PPTP_AUTODNS" == "0" ]; then
	DNS1=`nvram_get 2860 wan_pptp_primary_dns`
	DNS2=`nvram_get 2860 wan_pptp_secondary_dns`
	echo "ms-dns $DNS1" >> $PPTP_FILE
	if [ "$DNS2" != "" ]; then
		echo "ms-dns $DNS2" >> $PPTP_FILE
	fi
else
	echo "usepeerdns" >> $PPTP_FILE
fi
if [ $PPTP_OPMODE == "KeepAlive" ]; then
	echo "persist" >> $PPTP_FILE
	echo "holdoff $PPTP_OPTIME" >> $PPTP_FILE
elif [ $PPTP_OPMODE == "OnDemand" ]; then
	PPTP_OPTIME=`expr $PPTP_OPTIME \* 60`
	echo "demand" >> $PPTP_FILE
	echo "idle $PPTP_OPTIME" >> $PPTP_FILE
fi
echo "defaultroute" >> $PPTP_FILE
echo "ipcp-accept-remote ipcp-accept-local noipdefault" >> $PPTP_FILE
echo "ktune" >> $PPTP_FILE
echo "default-asyncmap nopcomp noaccomp" >> $PPTP_FILE
echo "novj nobsdcomp nodeflate" >> $PPTP_FILE
echo "lcp-echo-interval 10" >> $PPTP_FILE
echo "lcp-echo-failure 6" >> $PPTP_FILE
echo "unit 0" >> $PPTP_FILE
echo "mru $PPTP_MTU" >> $PPTP_FILE
echo "mtu $PPTP_MTU" >> $PPTP_FILE

