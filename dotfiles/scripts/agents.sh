#!/bin/bash

### SSH

if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)" >/dev/null 2>&1
	if ! ssh-add -L | grep -q "$HOME/.ssh/id_jacoba"; then
		ssh-add $HOME/.ssh/id_jacoba >/dev/null 2>&1
	fi
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-react="NVIM_APPNAME=NvimReact nvim"
alias nvim-go="NVIM_APPNAME=goVim nvim"

function nvims() {
	items=("kickstart" "LazyNvim" "AstroNvim" "NvimReact" "goVim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export _ZO_MAXAGE=1000000

# export PNPM_HOME="/home/jacoba/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
