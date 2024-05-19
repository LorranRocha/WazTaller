import yaml
import os

def indexerInstall():
    config = {}

    # Get custom installation information from the user
    config['nodes'] = {}

    # Indexer nodes
    indexer_nodes = int(input("Enter the number of indexer nodes: "))
    indexer_info = []
    for i in range(indexer_nodes):
        name = input(f"Enter the name for indexer node {i+1}: ")
        ip = input(f"Enter the IP for indexer node {i+1}: ")
        indexer_info.append({'name': name, 'ip': ip})
    config['nodes']['indexer'] = indexer_info

    # Server nodes
    server_nodes = int(input("Enter the number of server nodes: "))
    server_info = []
    for i in range(server_nodes):
        name = input(f"Enter the name for server node {i+1}: ")
        ip = input(f"Enter the IP for server node {i+1}: ")
        node_type = input(f"Enter the node type for server node {i+1} (master/worker): ")
        server_info.append({'name': name, 'ip': ip, 'node_type': node_type})
    config['nodes']['server'] = server_info

    # Dashboard nodes
    dashboard_nodes = int(input("Enter the number of dashboard nodes: "))
    dashboard_info = []
    for i in range(dashboard_nodes):
        name = input(f"Enter the name for dashboard node {i+1}: ")
        ip = input(f"Enter the IP for dashboard node {i+1}: ")
        dashboard_info.append({'name': name, 'ip': ip})
    config['nodes']['dashboard'] = dashboard_info

    # Save configuration to config.yml
    with open('./config.yml', 'w') as file:
        yaml.dump(config, file, default_flow_style=False)

    print("Custom installation configuration has been saved to ./config.yml")

    #   Run the Wazuh installation assistant with the option --generate-config-files to generate the Wazuh cluster key, certificates, and passwords necessary for installation.
    os.system("bash wazuh-install.sh --generate-config-files")

def managerinstall():
    print("Manager")

def serverInstall():
    print("Server")

def customInstall():
    #   Install Wazuh Indexer
    indexerInstall()

    #   Install Wazuh Manager
    managerinstall()

    #   Install Wazuh Server
    serverInstall()

# Testando a função customInstall
customInstall()
