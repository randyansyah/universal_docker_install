
#!/bin/bash

# Cek apakah skrip dijalankan sebagai root atau dengan sudo
if [[ $EUID -ne 0 ]]; then
   echo "Skrip ini harus dijalankan sebagai root atau dengan sudo" 
   exit 1
fi

# Install Docker
if [ -f /etc/redhat-release ]; then
    # CentOS / RHEL
    yum install -y yum-utils
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install -y docker-ce docker-ce-cli containerd.io
elif [ -f /etc/debian_version ]; then
    # Debian / Ubuntu
    sudo apt-get update
    sudo apt-get install docker.io
else
    echo "Distribusi tidak didukung"
    exit 1
fi

# Install Docker Compose
if [ ! -f /usr/local/bin/docker-compose ]; then
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# Mulai dan atur Docker untuk dijalankan pada boot
systemctl start docker
systemctl enable docker

# Tambahkan pengguna saat ini ke grup docker agar tidak perlu sudo saat menjalankan Docker
usermod -aG docker $USER

echo "Docker dan Docker Compose berhasil diinstal"
