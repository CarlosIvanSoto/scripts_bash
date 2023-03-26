#!/bin/bash

# Generar clave privada y pública
wg genkey | tee privatekey | wg pubkey > publickey

wg set wg0 peer ./publickey allowed-ips 10.0.0.2/32


# Agregar ruta
ip route add 10.0.0.2/32 dev wg0