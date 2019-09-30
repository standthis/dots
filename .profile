#!/bin/sh
# Profile file. Runs on login.

# Here in attempt to fix SSH login bash history deletion
HISTSIZE= HISTFILESIZE= 
# Adds `~/.scripts` and all subdirectories to $PATH
export PATH=$PATH:$HOME/bin/
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
export PAGER="less"
export _Z_DATA="$HOME/.config/zdata/z"
export WORK_START_HOUR="6"
export WORK_END_HOUR="20"
export WORK_START_DAY="1"
export WORK_END_DAY="7"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:\
do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:\
sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:\
*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:*.jpg=38;5;141:\
*.jpeg=38;5;147:*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:\
*.webm=38;5;215:*.wmv=38;5;216:*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;223:\
*.mp3=38;5;218:*akefile=38;5;176:*.pdf=38;5;253:*.csv=38;5;255:*.ods=38;5;224:*.odt=38;5;146:\
*.tex=38;5;225:*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:\
*.epub=38;5;152:*.mobi=38;5;105:*.m4b=38;5;222:*.conf=38;5;121:\
*.md=38;5;224:*.markdown=38;5;224:*.ico=38;5;140:*.iso=38;5;205:\
*.pcap=38;5;37"

export EXA_COLORS="da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;111:xa=38;5;239:*.ts=00"
#mpd >/dev/null 2>&1 &
#[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

#echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
#sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null
