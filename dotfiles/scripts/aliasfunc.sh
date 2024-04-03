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


# Defina uma função para sincronizar e fazer o commit das alterações
function dotsync {
    
    export JACOBA_DOT="$HOME/dotfiles"
    
    # Alias para o script dotdrop
    alias dotdrop="$JACOBA_DOT/dotdrop.sh"
    
    # Alias para o git dentro do diretório dotfiles
    alias dotgit="git -C $JACOBA_DOT"
    
    # Sincroniza os dotfiles
    last_version = $(pyenv global)

        # Define a versão do Python para o sistema
        pyenv global system 
        
        # Atualiza os dotfiles usando o dotdrop
        dotdrop update -f 
        
        # Adiciona todas as mudanças ao git
        dotgit add -A 
        
        # Faz um commit automático
        dotgit commit -m 'automatic scheduled task' 
        
        # Faz o pull de quaisquer mudanças remotas
        dotgit pull 
        
        # Empurra as alterações para o repositório remoto
        dotgit push 

    pyenv global $last_version
    
}
    # Chama a função dotsync para sincronizar e fazer o commit das alterações
    dotsync


 dcleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
