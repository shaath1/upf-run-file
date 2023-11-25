#!/bin/bash

if_addr=$(ip -4 addr show enp1s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')  

# Read the configuration file and replace $if_addr with the actual IP address
config_file="upfcfg.yaml"  # Replace this with your actual config file path

# Use sed to perform the replacement
sed -i "s/\$if_addr/$if_addr/g" "$config_file"

echo "IP address replaced in $config_file"
