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
    # Exporta o caminho para os dotfiles
    export JACOBA_DOT="$HOME/dotfiles"
    
    # Alias para o script dotdrop
    alias dotdrop="$JACOBA_DOT/dotdrop.sh"
    
    # Alias para o git dentro do diretório dotfiles
    alias dotgit="git -C $JACOBA_DOT"
    
    # Armazena a versão atual do Python
    echo "Última versão do Python: $last_version"
    
    local last_version = $(pyenv global)

    echo "Última versão do Python: $last_version"
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
    echo "Última versão do Python: $last_version"
    pyenv global "$last_version"
}


 dcleanup() {
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
