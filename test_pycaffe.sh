#!/bin/bash

export PYTHONPATH="$PYTHONPATH:$HOME/caffe/python"

# test pycaffe
python -c "import caffe"

# TODO More testcases are needed.

