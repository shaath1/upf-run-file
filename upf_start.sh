#!/bin/bash

# Check if lsmod | grep gtp5g returns empty
if lsmod | grep -q gtp5g; then
    echo "Module gtp5g is loaded."
else
    echo "Module gtp5g is not loaded. Compiling and installing gtp5g..."
    cd ~/gtp5g
    make
    sudo make install
fi
cd /home/ubuntu/free5gc/config
rm upfcfg.yaml
curl -O https://raw.githubusercontent.com/shaath1/upf-run-file/main/upfcfg.yaml
chmod 664 upfcfg.yaml
./modify_upfcfg.sh
cd ..
./run.sh
