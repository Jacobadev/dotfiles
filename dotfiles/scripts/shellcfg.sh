export PNPM_HOME="/home/jacoba/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
sleep 1

# Iniciar o agente SSH em segundo plano
eval "$(ssh-agent -s)" > /dev/null 2>&1 &

# Adicionar a chave SSH em segundo plano se ainda não estiver adicionada
ssh-add -L | grep -q "$HOME/.ssh/id_jacoba" || ssh-add $HOME/.ssh/id_jacoba > /dev/null 2>&1 &

# Inicia o agente SSH, se não estiver em execução
#!/bin/bash

# Caminho do diretório do script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOG_FILE="$SCRIPT_DIR/script_log.txt"

# Iniciar o agente SSH se não estiver em execução
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" &

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)" &
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" &  # This loads nvm bash_completion
