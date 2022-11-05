# Set Chinese input method
## bash
```bash
sudo apt install fbterm fbterm-ucimf ucimf-chewing [ucimf-sunpinyin]
sudo apt install fcitx fcitx-chewing fcitx-frontend-fbterm 
```
## ~/.fbtermrc
- Modify:
  - `input-method`: 
    - original: 
    - target: `fcitx-fbterm`
## ~/.config/fcitx/profile
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
## ~/.profile
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
  - Launch: 
    - FBTerm
    - Fcitx
  - Log:
    - TTY startTime & term
    - environment variable
    - Launcher execution information