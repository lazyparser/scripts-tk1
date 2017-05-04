#!/bin/bash

cd ~/caffe || exit 1
find models -name 'deploy.prototxt' |\
    while read p; do
        ./build/tools/caffe \
            time \
            --model=$p \
            --gpu=0
    done

echo "[TarsierOS] Caffe Test Finished."


