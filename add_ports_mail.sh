#!/bin/bash

sudo ufw allow 25/tcp # (para habilitar el acceso SMTP)
sudo ufw allow 110/tcp # (para habilitar el acceso POP3)
sudo ufw allow 143/tcp # (para habilitar el acceso IMAP)
sudo ufw allow 465/tcp # (para habilitar el acceso SMTPS)
sudo ufw allow 587/tcp # (para habilitar el acceso MSA)
sudo ufw allow 993/tcp # (para habilitar el acceso IMAPS)
sudo ufw allow 995/udp # (para habilitar el acceso POP3S)
sudo ufw allow 4190/udp # (para habilitar el acceso Sieve)

# Lista las reglas de UFW para verificar que todo esté configurado correctamente
sudo ufw status verbose