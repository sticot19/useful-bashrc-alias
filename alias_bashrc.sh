#!/usr/bin/env sh

echo "
		*****************************
		*                           *
		*    Création des aliases   *
		*                           *
		*****************************
"
cp ~/.bashrc ~/.backup_bashrc
echo "
		*****************************
		*                           *
		*    	  Général			*
		*                           *
		*****************************
"
# Général
echo "" >> ~/.bashrc
echo "alias ll='ls -l'" >> ~/.bashrc
echo "alias la='ls -a'" >> ~/.bashrc
echo "alias lla='ls -la'" >> ~/.bashrc

echo "alias ..='cd ..'" >> ~/.bashrc
echo "alias ...='cd ../..'" >> ~/.bashrc
echo "alias ~='cd'" >> ~/.bashrc

echo "alias docs='cd ~/Documents'" >> ~/.bashrc
echo "alias dl='cd ~/Téléchargements'" >> ~/.bashrc

echo "alias update='sudo apt update && sudo apt upgrade -y'" >> ~/.bashrc
echo "alias showip=\"ip addr show | grep 'inet ' | awk '{ print \$2; }' | sed 's/\/.*\$//'\"" >> ~/.bashrc

echo "alias shutdown='sudo shutdown -h now'" >> ~/.bashrc

echo "alias cls='clear'" >> ~/.bashrc
echo "alias clsh='history -c'" >> ~/.bashrc

echo "alias edbash='nano ~/.bashrc'" >> ~/.bashrc
echo "alias rbashrc='. ~/.bashrc'" >> ~/.bashrc

echo "alias term='gnome-terminal'" >> ~/.bashrc

echo "
addssh(){
    if [ \$# -ne 2 ]; then
        echo \"Usage: add_ssh_alias <alias_name> <ssh_command>\"
        return 1
    fi

    local alias_name=\$1
    local ssh_command=\$2

    echo \"alias \$alias_name='\$ssh_command'\" >> ~/.bashrc

    . ~/.bashrc

    echo \"Alias '\$alias_name' ajouté avec succès.\"
}
" >> ~/.bashrc

echo "
compressdir() {
    tar -czvf \"\$1.tar.gz\" \"\$1\"
}
" >> ~/.bashrc

echo "
extract() {
    if [ -f \"\$1\" ] ; then
        case \"\$1\" in
            *.tar.bz2)   tar xjf \"\$1\" ;;
            *.tar.gz)    tar xzf \"\$1\" ;;
            *.bz2)       bunzip2 \"\$1\" ;;
            *.rar)       unrar x \"\$1\" ;;
            *.gz)        gunzip \"\$1\" ;;
            *.tar)       tar xf \"\$1\" ;;
            *.tbz2)      tar xjf \"\$1\" ;;
            *.tgz)       tar xzf \"\$1\" ;;
            *.zip)       unzip \"\$1\" ;;
            *.Z)         uncompress \"\$1\" ;;
            *.7z)        7z x \"\$1\" ;;
            *)           echo \"'\$1' cannot be extracted via extract()\" ;;
        esac
    else
        echo \"'\$1' n'est pas un fichier valide ! \"
    fi
}
" >> ~/.bashrc

echo "
mkcd() {
    mkdir -p \"\$1\" && cd \"\$1\"
}
" >> ~/.bashrc

echo "
		*****************************
		*                           *
		*    		GIT 			*
		*                           *
		*****************************
"

# GIT alias
echo "alias gs='git status'" >> ~/.bashrc
echo "alias ga='git add'" >> ~/.bashrc
echo "alias gc='git commit -m'" >> ~/.bashrc
echo "alias gp='git push'" >> ~/.bashrc
echo "alias gl='git log --oneline --graph --all --decorate'" >> ~/.bashrc
echo "alias gco='git checkout'" >> ~/.bashrc
echo "alias gb='git branch'" >> ~/.bashrc
echo "alias gd='git diff'" >> ~/.bashrc

echo "
gcl(){
    git clone \$1 \$2 && cd \$2
}
" >> ~/.bashrc

echo "
		*****************************
		*                           *
		*    		Docker			*
		*                           *
		*****************************
"

# Docker
echo "alias dcls='docker ps -a'" >> ~/.bashrc
echo "alias dcsta='docker start'" >> ~/.bashrc
echo "alias dcsto='docker stop'" >> ~/.bashrc
echo "alias dcrm='docker container prune -f'" >> ~/.bashrc
echo "alias dcclean='docker system prune -a --volumes -f'" >> ~/.bashrc

echo "
dclogs() {
    docker logs -f \"\$1\"
}
" >> ~/.bashrc

echo "
dcbuild() {
    docker build -t \"\$1\"
}
" >> ~/.bashrc

. ~/.bashrc