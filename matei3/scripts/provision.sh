#!/bin/bash

# Old Code
# ----
#sudo apt-get update
#sudo apt-get install -y ubuntu-mate-desktop \
#    feh \
#    tmux \
#    git \
#    dconf-editor \
#    ranger


# User/System configuration

# install vimrc
# install blame colors
# run vim plugin installation
# Can I set terminal to autohide?

# Python / Pip

# Docker

# Google Chrome

# Ansible

# Desktop Background

# -------------------------------------------------------------
#
# Provision.sh
#
# -------------------------------------------------------------
sudo apt-get update
# Required dependencies for running ansible and cloning repository
sudo apt-get install -y python-pip git
git clone https://github.com/kerns-ai-lab/vm.git /home/vagrant/vm
# Copy ansible folder from cloned repo to conventional directory 
cp -r /home/vagrant/vm/ansible /home/vagrant/ansible
# Set permissions
chown -R vagrant:vagrant /home/vagrant/ansible

# Remove stored credentials from system file
rm /home/vagrant/vm/.git/config
# Clear bash history
cat /dev/null > ~/.bash_history && history -c
