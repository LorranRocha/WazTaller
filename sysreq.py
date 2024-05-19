import platform
import psutil

def systemVerify():
    # Verify if it's Linux OS
    if platform.system() != 'Linux':
        print("The operating system is not Linux. This script only works on Linux systems.")
        return
    
    # Verify the amount of RAM
    mem = psutil.virtual_memory()
    ram_gb = mem.total / (1024 ** 3)  # bytes to GB

    if ram_gb < 4:
        print(f"Insufficient memory: {ram_gb:.2f}GB available. At least 4GB of RAM is required to proceed.")
        return
    else:
        print(f"Verification successful: {ram_gb:.2f}GB of RAM available and Linux operating system.")
