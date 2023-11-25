#!/bin/bash

# Specify the file path
file_path="/etc/sysctl.conf"

# Specify the line to uncomment
line_to_uncomment="net.ipv4.ip_forward=1"

# Use sed to uncomment the specified line
sed -i "/^#*${line_to_uncomment}/s/^#//" "$file_path"

echo "Uncommented the line: $line_to_uncomment in $file_path"
