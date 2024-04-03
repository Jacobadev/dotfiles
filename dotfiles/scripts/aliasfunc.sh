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
    
    # Define o caminho completo para o script dotdrop
    dotdrop_script="$JACOBA_DOT/dotdrop.sh"
    
    # Armazena a versão atual do Python
    local current_version=$(pyenv version-name)
    
    # Define a versão do Python para o sistema
    pyenv global system 
    
    # Atualiza os dotfiles usando o dotdrop
    $dotdrop_script update -f 
    
    # Adiciona todas as mudanças ao git
    /usr/bin/git -C "$JACOBA_DOT" add -A 
    
    # Faz um commit automático
    /usr/bin/git -C "$JACOBA_DOT" commit -m 'automatic scheduled task' 
    
    # Empurra as alterações para o repositório remoto
    /usr/bin/git -C "$JACOBA_DOT" push --force
    
    # Restaura a versão anterior do Python
    pyenv global "$LAST_VERSION"
} 


 dcleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
