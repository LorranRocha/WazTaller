#!/bin/bash

systemVerify() {
    # Verify if it's Linux OS
    if [ "$(uname)" != "Linux" ]; then
        echo "The operating system is not Linux. This script only works on Linux systems."
        return
    fi
    
    # Verify the amount of RAM
    ram_gb=$(free -g | awk 'NR==2 {print $2}')
    if [ "$ram_gb" -lt 4 ]; then
        echo "Insufficient memory: ${ram_gb}GB available. At least 4GB of RAM is required to proceed."
        return
    else
        echo "Verification successful: ${ram_gb}GB of RAM available and Linux operating system."
    fi
}

