#!/bin/bash
eval `ssh-agent`
ssh-add /home/tristan/.ssh/id_xjx_ubuntu_rsa
# ssh-add /home/tristan/.ssh/id_rsa
dailySync(){
    cd $1
    git add .
    git ct 'daily sync'
    git pull
    git push
}

CODE_DIR='/home/tristan/coding'
ARR_DIRS=("${CODE_DIR}/conf" "${CODE_DIR}/loli" "${CODE_DIR}/exp" "${CODE_DIR}/soul" "${CODE_DIR}/njlab")
LEN_ARR_DIRS=${#ARR_DIRS[@]}
for DIR in ${ARR_DIRS[@]}
do
    dailySync ${DIR}
done
