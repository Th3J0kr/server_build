#!/bin/bash


installOhMyZSH() {
    echo "[*] Installing Oh My ZSH..."
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "[*] Finished isntalling oh-my-zsh, configuring..."
    if [ -f 'config/.zshrc' ]; then
        if [ -f '/root/.zshrc' ]; then
            mv '/root/.zshrc' '/root/.zshrc.bak'
        fi
        cp 'config/.zshrc' '/root/.zshrc'
        echo "[*] Done configuring zshrc!"
    else
        echo "[!] No config file provided, leaving defaults"
    fi
}

configureTmux() {
    echo "[*] Configuring tmux with oh-my-tmux"
    git clone https://github.com/gpakosz/.tmux.git '/root/.tmux'
    if [ -d 'config/.tmux' ]; then
        if [ -d '/root/.tmux' ]; then
            rm -rf '/root/.tmux'
        fi
        cp -r 'config/.tmux' '/root/.tmux'
        ln -s -f '/root/.tmux/.tmux.conf'
        cp '/root/.tmux/.tmux.conf.local' '/root/'
        echo "[*] Done configuring tmux!"
    else
        echo "[!] No config file provided, leaving defaults"
    fi
}

configureSSH() {
    echo "[*] Configuring SSH server"
    if [ -f 'config/sshd_config' ]; then
        if [ -f '/etc/ssh/sshd_config' ]; then
            mv '/etc/ssh/sshd_config' '/etc/ssh/sshd_config.bak'
            cp 'config/sshd_config' '/etc/ssh/sshd_config'
            echo "[*] Restarting SSH server..."
            systemctl restart sshd
        else
            echo "[!] No sshd_config file, check openssh-server installation!"
        fi
        echo "[*] Done configuring SSH server!"
    else
        echo "[!] No config file provided, leaving defaults"
    fi
}

main() {
    #Verify on debian
    if [ -f /etc/debian_version ]; then
        echo "[*] Confirmed on debain, verifying users..."

        user=$( whoami )
        echo "[*] Running as user $user"

        if [ $user = 'root' ]; then
            echo "[*] Installing packages..."

            apt update
            apt install zsh vim glances python3 php apache2 tmux curl wget git openssh-server
        
        else
            echo "[!] This script needs to be run as root, quitting!"
        fi

    elif type lsb_release >/dev/null 2>&1; then
        os=$( lsb_relase -si )
        if [ $os = 'Ubuntu' ]; then
            echo "[*] Confirmed on debain, verifying users..."

            user=$( whoami )
            echo "[*] Running as user $user"

            if [ $user = 'root' ]; then
                echo "[*] Installing packages..."

                apt update
                apt install zsh vim glances python3 php apache2 tmux curl wget git openssh-server
            
            else
                echo "[!] This script needs to be run as root, quitting!"
            fi
        fi
    
    else
        echo "[!] Not on Debian based system, quitting!"
    fi
}
main "$@"
exit 0