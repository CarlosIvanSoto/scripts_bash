#!/bin/bash

# Instalar wireguard-tools
apt update
apt install -y wireguard-tools

# Crear interfaz wg0
ip link add dev wg0 type wireguard

# Asignar dirección IP
ip address add dev wg0 10.0.0.1/24

# Generar claves
umask 077
wg genkey > privatekey
wg pubkey < privatekey > publickey

# Configurar interfaz wg0
wg set wg0 listen-port 51820 private-key ./privatekey

# Agregar el puerto a la configuración de ufw
ufw allow 51820/udp

# Reiniciar la interfaz de red para que tome la nueva configuración
ifdown wg0 && ifup wg0
