#!/bin/bash

#Verify on debian
if [ -f /etc/debian_version ]; then
    echo "[*] Confirmed on debain, verifying users..."

    user=$( whoami )
    echo "[*] Running as user $user"

    if [ $user = 'root' ]; then
        echo "[*] Installing packages..."

        apt update

        apt install zsh vim glances python3 php apache2 tmux curl wget git 
    
    else
        echo "[!] Not running as root, quitting!"

    fi

    else
        echo "[!] Not on Debian, quitting!"


fi