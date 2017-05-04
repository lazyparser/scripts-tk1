#!/bin/bash

# Install cuDNNv2
[ -d cudnn-6.5-linux-ARMv7-v2 ] || tar xf cudnn-6.5-linux-ARMv7-v2.tgz || exit 1
cd cudnn-6.5-linux-ARMv7-v2
cp cudnn.h /usr/local/cuda-6.5/targets/armv7-linux-gnueabihf/include/
cp libcudnn* /usr/local/cuda-6.5/targets/armv7-linux-gnueabihf/lib/

echo "Done."
