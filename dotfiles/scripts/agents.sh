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

# export PNPM_HOME="/home/jacoba/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
