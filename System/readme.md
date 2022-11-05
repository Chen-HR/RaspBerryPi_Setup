# config and update
## config
```
sudo raspi-config
```
- System Options       (Configure system settings)
  - Wireless LAN      (Enter SSID and passphrase)
  - Audio             (Select audio out through HDMI or -5mm jack)
  - Password          (Change password for the 'pi' user)
  - Hostname          (Set name for this computer on a network)
  - Boot / Auto Login (Select boot into desktop or to command line)
    - Console           (Text console, requiring user to login)
    - Console Autologin (Text console, automatically logged in as 'pi' user)
      - `Ensures`
    - Desktop           (Desktop GUI, requiring user to login)
    - Desktop Autologin (Desktop GUI, automatically logged in as 'pi' user)
  - Network at Boot   (Select wait for network connection on boot)
  - Splash Screen     (Choose graphical splash screen or text boot)
  - Power LED         (Set behaviour of power LED)
- Display Options      (Configure display settings)
  - Resolution      (Set a specific screen resolution)
    - `Default Monitor preferred resolution`
  - Underscan       (Remove black border around screen)
  - Pixel Doubling  (Enable/disable 2x2 pixel mapping)
  - Screen Blanking (Enable/disable screen blanking)
- Interface Options    (Configure connections to peripherals)
- Performance Options  (Configure performance settings)
- Localisation Options (Configure language and regional settings)
  - Locale       (Configure language and regional settings)
    - `en_US.UTF-8 UTF-8`
    - `zh_TW.UTF-8 UTF-8`
  - Timezone     (Configure time zone)
    - `Asia`
      - `Taipei`
  - Keyboard     (Set keyboard layout to match your keyboard)
    - `Generic 101-key PC`
  - WLAN Country (Set legal wireless channels for your country)
    - `TW Taiwan`
- Advanced Options     (Configure advanced settings)
  - Expand Filesystem       (Ensures that all of the SD card is available)
    - `Ensures`
  - GL Driver               (Enable/disable experimental desktop GL driver)
  - Compositor              (Enable/disable xcompmgr composition manager)
  - Network Interface Names (Enable/disable predictable network i/f names)
  - Network Proxy Settings  (Configure network proxy settings)
- Update               (Update this tool to the latest version)
  - `Ensures`
- About raspi-config   (Information about this configuration tool)
## update
```
sudo rpi-update
```