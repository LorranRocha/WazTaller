#!/bin/bash

# Função para verificar se Python 3 está instalado
check_python3() {
    if command -v python3 &> /dev/null; then
        pip3 install pyyaml psutil
        sudo python3 menu.py
        return 0
    else
        return 1
    fi
}

# Função para instalar Python 3
install_python3() {
    echo "Python 3 não encontrado. Instalando Python 3..."
    
    # Detecta o sistema operacional para instalar o Python 3 corretamente
    if [ -f /etc/debian_version ]; then
        # Sistema baseado em Debian (Ubuntu, etc.)
        sudo apt update
        sudo apt install -y python3
    elif [ -f /etc/redhat-release ]; then
        # Sistema baseado em Red Hat (Fedora, CentOS, etc.)
        sudo yum install -y python3
    elif [ "$(uname)" == "Darwin" ]; then
        # macOS
        # Assumindo que o Homebrew está instalado
        brew install python
    else
        echo "Sistema operacional não suportado para instalação automática. Por favor, instale o Python 3 manualmente."
        exit 1
    fi
}

# Verifica se Python 3 está instalado
if check_python3; then
    pip3 install pyyaml psutil
    sudo python3 menu.py
else
    install_python3
    # Verifica novamente após a instalação
    if check_python3; then
        echo "Python 3 foi instalado com sucesso."
    else
        echo "Falha na instalação do Python 3."
        exit 1
    fi
fi
