#     _               _              
#    | |__   __ _ ___| |__  _ __ ___ 
#    | '_ \ / _` / __| '_ \| '__/ __|
#    | |_) | (_| \__ \ | | | | | (__ 
#    |_.__/ \__,_|___/_| |_|_|  \___|
#                                    

[ -e ~/.fzf ] && . ~/.fzf/completion.bash && . ~/.fzf/key-bindings.bash

# HISTORY
export HISTTIMEFORMAT="%h %d %H:%M:%S "
PROMPT_COMMAND='history -a'
HISTSIZE= HISTFILESIZE= 
shopt -s histappend
shopt -s cmdhist

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

export PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[1;37m\]\w\[\e[m\] \[\e[34m\]\`parse_git_branch\`\[\e[m\]\\$ "

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
