autoload -Uz promptinit
promptinit
prompt walters

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt ignore_eof
setopt share_history

bindkey -v
bindkey '^r' history-incremental-search-backward

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

KEYTIMEOUT=1
HISTSIZE=10000
SAVEHIST=250000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b ~/.dircolors)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls="ls -F --color=auto"

export TERM=screen-256color
export PATH=~/.bin:~/go/bin:$PATH
export GOPATH=~/go
export EDITOR=vim

heads() {
  git for-each-ref --sort=-committerdate refs/heads/
}

dotfiles=$(dirname `readlink -f $HOME/.zshrc`)
. $dotfiles/z/z.sh

. ${HOME}/.zshrc.local
