import os

def fastInstall():
    print("You're about to install Wazuh using the fast installation.")
    while True:
        choice = input("Do you want to proceed? (y/n): ").strip().lower()
        
        if choice == 'y':
            print("Starting the fast installation of Wazuh...")
            os.system("curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh && sudo bash ./wazuh-install.sh -a")
            print("Wazuh installation completed.")
            break
        elif choice == 'n':
            print("Installation aborted by user.")
            break
        else:
            print("Invalid input. Please enter 'y' to proceed or 'n' to cancel.")
