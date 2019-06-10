#     _               _              
#    | |__   __ _ ___| |__  _ __ ___ 
#    | '_ \ / _` / __| '_ \| '__/ __|
#    | |_) | (_| \__ \ | | | | | (__ 
#    |_.__/ \__,_|___/_| |_|_|  \___|
#                                    

# PROMPT
ssh-ps1() {
  [[ $SSH_CONNECTION ]] && printf "%s" "($HOSTNAME) "
}

__git_ps1() { :;}
if [ -e ~/.config/git-prompt.sh ]; then
    . ~/.config/git-prompt.sh
fi

nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "$RETVAL "
}

PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[1;37m\]\w\[\e[m\] \[\e[34m\]\`__git_ps1\`\[\e[m\]\\$ "

# SOURCE

[ -e ~/.config/fzf ] && . ~/.config/fzf/completion.bash && . ~/.config/fzf/key-bindings.bash

[ -r /usr/share/z/z.sh ] && . /usr/share/z/z.sh 

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"


# HISTORY
shopt -s histappend
PROMPT_DIRTRIM=4
HISTCONTROL=ignoredups:erasedups
HISTSIZE= HISTFILESIZE= 
HISTIGNORE='cd:ls:history:lf:x:xs:l:la:exa:xx:newsboat*:vim:z:neofetch'
HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:  "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
#PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
#PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

shopt -s cmdhist

# Disable ctrl-s and ctrl-q.
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd 


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
