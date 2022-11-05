# Set Chinese input method
## Install `fbterm` and `fcitx`
```bash
sudo apt install fbterm fbterm-ucimf ucimf-chewing [ucimf-sunpinyin]
sudo apt install fcitx fcitx-chewing fcitx-frontend-fbterm 
```
## Modify file `~/.fbtermrc`
- Modify:
  - `input-method`: 
    - original: 
    - target: `fcitx-fbterm`
## Modify file `~/.config/fcitx/profile`
- Modify:
  - `EnabledIMList`
    - {InputMode}: 
      - original: `True`
      - target: `False`
    - `fcitx-keyboard-us`: 
      - original: `False`
      - target: `True`
    - `chewing`: 
      - original: `False`
      - target: `True`
## Modify file `~/.profile`
Append:
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
