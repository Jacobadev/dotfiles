alias cat='bat --theme="OneHalfDark" --style="full" --language='py''

# DISK USAGE

alias du='duf'
# DOCKER

alias d='docker'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcub='docker compose up --build'
alias dcd='docker compose down'
alias dv='docker images -a && docker ps -a'

### NAVIGATIONS
# CD
#
alias .1='cd ..'
alias .2='cd ../../../'
alias .3='cd ../../../../'
alias .4='cd ../../../../'
alias .4='cd ../../../../../'
## LS
#
alias lS='exa -1 ' # one column, just names
alias lt='exa --tree --level=4'
alias l='exa' # ls
alias ls='exa -la'
alias ll='exa -lbGF --git' # long list

#### GIT
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count=45"
alias gp='git push origin HEAD'
alias gpu='git push --set-upstream origin main'

alias gd='git diff'
alias gca='git commit --amend --no-edit'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb="git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
alias gbd="git branch -D"
alias ge='git-edit-new'

#  HISTORY

alias th='tail -n40 < <(history 1 | cat)'

## ALIAS

alias al="alias | cat"
# VIM

alias vim="/bin/nvim"
alias v="nvim"
### RUN AGENTS

### CLIP
alias clip="xclip -sel clip <"
### POETRY
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
alias zs="vim ~/.zshrc"
alias sz="source ~/.zshrc"

### BSP KBD
alias bsp="vim ~/.config/bspwm/bspwmrc"
alias kbd="vim ~/.config/bspwm/sxhkdrc"

## POETRY
alias psh="poetry shell"
alias pa="poetry add"

## PACMAN
alias ps="sudo pacman --noconfirm -S"
alias pr="sudo pacman --noconfirm -R"
alias p="pacman"
