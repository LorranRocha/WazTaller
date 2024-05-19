#!/bin/bash

fastInstall() {
    echo "You're about to install Wazuh using the fast installation."
    while true; do
        read -p "Do you want to proceed? (y/n): " choice
        choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')
        if [ "$choice" = 'y' ]; then
            echo "Starting the fast installation of Wazuh..."
            curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
            echo "Wazuh installation completed."
            break
        elif [ "$choice" = 'n' ]; then
            echo "Installation aborted by user."
            break
        else
            echo "Invalid input. Please enter 'y' to proceed or 'n' to cancel."
        fi
    done
}

