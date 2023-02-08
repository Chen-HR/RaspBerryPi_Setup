
echo $0: Set the connection information of the wireless network...


if [ $1 = "connect" ] ; then
  if [ $2 ] ; then
    ssid=$2
  else
    ssid=
  fi
  printf "  ssid:$ssid\n"

  if [ $3 ] ; then
    psk=$3
  else
    psk=
  fi
  printf "  psk:$psk\n"

  if [ $4 ] ; then
    key_mgmt=$4
  else
    key_mgmt=WPA-PSK
  fi
  printf "  key_mgmt:$key_mgmt\n"


  if [ $5 ] ; then
    country $5
  else
    country=TW
  fi
  printf "  country:$country\n"

  if [ $6 ] ; then
    GROUP $6
  else
    GROUP=netdev
  fi
  printf "  GROUP:$GROUP\n"

  if [ $7 ] ; then
    ctrl_interface $7
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

  # sudo printf "ctrl_interface=DIR=$ctrl_interface GROUP=$GROUP\n"  >  /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  # sudo printf "country=$country\n"                                 >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  # sudo printf "network={\n"                                        >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  # sudo printf "  ssid=\"$ssid\"\n"                                 >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  # sudo printf "  psk=\"$psk\"\n"                                   >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  # sudo printf "  key_mgmt=$key_mgmt\n"                             >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  # sudo printf "}\n"                                                >> /tmp/Connect_wirelessNetwork/wpa_supplicant.conf
  sudo printf "\
    ctrl_interface=DIR=$ctrl_interface GROUP=$GROUP
    country=$country
    network={
      ssid=\"$ssid\"
      psk=\"$psk\"
      key_mgmt=$key_mgmt
    }\n" > /tmp/Connect_wirelessNetwork/wpa_supplicant.conf

  printf "$ cat -n /tmp/Connect_wirelessNetwork/wpa_supplicant.conf\n"
  sudo cat -n /tmp/Connect_wirelessNetwork/wpa_supplicant.conf

  printf "$ cp /tmp/Connect_wirelessNetwork/wpa_supplicant.conf /boot/wpa_supplicant.conf\n"
  sudo cp /tmp/Connect_wirelessNetwork/wpa_supplicant.conf /boot/wpa_supplicant.conf
  printf "$ cat -n /boot/wpa_supplicant.conf\n"
  sudo cat -n /boot/wpa_supplicant.conf

  printf "Please reboot to connect.\n"
# fi
# if [ $1 = "--help" ] ; then
else
  printf "
# Connect to wireless network
Set the connection information of the wireless network

## usage
\`\`\`
cntwlan.sh connect {ssid} {psk} [{key_mgmt} [{country} [{GROUP} [{ctrl_interface}]]]]
\`\`\`
## parameter
- ssid
  - wireless network name
- psk
  - wireless network password
- key_mgmt
  - safety (Wi-Fi Protected Access(WPA))
  - default: `WPA-PSK`
- country
  - default: `TW`
- GROUP
  - default: `netdev`
- ctrl_interface
  - default: `/var/run/wpa_supplicant`
## Notice: 
- All parameters cannot contain blank characters
- After successful execution, there will be a file `wpa_supplicant.conf` in `/boot`. After rebooting, the file will be removed and the setting will take effect.

## production file format
\`\`\`
ctrl_interface=DIR={ctrl_interface} GROUP={GROUP}
country={country}
network={
  ssid=\"{ssid}\"
  psk=\"{psk}\"
  key_mgmt={key_mgmt}
}
\`\`\`
"
fi
