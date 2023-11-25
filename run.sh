#!/usr/bin/env bash

LOG_PATH="./log/"
LOG_NAME="free5gc.log"
TODAY=$(date +"%Y%m%d_%H%M%S")
PCAP_MODE=0
N3IWF_ENABLE=0

PID_LIST=()
echo $$ > run.pid

function terminate()
{
    rm run.pid
    echo "Receive SIGINT, terminating..."
    for ((i=${#PID_LIST[@]}-1;i>=0;i--)); do
        sudo kill -SIGTERM ${PID_LIST[i]}
    done
    sleep 2
    wait ${PID_LIST}
    exit 0
}
trap terminate SIGINT
LOG_PATH=${LOG_PATH%/}"/"${TODAY}"/"
echo "log path: $LOG_PATH"

if [ ! -d ${LOG_PATH} ]; then
    mkdir -p ${LOG_PATH}
fi
sudo -E ./bin/upf -c ./config/upfcfg.yaml -l ${LOG_PATH}${LOG_NAME} &
SUDO_UPF_PID=$!
sleep 0.1
UPF_PID=$(pgrep -P $SUDO_UPF_PID)
PID_LIST+=($SUDO_UPF_PID $UPF_PID)
sleep 0.1
NF_LIST=""
export GIN_MODE=release
wait ${PID_LIST}
exit 0
