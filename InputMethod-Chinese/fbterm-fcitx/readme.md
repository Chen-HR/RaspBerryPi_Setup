# Set InputMethod-Chinese (use `fbterm` and `fcitx`)
## Install `fbterm` and `fcitx`
```bash
sudo apt install fbterm fbterm-ucimf ucimf-chewing # ucimf-sunpinyin
sudo apt install fcitx fcitx-chewing fcitx-frontend-fbterm # fcitx-frontend-all
```
## 
```bash
sudo adduser $USER video # or "sudo gpasswd -a $USER video"
```
## 
```bash
sudo setcap 'cap_sys_tty_config+ep' /usr/bin/fbterm
```
## Modify in file `~/.fbtermrc`
- `input-method`: 
  - original: 
  - target: `fcitx-fbterm`
## Modify in file `~/.config/fcitx/profile`
- `EnabledIMList`:
  - Select input methods to enable
  - {InputMode}: 
    - original: `True`
    - target: `False`
  - `fcitx-keyboard-us`: 
    - original: `False`
    - target: `True`
  - `chewing`: 
    - original: `False`
    - target: `True`
## Append in file `~/.profile`
```bash
date +"%Y/%m/%d %H:%M:%S:%N $TERM $LANG" >> ~/fcitx-fbterm-helper.log ;
if [ "$TERM" = "linux" -a "$LANG" = "zh_TW.UTF-8" ]; then
    # printf "$ env\n" >>  ~/fcitx-fbterm-helper.log ;
    # env >>  ~/fcitx-fbterm-helper.log ;
    fcitx-fbterm-helper -d 0 -l >> ~/fcitx-fbterm-helper.log ;
    # /home/pi/.config/fcitx
fi
```
- Illustrate: 
  - This program is executed when a new TTY is opened
  - Execution condition:
    - Execute on tty and The language is set to `zh_TW.UTF-8`
  - Launch: 
    - FBTerm
    - Fcitx
  - Log:
    - TTY startTime & term
    - (ignoring) environment variable
    - Launcher execution information
