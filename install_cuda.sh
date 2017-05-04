#!/bin/bash

# Install CUDA 6.5
dpkg -i ./cuda-repo-l4t-r21.3-6-5-prod_6.5-42_armhf.deb
#apt install cuda-repo-l4t-r21.3-6-5-prod
apt-get update
apt-get install -y cuda-core-6-5 \
	cuda-cufft-6-5 \
	cuda-documentation-6-5 \
	cuda-command-line-tools-6-5 \
	cuda-misc-headers-6-5 \
	cuda-minimal-build-6-5 \
	cuda-cufft-dev-6-5 \
	cuda-samples-6-5 \
	cuda-driver-dev-6-5 \
	cuda-cublas-dev-6-5 \
	cuda-npp-dev-6-5 \
	cuda-cudart-dev-6-5 \
	cuda-cublas-6-5 \
	cuda-cudart-6-5 \
	cuda-toolkit-6-5 \
	cuda-npp-6-5 \
	cuda-curand-6-5 \
	cuda-license-6-5 \
	cuda-cusparse-6-5 \
	cuda-cusparse-dev-6-5 \
	cuda-curand-dev-6-5

echo "Done."
