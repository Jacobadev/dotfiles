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
    alias dotdrop="$JACOBA_DOT/dotdrop.sh"
    
    # Alias para o git dentro do diretório dotfiles
    alias dotgit="git -C $JACOBA_DOT"
    
    # Armazena a versão atual do Python

    # Define a versão do Python para o sistema
    pyenv global system 
    
    dotdrop update -f 
    
    # Adiciona todas as mudanças ao git
    dotgit add -A 
    
    # Faz um commit automático
    dotgit commit -m 'automatic scheduled task' 
    
    # Faz o pull de quaisquer mudanças remotas
    
    # Empurra as alterações para o repositório remoto
    dotgit push --force
    pyenv global $last_version
} 


 dcleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
