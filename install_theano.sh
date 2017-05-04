#!/bin/bash

#https://raw.githubusercontent.com/gskielian/NVidia-Jetson-TK1-Setup-Scripts/master/installTheano.sh
sudo apt-get install -y python-pip

# install all essential dev packages
sudo apt-get install -y build-essential locate keychain git cmake cmake-curses-gui libv4l-dev v4l-utils python-numpy python-scipy  libavformat-dev libpng-dev libjpeg-dev libtiff-dev libswscale-dev libeigen3-dev  libtbb-dev libgtk2.0-dev

sudo pip install theano
