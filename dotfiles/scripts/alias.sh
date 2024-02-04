alias cat='bat --theme="OneHalfDark" --style="full" --language='py''

# DISK USAGE

alias du='duf'
# DOCKER

alias d='docker'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcub='docker compose up --build'
alias dcd='docker compose down'

### NAVIGATIONS
# CD
#
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
## LS
#
alias lS='exa -1 ' # one column, just names
alias lt='exa --tree --level=2'
alias l='exa' # ls
alias ls='exa -lah'
alias ll='exa -lbGF --git' # long list

# Dotdrop Git

export JACOBA_DOT=$HOME/jacoba_dot
alias dotdrop="$JACOBA_DOT/dotdrop.sh"
alias dotgit="git -C $JACOBA_DOT"
alias dotsync="dotdrop update -f && dotgit add -A && dotgit commit -m 'automatic scheduled task' && dotgit pull && dotgit push"
#

#### GIT
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count=50"
alias gp='git push origin HEAD'
alias gsu='git push --set-upstream'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

#  HISTORY

alias h='history 1 | rg'
alias th='tail -n40 < <(history 1 | cat)'

## ALIAS

alias al="alias | cat"
alias alr="alias | rg"
# VIM LVIM

alias vim="nvim"
### RUN AGENTS

### CLIP
alias clip="xclip -sel clip <"
### POETRY
alias psh="poetry shell"
### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
### NVM
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

### TMUX
alias t='tmux attach || tmux new-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'
### todas menos a atual
alias tmks='tmux kill-session -a'
alias tks='tmux kill-server'
# Creates a new session
alias tn='tmux new-session'
alias tmk='tmux kill-session -t'
# Lists all ongoing sessions
alias tl='tmux list-sessions'

### CLEAR
alias c='clear'

### CONFIGS
## ZSH
alias zs="lvim ~/.zshrc"
alias sz="source ~/.zshrc"

### BSP KBD
alias bsp="vim ~/.config/bspwm/bspwmrc"
alias kbd="vim ~/.config/bspwm/sxhkdrc"

## POETRY

alias pa="poetry add"
