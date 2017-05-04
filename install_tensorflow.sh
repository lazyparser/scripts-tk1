#!/bin/bash

sudo pip install ./tensorflow-0.5.0-cp27-none-linux_armv7l.whl

#check
python ./test_tensorflow.py

echo "Done."
