#!/bin/bash

# call it on tk1 folder
curr_dir="`pwd`"

# enable all four cpus
[ -f maxCPU.sh ] && sudo bash ./maxCPU.sh

# Install Caffe Dependencies
sudo apt-get -y install libleveldb-dev
sudo apt-get -y install liblmdb-dev
sudo apt-get -y install libhdf5-dev
sudo apt-get -y install libboost-thread1.54-dev
sudo apt-get -y install libatlas3-base

# deps
# XXX: dont install libopencv-dev, for it will remove libopencv4tegra debs
sudo apt-get install -y libprotobuf-dev \
	libleveldb-dev \
	libsnappy-dev \
	libhdf5-serial-dev \
	protobuf-compiler \
	libgflags-dev \
	libgoogle-glog-dev \
	liblmdb-dev \
	cython \
	python-skimage \
	python-pip \
	libatlas-base-dev
sudo apt-get install -y --no-install-recommends libboost-all-dev

# build caffe
cd ~/caffe/
cp Makefile.config{.example,}
# TODO: Find a suitable version for cuDNNv2. disabled currently.

#########################################################################
# FIXME: COPIED FROM JetsonHacks/InstallCaffeTX1
# Dec. 7, 2015; This only appears in once place currently
# This is a 32 bit OS LMDB_MAP_SIZE needs to be reduced from
# 1099511627776 to 536870912
git grep -lz 1099511627776 | xargs -0 sed -i 's/1099511627776/536870912/g'
# Change the comment too
git grep -lz "// 1TB" | xargs -0 sed -i 's:// 1TB:// 1/2TB:g'
#########################################################################

make -j4 all

# Optional
# A few cases failed due to cuda resource limit, which is predicted.
#make test
#make runtest

# bench caffe
#(cd "$curr_dir" && bash ./test_caffe.sh)

# now install pycaffe
cd python/
sudo -H pip install -r requirements.txt
cd ..
make pycaffe
export PYTHONPATH="$PYTHONPATH:$HOME/caffe/python"
echo 'PYTHONPATH="$PYTHONPATH:$HOME/caffe/python"' >> ~/.bash_aliases

# Test pycaffe
#(cd "$curr_dir" && bash ./test_pycaffe.sh)

echo "DONE."

