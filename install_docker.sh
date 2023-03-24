#!/bin/bash

# Actualiza la lista de paquetes disponibles en los repositorios de Debian 11
sudo apt update

# Instala las herramientas necesarias para poder utilizar paquetes alojados en HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
# Agrega la clave GPG oficial de Docker al sistema
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agrega el repositorio de Docker al sistema
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualiza la lista de paquetes disponibles en los repositorios de Debian 11 nuevamente
sudo apt update

# Instala Docker en Debian 11
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Agrega tu usuario al grupo de usuarios de Docker
sudo usermod -aG docker admon

# Verifica que Docker esté instalado correctamente
docker --version

# Descarga Docker Compose y asegúrate de que esté disponible en el sistema PATH de tu usuario
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verifica que Docker Compose esté instalado correctamente
docker-compose --version
