#!/bin/bash

# FIXME: add url link
git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch
bash ./install-deps
./install.sh

git clone https://github.com/soumith/cudnn.torch.git -b R2
cd ~/cudnn.torch
luarocks make

# VERIFY
. ~/.bashrc

th -e 'require "cudnn";'
echo "[TarsierOS] Done."
