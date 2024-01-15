for ((i=1; i<=300000; i++))
do
    # Run the first script with timeout in the background
    timeout 40 ./01-gnb-n2.sh &

    # Run the second script with timeout in the foreground
    sudo timeout 40 ./02-ue-n2.sh

    # Wait for all background processes to finish
    wait

    # Sleep and print separator for a new call
    sleep 20
    echo "###########################################"
    echo "#        NEW CALL                         #"
    echo "###########################################"
done
