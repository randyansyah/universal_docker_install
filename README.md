# universal_docker_install
This script automates the installation of Docker and Docker Compose on various Linux distributions.
The docker_compose.sh script simplifies the installation process of Docker and Docker Compose on Linux systems. It automatically detects your Linux distribution and installs Docker using the appropriate package manager. Docker Compose is then downloaded and installed from the official Docker GitHub releases

## Usage

1. Download the script:
   ```bash
   wget https://raw.githubusercontent.com/your-username/your-repo/master/install_docker_and_compose.sh

2. Make the script executable:
   ```bash
   chmod +x docker_compose.sh

3. Run the script with root privileges or using sudo:
   ```bash
   sudo ./docker_compose.sh


## Additional Steps
After the installation is complete, you may need to log out and log back in or restart your system for group changes to take effect. try run docker command "docker images" ass non root user if system ask root user  to run command, add your user to the "docker" group:
```bash
sudo usermod -aG docker $USER

restart your system for group changes to take effect. try run docker command "docker images" it should be work.




