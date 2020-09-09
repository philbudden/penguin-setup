#!/bin/bash

# Setup directories
mkdir Documents Downloads Workspace
mkdir Documents/logs/

# Update OS:

apt upgrade -y

# Install software:

apt install -y net-tools python3-pip openjdk-11-jdk ansible flatpak gnupg-agent software-properties-common

apt --fix-broken install

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

apt update

apt install docker-ce docker-ce-cli containerd.io -y

wget https://atom.io/download/deb
dpkg -i atom-amd64.deb
mv atom-amd64.deb ~/Downloads

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.jetbrains.PyCharm-Community -y
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y

# Cleanup

apt autoremove -y
