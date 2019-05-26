export PATH=$HOME/bin:/usr/local/bin:$PATH

# z directory navigation
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh 

# Path to your oh-my-zsh installation.
ZSH=$HOME/.config/oh-my-zsh

#ZSH_THEME
if [[ -n $SSH_CONNECTION ]]; then
    ZSH_THEME="erraku"
else
    ZSH_THEME="sunaku"
fi
#ZSH_THEME="sunaku"
#ZSH_THEME="simple"
#ZSH_THEME="jreese"
#ZSH_THEME="flazz"
#ZSH_THEME="gentoo"
#ZSH_THEME="cypher"
#ZSH_THEME="mh"
#ZSH_THEME="evan"

DISABLE_AUTO_UPDATE="true"

plugins=(
  git
#  vi-mode
)


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------------------------------------------
#  ALIASES
# -------------------------------------------------------------------------------------------------------
alias ls='ls -hN --color=auto --group-directories-first'
#alias ls='ls -hN --color=auto'
alias x='exa'
alias xs='exa'
alias xl='exa -lg'
alias xa='exa -a'
alias xla='exa -lag'
alias xx='exa -lag'
alias xxl='exa --color=always -lag | less'
alias diff='diff --color=auto'
alias ccat='highlight --out-format=ansi'
alias bk='cd $OLDPWD'
alias c='cd'
alias xc='xclip -selection clipboard'
alias v='vim'
alias gt='gotop -c monokai'
alias sx='startx'
alias qute='cd $HOME/.config/qutebrowser/'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias t='task'
alias ytv='youtube-viewer -C'
alias yt='youtube-dl'
alias ma='clear; mpv --no-video --term-osd-bar'
alias vol='amixer -M get Master'
alias tsm='transmission-remote'
alias yt="youtube-dl --verbose --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias weather="curl -Ss 'https://wttr.in'"
alias lock="slock"
#alias lock="i3lock -ef -c 050608"
alias p="mpc toggle"
#alias p="mpc -q toggle"

# -------------------------------------------------------------------------------------------------------
#  FUNCTIONS
# -------------------------------------------------------------------------------------------------------
vf() { fzf | xargs -r -I % $EDITOR % ;}
##
# nnn cd on quit
export NNN_TMPFILE="/tmp/nnn"
export NNN_USE_EDITOR=1    
n()
{
    nnn "$@"
    if [ -f $NNN_TMPFILE ]; then
        . $NNN_TMPFILE
        rm $NNN_TMPFILE
    fi
}
##

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

bright () {
    display=$(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1)
    if (( $(awk 'BEGIN {print ("'$1'" >= "'0.1'" && "'$1'" <= "'1'")}') )); then
        xrandr --output "$display" --brightness "$1"
    else
        xrandr -q --verbose | grep Brightness | head -n1 | xargs | grep Brightness
    fi
}

mp () {
    if ! pgrep -x mpd > /dev/null
    then
        echo 'launching mpd ...'
        mpd
        echo 'launched!'
    fi
    ncmpcpp -b $HOME/.ncmpcpp/ncmpcpp.bindings
}

za () {
    zathura "$1" & disown 
}

7zp () {
    7z a -p -mx=9 -mhe -t7z "$1.7z" "$1"
}

cl () {
    ccat $1 | less 
}

cln () {
    ccat -n $1 | less 
}

setvol() {
    if [ "$1" -lt "20" ]
    then    
        amixer -M sset 'Master' $1% #&& pkill -RTMIN+1 i3blocks
    else 
        echo gtfo | grep --color gtfo
    fi
}

unzipown() { 
    for i in *.zip; do unzip "$i" -d "${i%%.zip}"; done
}

wav2mp3() {
    for i in *.wav; do ffmpeg -i "$i" -ab 320k "${i%.*}.mp3"; done
}

flac2mp3() {
    for i in *.flac; do ffmpeg -i "$i" -ab 320k "${i%.*}.mp3"; done
}

flac24to16() {
    mkdir resampled 
    for flac in *.flac; do sox -S "${flac}" -r 44100 -b 16 ./resampled/"${flac}"; done
}


# Move pape to qutebrower wallpaper and correct link
qwall() { 
    ln -sf $(pwd)/$1 $HOME/.config/qutebrowser/startpage/pape
}

# Colored less 
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
# mkdir, mv, cd
mkmv() {
    name=$(echo $1 | cut -f 1 -d '.')
    mkdir $name
    mv $1 $name
    cd $name
}

# Use awk as calculator
calc() { awk "BEGIN {print $*}"; }

pdfcompress ()
{
    gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1; 
}

# Base conversion with bc
h2d () {
    echo "ibase=16; $@" | bc 
}

d2h () {
    echo "obase=16; $@" | bc 
}

d2b () {
    echo "obase=2; $@" | bc 
}

b2d () {
    echo "ibase=2; $@" | bc 
}

b2h () {
    echo "obase=16; ibase= 2; $@" | bc 
}
