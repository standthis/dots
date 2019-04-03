#exec xmonad
#!/bin/sh
# Script to configure X, start common apps, and start xmonad.

# Configure PATH so that we can access our scripts below
#PATH=$PATH:~/.cabal/bin:~/.xmonad/bin

# Configure X
#xsetroot -cursor_name left_ptr &
#xrdb -merge ~/.Xdefaults &
#xmodmap ~/.Xmodmap
#setxkbmap -option "ctrl:nocaps" &

#Remap capslock to escape

# Start a window compositor. This ensures Google Chrome paints correctly.
#xcompmgr -n &

# Set a wallpaper
#feh --bg-fill ~/.wallpaper.jpg &

# Start the system tray
#stalonetray -c ~/.xmonad/stalonetrayrc-single &

# Start two terminals
#terminator &

# Start a browser
#firefox &

# Start screensaver
#killall gnome-screensaver &
#xscreensaver -no-splash &

# Start sound server
#pulseaudio --start --log-target=syslog &
#xsetroot -cursor_name left_ptr
unclutter & 
setxkbmap -option caps:escape
exec i3
