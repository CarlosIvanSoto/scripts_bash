#!/bin/bash

# Actualiza la lista de paquetes disponibles en los repositorios de Debian 11
sudo apt update

# Instala UFW en Debian 11
sudo apt install ufw -y

# Activa UFW y configura la política predeterminada
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Abre los puertos necesarios para tus servicios
# Ejemplo: 
sudo ufw allow ssh # (para habilitar el acceso SSH)
sudo ufw allow http # (para habilitar el acceso HTTP)
sudo ufw allow https # (para habilitar el acceso HTTPS)
# sudo ufw allow 1234/tcp (para habilitar el acceso al puerto 1234)

# Lista las reglas de UFW para verificar que todo esté configurado correctamente
sudo ufw status verbose
