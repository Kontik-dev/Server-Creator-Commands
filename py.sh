#!/bin/bash

echo 'Python3 + Pip3 installer'

# Update und Upgrade des Betriebssystems
apt update && apt upgrade

# Installation von pip3 und python3
sudo apt-get install python3-pip

# Installation von Screen
echo 'Installieren von Screen...'
apt install screen

echo 'Python3 und Pip3 wurde erfolgreich installiert. Du kannst mit python3 bot.py dein bot starten, wenn du packages brauchst wie z.B py-cord kannst du pip3 install py-cord schreiben :D support findest du unter https://discord.gg/sgQZz3rJqq'

