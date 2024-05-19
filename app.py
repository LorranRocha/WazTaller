import os
from sysreq import systemVerify
from fastinstall import fastInstall

# Verify the System Requirements
def verify_system_requirements():
    systemVerify()
    os.system("clear")

# Menu
def show_menu():
    print("""
   __    __          _____      _ _           
/ / /\ \ \__ _ ___/__   \__ _| | | ___ _ __ 
\ \/  \/ / _` |_  / / /\/ _` | | |/ _ \ '__|
 \  /\  / (_| |/ / / / | (_| | | |  __/ |   
  \/  \/ \__,_/___|\/   \__,_|_|_|\___|_|   
                                           
    WazTaller

    1) Fast Installation
    2) Custom Installation
    3) Exit
    """)

def main_menu():
    while True:
        show_menu()
        choice = input("Please select an option: ").strip()
        if choice == '1':
            print("You selected Fast Installation.")
            fastInstall()
        elif choice == '2':
            print("You selected Custom Installation.")
            # Add the custom installation logic here
        elif choice == '3':
            print("Exiting...")
            break
        else:
            print("Invalid option, please try again.")

# Main function to start the script
if __name__ == "__main__":
    verify_system_requirements()
    main_menu()
