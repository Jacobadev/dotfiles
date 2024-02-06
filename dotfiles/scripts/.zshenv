. $HOME/scripts/secrets.sh
# Secrets.example
# export GITHUB_TOKEN=

export BSP=$HOME/.config/bspwm/bspwmrc
export KBD=$HOME/.config/bspwm/sxhkdrc
export DOTS=$HOME/jacoba_dot/dotfiles/home/jacoba/
export XDG_CONFIG_HOME=$HOME/.config
export PATH=$PATH:$HOME/.cargo/bin


export VISUAL="${EDITOR}"
export EDITOR='lvim'
export TERMINAL='alacritty'
export BROWSER='brave'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export XDG_CONFIG_HOME="/home/jacoba/.config"
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init zsh)"


export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
