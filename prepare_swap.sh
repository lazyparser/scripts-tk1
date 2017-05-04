#!/bin/bash

sudo sh -c "[ -f /root/swapfile ] || ( dd if=/dev/zero of=/root/swapfile bs=1M count=800 )"

sudo swapon /root/swapfile

#check
free -h -t -s 1 -c 3

