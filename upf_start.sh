#!/bin/bash
cd /home/ubuntu/free5gc/config
rm upfcfg.yaml
curl -O https://raw.githubusercontent.com/shaath1/upf-run-file/main/upfcfg.yaml
chmod 664 upfcfg.yaml
./modify_upfcfg.sh
cd ..
./run.sh
