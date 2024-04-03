#!/bin/zsh
#
 gac() {
	git add -A && git commit -m"$*"
}
 h() {
	history | rg "$1" | cat
}
 alr() {
	alias | rg "$1" | cat
}



function dotsync {
    export LAST_VERSION=$(pyenv global)
    export JACOBA_DOT="$HOME/dotfiles"
    
    # Alias para o script dotdrop
    dotdrop="$JACOBA_DOT/dotdrop.sh"
    
    # Alias para o git dentro do diretório dotfiles
    dotgit="git -C $JACOBA_DOT"
    
    # Define a versão do Python para o sistema
    pyenv global system &>/dev/null
    
    # Atualiza os dotfiles usando o dotdrop
    dotdrop update -f &>/dev/null
    
    # Adiciona todas as mudanças ao git
    dotgit add -A &>/dev/null
    
    # Faz um commit automático
    dotgit commit -m 'automatic scheduled task' &>/dev/null
    
    # Faz o pull de quaisquer mudanças remotas
    dotgit pull &>/dev/null
    
    # Empurra as alterações para o repositório remoto
    dotgit push &>/dev/null
    
    # Restaura a versão anterior do Python
    pyenv global "$LAST_VERSION" &>/dev/null
    
    notify-send "Dotfiles updated" &>/dev/null
} 


 dcleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
