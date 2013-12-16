/usr/bin/gnome-keyring-daemon --start --components=gpg
/usr/bin/gnome-keyring-daemon --start --components=pkcs11
/usr/bin/gnome-keyring-daemon --start --components=secrets
/usr/bin/gnome-keyring-daemon --start --components=ssh
# map caps lock to escape
setxkbmap -option caps:escape
xrdb -merge .Xdefaults
xmodmap .Xmodmap
# disable touchpad while typing
syndaemon -k -i 0.25 -d &
feh --bg-scale ~/.background
exec i3 
