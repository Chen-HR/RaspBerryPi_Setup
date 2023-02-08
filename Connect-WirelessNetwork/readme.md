# Connect to wireless network
Set the connection information of the wireless network

## usage
```
cntwlan.sh connect {ssid} {psk} [{key_mgmt} [{country} [{GROUP} [{ctrl_interface}]]]]
```
## parameter
- ssid
  - wireless network name
- psk
  - wireless network password
- key_mgmt
  - safety (Wi-Fi Protected Access（WPA）)
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
```
ctrl_interface=DIR=${ctrl_interface} GROUP=${GROUP}
country=${country}
network={
  ssid=\"${ssid}\"
  psk=\"${psk}\"
  key_mgmt=${key_mgmt}
}
```
