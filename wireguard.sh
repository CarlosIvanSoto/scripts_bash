#!/bin/bash

# Configuración de la interfaz de WireGuard
echo "auto wg0
iface wg0 inet static
    address 10.0.0.1
    netmask 255.255.255.0
    pre-up wg setconf wg0 /etc/wireguard/wg0.conf" >> /etc/network/interfaces

# Agregar el puerto a la configuración de ufw
sudo ufw allow 51820/udp

# Reiniciar la interfaz de red para que tome la nueva configuración
sudo ifdown wg0 && sudo ifup wg0
