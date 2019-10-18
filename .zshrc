#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#     / /\__ \ | | | | | (__ 
#    /___|___/_| |_|_|  \___|
#    
# Edit line in vim 
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Emacs bindings
bindkey -e

# Prompt
autoload -U promptinit
promptinit

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       \
    '%F{5}[%F{2}%b%F{5}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
export PS1='%F{red}%(?..%? )%f%B%~%b $(vcs_info_wrapper)%% '

#Colors completion
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Hist
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE

setopt append_history
setopt hist_ignore_space

# options
set -o always_to_end
set -o append_history
set -o complete_in_word
set -o extendedglob
set -o histappend
set -o histignorealldups
set -o histignorespace
set -o interactivecomments
set -o ksh_glob
set -o no_bang_hist
set -o no_bare_glob_qual
set -o no_extended_glob
set -o noclobber
set -o nullglob
set -o prompt_subst
set -o rmstarsilent
set -o shwordsplit
set -o autocd
#set -o correctall

# completion
autoload -U compinit
compinit -i

LISTMAX=0

# zsh's git tab completion by default is extremely slow. This makes it use
# local files only. See http://stackoverflow.com/a/9810485/945780.
__git_files () {
    _wanted files expl 'local files' _files
}

# "git" is a wrapper for git-variable-author, inherit its completions.
compdef git-variable-author=git

#compdef sshrc=ssh

# Fuzzy matching
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Disable ctrl-s and ctrl-q.
stty -ixon

# ---------------------------------------------------------------------------------------------------
# .
# ---------------------------------------------------------------------------------------------------

[ -e ~/.config/fzf ] && . ~/.config/fzf/completion.zsh && . ~/.config/fzf/key-bindings.zsh

[[ -r "/usr/share/z/z.sh" ]] && . /usr/share/z/z.sh 

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"

# ---------------------------------------------------------------------------------------------------
