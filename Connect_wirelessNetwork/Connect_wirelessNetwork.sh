echo $0: Set the connection information of the wireless network...

if [ $1 ] ; then
  ssid=$1
else
  ssid=
fi
printf "  ssid:$ssid\n"

if [ $2 ] ; then
  psk=$2
else
  psk=
fi
printf "  psk:$psk\n"

if [ $3 ] ; then
  key_mgmt=$3
else
  key_mgmt=WPA-PSK
fi
printf "  key_mgmt:$key_mgmt\n"


if [ $4 ] ; then
  country $4
else
  country=TW
fi
printf "  country:$country\n"

if [ $5 ] ; then
  GROUP $5
else
  GROUP=netdev
fi
printf "  GROUP:$GROUP\n"

if [ $6 ] ; then
  ctrl_interface $6
else
  ctrl_interface=/var/run/wpa_supplicant
fi
printf "  ctrl_interface:$ctrl_interface\n"

if [ ! -d /tmp/Connect_wirelessNetwork ] ; then
  printf "/tmp/Connect_wirelessNetwork:not exist\n"
  printf "  $ mkdir /tmp/Connect_wirelessNetwork\n"
  mkdir /tmp/Connect_wirelessNetwork
fi

if [ -d /tmp/Connect_wirelessNetwork ] ; then
  printf "/tmp/Connect_wirelessNetwork:exist\n"
else
  printf "/tmp/Connect_wirelessNetwork:not exist\n"
fi

sudo printf "ctrl_interface=DIR=$ctrl_interface GROUP=$GROUP\n"  >  /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "country=$country\n"                                 >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "network={\n"                                        >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "  ssid=\"$ssid\"\n"                                   >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "  psk=\"$psk\"\n"                                     >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "  key_mgmt=$key_mgmt\n"                               >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "}\n"                                                >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf

printf "$ cat -n /tmp/Connect_wirelessNetwork/wpa_supplicant.conf\n"
sudo cat -n /tmp/Connect_wirelessNetwork/wpa_supplicant.conf

printf "$ cp /tmp/Connect_wirelessNetwork/wpa_supplicant.conf /boot/wpa_supplicant.conf\n"
sudo cp /tmp/Connect_wirelessNetwork/wpa_supplicant.conf /boot/wpa_supplicant.conf
printf "$ cat -n /boot/wpa_supplicant.conf\n"
sudo cat -n /boot/wpa_supplicant.conf

printf "Please reboot to connect.\n"