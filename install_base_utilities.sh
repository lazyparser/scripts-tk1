#!/bin/bash

#cd ~ubuntu/

# if there was s NVIDIA-INSTALL folder,
# then we should install the gui-desktop first
[ -d NVIDIA-INSTALL ] && (cd NVIDIA-INSTALL/ && ./installer.sh)

# No Conflict with other installation processes. Reboot after all things done.
#reboot

# Currently all scripts and deb files are copied manually.
# cp /your/usb/point/tarsierOS/ ~ubuntu/
#cd ~ubuntu/tarsierOS

# Enable all four ARMv7 cores
./maxCPU.sh

# Install basic utilities for dev
apt-add-repository universe
apt-add-repository multiverse
apt-add-repository restricted

apt-get update

# hold the nvidia driver
apt-mark hold xserver-xorg-core

# install base utils
apt-get install -y vim git-core subversion mercurial build-essential gcc g++ make autoconf2.13 cmake vim openssh-server

# CAVEAT: DO NOT USE BOOST 1.55!
# Boost 1.54 is used by ROS indigo.
apt-get install -y libboost1.54-all-dev

# Install a lot of drivers
apt-get install -y linux-firmware

# Install some utilities
apt-get -y install bash-completion "command-not-found"


# Security updates
unattended-upgrade

# Ok let's restart
echo "Done. now you need reboot."

#shutdown -Ph now


