# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Python environement
#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh

# z directory navigation
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh 

# Path to your oh-my-zsh installation.
ZSH=$HOME/.config/oh-my-zsh
#ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
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

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
#  vi-mode
)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------------------------------------------
#  ALIASES
# -------------------------------------------------------------------------------------------------------
#alias 'rm=rm -i' 
#alias sudo='sudo' <------------------------------  
alias eza='ssh eza@ezee'
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
#alias mp='ncmpcpp -b $HOME/.ncmpcpp/ncmpcpp.bindings'
alias ccat='highlight --out-format=ansi'
alias bk='cd $OLDPWD'
alias c='cd'
alias dotnet='TERM=xterm dotnet'
alias blank='sleep 2; xset dpms force off'
alias p='mpv $(xclip -selection cliboard -o)'
alias clip='youtube-dl $(xclip -selection cliboard -o)'
alias xc='xclip -selection clipboard'
alias v='vim'
alias tmuxn='tmux new -s'
alias tmuxa='tmux a -t'
alias ra='ranger'
alias gt='gotop'
alias gtc='gotop -c monokai'
alias gtm='gotop -m'
alias ethspeed='speedometer -r eno1'
alias sp='sudo pacman'
alias nb='newsboat -r'
alias sx='startx'
alias qute='cd $HOME/.config/qutebrowser/'
alias zrc='vim $HOME/.zshrc'
alias img='cd $HOME/images; ra'
alias dl='cd $HOME/Downloads'
alias szrc='source $HOME/.zshrc'
alias szsh='source $HOME/.zshrc'
alias lap='ssh eets@laptop'
alias dee='ssh dee@dee'
alias i3c='vim $HOME/.config/i3/config'
alias woman='man'
alias pi='ssh pi@192.168.1.86'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias is='cd $HOME/honours/infosec'
alias t='task'
alias publicip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias pub='dig +short myip.opendns.com @resolver1.opendns.com'
alias publ='ssh -t dee@dee "cat .scripts/pub.ip"'
alias libr='cd $HOME/honours/lib; ranger'
alias proj='cd $HOME/honours/projMan/proposal; ranger'
alias ytv='youtube-viewer -C'
alias yt='youtube-dl'
alias ma='clear; mpv --no-video --term-osd-bar'
alias asc='ssh asc@space'
alias vol='amixer -M get Master'
alias tsm='transmission-remote'
alias yt="youtube-dl --verbose --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias face="zathura $HOME/honours/interfacing/LectureNotes_Interfacing1.pdf & disown"
#alias mega="zathura $HOME/honours/interfacing/Mega16-datasheet.pdf & disown"
alias yays="yay && updated"
alias yayd="yay && updated"
alias updated="pkill -RTMIN+2 i3blocks"
alias weather="curl -Ss 'https://wttr.in'"

perf () {
  curl -o /dev/null -s -w "%{time_connect} + %{time_starttransfer} = %{time_total}\n" "$1"
}

vf() { fzf | xargs -r -I % $EDITOR % ;}
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
        echo launching MPD
        mpd
        echo launched
    fi
    ncmpcpp -b $HOME/.ncmpcpp/ncmpcpp.bindings
}

za () {
    zathura "$1" & disown 
}

7zp () {
    7z a -p -mx=9 -mhe -t7z "$1.7z" "$1"
}

fdsk () {
   fd $@ | sk
}

rgsk () {
   rg $@ | sk
}

pdf2png () {
	pdftoppm "$1" "${1%.*}" -png
}

png2ppm () {
    png2pnm -n "$1" > "${1%.*}.ppm"
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
        amixer -M sset 'Master' $1% && pkill -RTMIN+1 i3blocks
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

h2b () {
    echo "ibase=16; obase=2; $@" | bc 
}
