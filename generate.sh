#!/bin/bash
for ((i=1; i<=300000; i++))
do
        sudo timeout 4 ./02-ue-n2.sh
        sleep 2
        echo "###########################################"
        echo "#        NEW CALL                         #"
        echo "###########################################"
done
