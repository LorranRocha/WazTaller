#!/bin/bash

# Function to check if Python 3 is installed
check_python3() {
    if command -v python3 &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to check if pip3 is installed
check_pip3() {
    if command -v pip3 &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to wait for the package manager to be unlocked
wait_for_unlock() {
    while sudo fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do
        echo "Waiting for the package manager to be unlocked..."
        sleep 1
    done
}

# Function to install Python 3 and pip3
install_python3() {
    echo "Python 3 not found. Installing Python 3..."

    # Wait for the package manager to be unlocked
    wait_for_unlock
    
    # Detect the operating system to correctly install Python 3
    if [ -f /etc/debian_version ]; then
        # Debian-based system (Ubuntu, etc.)
        sudo apt update
        sudo apt install -y python3 python3-pip
    elif [ -f /etc/redhat-release ]; then
        # Red Hat-based system (Fedora, CentOS, etc.)
        sudo yum install -y python3 python3-pip
    elif [ "$(uname)" == "Darwin" ]; then
        # macOS
        # Assuming Homebrew is installed
        brew install python
    else
        echo "Operating system not supported for automatic installation. Please install Python 3 manually."
        exit 1
    fi
}

# Main script execution
main() {
    # Check if Python 3 is installed
    if check_python3; then
        echo "ok"
    else
        install_python3
        # Check again after installation
        if ! check_python3; then
            echo "Failed to install Python 3."
            exit 1
        fi
    fi

    # Check if pip3 is installed
    if ! check_pip3; then
        echo "pip3 not found. Trying to install pip3..."
        sudo apt install -y python3-pip || sudo yum install -y python3-pip || (echo "Failed to install pip3. Please install manually." && exit 1)
    fi

    # Install the required packages
    pip3 install pyyaml psutil

    # Run the menu script
    sudo python3 menu.py
}

# Execute the main function
main
