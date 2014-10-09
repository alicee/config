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
# workaround for non-working systemctl mongodb
sudo mongod --config /etc/mongodb.conf &
# somehow it's not setting the env variable for gpg agent
gpg-agent --daemon --write-env-file ${HOME}/.gpg-agent-info
export `cat ${HOME}/.gpg-agent-info`
exec i3 
