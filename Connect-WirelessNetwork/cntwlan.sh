if [ $1 = "--help" ] ; then
  printf "* Connect to wireless network\n"
  printf "  Set the connection information of the wireless network\n"
  printf "* usage\n"
  printf "  $0 {ssid} {psk} [{key_mgmt} [{country} [{GROUP} [{ctrl_interface}]]]]\n"
  printf "* parameter\n"
  printf "  * ssid\n"
  printf "    * wireless network name\n"
  printf "  * psk\n"
  printf "    * wireless network password\n"
  printf "  * key_mgmt\n"
  printf "    * safety (Wi-Fi Protected Access(WPA))\n"
  printf "    * default: \"WPA-PSK\"\n"
  printf "  * country\n"
  printf "    * default: \"TW\"\n"
  printf "  * GROUP\n"
  printf "    * default: \"netdev\"\n"
  printf "  * ctrl_interface\n"
  printf "    * default: \"/var/run/wpa_supplicant\"\n"
  printf "*  Notice: \n"
  printf "  * All parameters cannot contain blank characters\n"
  printf "  * After successful execution, there will be a file \"wpa_supplicant.conf\" in \"/boot\". After rebooting, the file will be removed and the setting will take effect.\n"
  printf "* production file format\n"
  printf "  \`\`\`\n"
  printf "   1  ctrl_interface=DIR=\${ctrl_interface} GROUP=\${GROUP}\n"
  printf "   2  country=\${country}\n"
  printf "   3  network={\n"
  printf "   4    ssid=\"\${ssid}\"\n"
  printf "   5    psk=\"\${psk}\"\n"
  printf "   6    key_mgmt=\${key_mgmt}\n"
  printf "   7  }\n"
  printf "  \`\`\`\n"
  exit 0;
fi

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
sudo printf "  ssid=\"$ssid\"\n"                                 >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "  psk=\"$psk\"\n"                                   >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "  key_mgmt=$key_mgmt\n"                             >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
sudo printf "}\n"                                                >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf

printf "$ cat -n /tmp/Connect_wirelessNetwork/wpa_supplicant.conf\n"
sudo cat -n /tmp/Connect_wirelessNetwork/wpa_supplicant.conf

printf "$ cp /tmp/Connect_wirelessNetwork/wpa_supplicant.conf /boot/wpa_supplicant.conf\n"
sudo cp /tmp/Connect_wirelessNetwork/wpa_supplicant.conf /boot/wpa_supplicant.conf
printf "$ cat -n /boot/wpa_supplicant.conf\n"
sudo cat -n /boot/wpa_supplicant.conf

printf "Please reboot to connect.\n"
