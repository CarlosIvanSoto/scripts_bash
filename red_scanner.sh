#!/bin/bash

# Este script escanea la red local y muestra información sobre los dispositivos conectados.

# Definir la red a escanear
RED="192.168.1.0/24"

# Escanear la red con nmap
echo "Escaneando la red $RED ..."
nmap -sn $RED > /dev/null -oG - | awk '/Up$/{print $2}' | while read IP; do

    # Obtener información del dispositivo
    echo "==============================="
    echo "Dirección IP: $IP"
    echo "Nombre del host: $(nslookup $IP | awk '/name = /{print $4}')"
    echo "Sistema operativo: $(nmap -O $IP | awk '/OS details:/{print substr($0, index($0,$4))}')"
    echo "MAC address: $(arp -a $IP | awk '{print $4}')"
done
echo "Escaneo completo."
