#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi

