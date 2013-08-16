# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
eval `ssh-agent`
setxkbmap -option grp:shifts_toggle,grp:win_switch de,us
xrdb -merge /home/benjo/.Xresources
exec startlxde
