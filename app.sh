#!/bin/bash

# Importar funções
source sysreq.sh
source fastinstall.sh
source custominstall.sh

# Verificar os Requisitos do Sistema
verify_system_requirements() {
    systemVerify
    clear
}

# Mostrar o Menu
show_menu() {
    cat <<EOF
   __    __          _____      _ _           
/ / /\ \ \__ _ ___/__   \__ _| | | ___ _ __ 
\ \/  \/ / _\` |_  / / /\/ _\` | | |/ _ \ '__|
 \  /\  / (_| |/ / / / | (_| | | |  __/ |   
  \/  \/ \__,_/___|\/   \__,_|_|_|\___|_|   
                                           
    WazTaller

    1) Fast Installation
    2) Custom Installation
    3) Exit
EOF
}

main_menu() {
    while true; do
        show_menu
        read -p "Please select an option: " choice
        choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')
        case $choice in
            1)
                echo "You selected Fast Installation."
                fastInstall
                ;;
            2)
                echo "You selected Custom Installation."
                customInstall
                ;;
            3)
                echo "Exiting..."
                break
                ;;
            *)
                echo "Invalid option, please try again."
                ;;
        esac
    done
}

# Função principal para iniciar o script
if [ "$0" = "$BASH_SOURCE" ]; then
    verify_system_requirements
    main_menu
fi
