#     _               _              
#    | |__   __ _ ___| |__  _ __ ___ 
#    | '_ \ / _` / __| '_ \| '__/ __|
#    | |_) | (_| \__ \ | | | | | (__ 
#    |_.__/ \__,_|___/_| |_|_|  \___|
#                                    

[ -e ~/.fzf ] && . ~/.fzf/completion.bash && . ~/.fzf/key-bindings.bash

[[ -r "/usr/share/z/z.sh" ]] && . /usr/share/z/z.sh 

# HISTORY
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}; history -a; history -c; history -r"
shopt -s cmdhist
shopt -s histappend
HISTCONTROL=ignoredups:erasedups
HISTSIZE= HISTFILESIZE= 
HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
#export HISTTIMEFORMAT="%h %d %H:%M:%S "
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Disable ctrl-s and ctrl-q.
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd 

__git_ps1() { :;}
if [ -e ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "$RETVAL "
}

PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[1;37m\]\w\[\e[m\] \[\e[34m\]\`parse_git_branch\`\[\e[m\]\\$ "

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
