#!/bin/bash

if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   echo "$ sudo "$0""
   exit
fi

# Enable all four ARMv7 cores
bash ./maxCPU.sh

# Install basic utilities for dev
apt-add-repository universe
apt-add-repository multiverse
apt-add-repository restricted

# Install ROS Indigo
update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116
apt-get update
apt-get install -y ros-indigo-ros-base \
	ros-indigo-navigation \
	ros-indigo-calibration \
	ros-indigo-catkin \
	ros-indigo-catkin-pip \
	ros-indigo-cmake-modules \
	ros-indigo-desktop \
	ros-indigo-kobuki \
	ros-indigo-kobuki-dashboard \
	ros-indigo-kobuki-driver \
	ros-indigo-kobuki-ftdi \
	ros-indigo-kobuki-led-controller \
	ros-indigo-kobuki-random-walker \
	ros-indigo-kobuki-rviz-launchers \
	ros-indigo-rocon-tools \
	ros-indigo-ros-tutorials \
	ros-indigo-rosclean \
	ros-indigo-roscompile \
	ros-indigo-rosconsole \
	ros-indigo-rosconsole-bridge \
	ros-indigo-rosbash \
	ros-indigo-rviz \
	ros-indigo-rviz-visual-tools \
	ros-indigo-turtlebot \
	ros-indigo-turtlebot-navigation \
	ros-indigo-turtlebot-dashboard \
	python-rosinstall \
	python-rosdep

# ROS config
source /opt/ros/indigo/setup.bash
rosdep init
read -p "FIXME:"
rosdep update
read -p "FIXME:"
rosdep fix-permissions
read -p "FIXME:"


# Create udev rule to create a /dev/kobuki link
rosrun kobuki_ftdi create_udev_rules


rebuild_kernel () {
	echo "You need to recompile kernel to include 'ftdi_sio' module."

	apt-get install -y libqt4-dev pkg-config
	cd /usr/src
	tar xf kernel_src.tbz2
	cd kernel
	zcat /proc/config.gz > .config
	cat "CONFIG_USB_SERIAL_FTDI_SIO=y" >> .config
	cat "CONFIG_USB_FTDI_ELAN=y" >> .config
	make prepare
	make modules_prepare
	make -j 4
	make modules
	make modules_install
	cp arch/arm/boot/zImage /boot/zImage
	echo done.
}


modprobe ftdi_sio || rebuild_kernel

############################
# ubuntu user
############################

grep -q "unset GTK_IM_MODULE"     ~ubuntu/.bash_aliases || echo 'unset GTK_IM_MODULE'               >> ~ubuntu/.bash_aliases
grep -q "/opt/ros/indgo/setup.sh" ~ubuntu/.bash_aliases || echo "source /opt/ros/indigo/setup.bash" >> ~ubuntu/.bash_aliases

chown ubuntu.ubuntu ~ubuntu/.bash_aliases

echo "Done."

