# Disabling the Low Voltage Warning (State: `Un-Successful`)
- State: `Un-Successful`
- Reference: 
  - https://pimylifeup.com/raspberry-pi-low-voltage-warning/
  - https://linuxhint.com/avoid-low-voltage-warning-raspberry-pi/

It is also possible to disable the low voltage warning on your Raspberry Pi. However, this is not recommended at all. You will likely run into various issues with your device when using an inadequate power supply.

If you want to ignore this error and disable the under-voltage warning, you can follow the steps below.

These steps will focus on your Raspberry Pi, but you can complete these steps with the SD card inserted into your computer.

---

1. To disable the low voltage warning, we will need to modify the boot config file.

You can begin modifying this file by running the following command on your device.

```bash
sudo nano /boot/config.txt
```

This config file is available on the boot partition when you plug the SD Card on your Raspberry Pi.

---

2. Within this file, you will need to add the following line to the bottom of the file. By setting this value to 1, we are telling it to disable all warning overlays.

`avoid_warnings=1`

Please note this means you will no longer receive any more warnings about your Pi not receiving enough voltage.

---

3. Once you have added this line, save the file by pressing `CTRL + X`, then `Y`, followed by the `ENTER` key.

---

4. We also need to remove the “battery monitor” plugin. This plugin is responsible for showing the notification you may see in the top-right corner of your screen.

---

5. For this change to take effect, you will need to restart your Raspberry Pi.

You can restart by using the following command in the terminal.

```bash
sudo reboot
```