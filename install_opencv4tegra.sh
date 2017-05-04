#!/bin/bash

# Install OpenCV4Tegra
dpkg -i ~ubuntu/libopencv4tegra-repo_l4t-r21_2.4.10.1_armhf.deb
apt-get update
apt-get -y install libopencv4tegra libopencv4tegra-dev libopencv4tegra-python libopencv4tegra-repo

echo "Done."
