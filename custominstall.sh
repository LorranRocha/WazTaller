#!/bin/bash

indexerInstall() {
    config=""

    # Get custom installation information from the user
    config+="nodes:\n"
    # Indexer nodes
    read -p "Enter the number of indexer nodes: " indexer_nodes
    indexer_info=""
    for ((i=1; i<=$indexer_nodes; i++)); do
        read -p "Enter the name for indexer node $i: " name
        read -p "Enter the IP for indexer node $i: " ip
        indexer_info+="  - name: $name\n    ip: $ip\n"
    done
    config+="  indexer:\n$indexer_info"

    # Server nodes
    read -p "Enter the number of server nodes: " server_nodes
    server_info=""
    for ((i=1; i<=$server_nodes; i++)); do
        read -p "Enter the name for server node $i: " name
        read -p "Enter the IP for server node $i: " ip
        read -p "Enter the node type for server node $i (master/worker): " node_type
        server_info+="  - name: $name\n    ip: $ip\n    node_type: $node_type\n"
    done
    config+="  server:\n$server_info"

    # Dashboard nodes
    read -p "Enter the number of dashboard nodes: " dashboard_nodes
    dashboard_info=""
    for ((i=1; i<=$dashboard_nodes; i++)); do
        read -p "Enter the name for dashboard node $i: " name
        read -p "Enter the IP for dashboard node $i: " ip
        dashboard_info+="  - name: $name\n    ip: $ip\n"
    done
    config+="  dashboard:\n$dashboard_info"

    # Save configuration to config.yml
    echo -e "$config" > ./config.yml
    echo "Custom installation configuration has been saved to ./config.yml"

    # Run the Wazuh installation assistant with the option --generate-config-files to generate the Wazuh cluster key, certificates, and passwords necessary for installation.
    bash wazuh-install.sh --generate-config-files
}

managerInstall() {
    echo "Manager"
}

serverInstall() {
    echo "Server"
}

customInstall() {
    # Install Wazuh Indexer
    indexerInstall

    # Install Wazuh Manager
    managerInstall

    # Install Wazuh Server
    serverInstall
}

customInstall
