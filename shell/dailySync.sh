#!/bin/bash
eval `ssh-agent`
ssh-add /home/tristan/.ssh/id_xjx_ubuntu_rsa
DATETIME=`date +%x%T`
MSG="daily sync: ${DATETIME}"
echo ${MSG}
dailySync(){
    cd $1
    echo "sync dir: $1"
    git add .
    git ct "${MSG}"
    git pull
    git push
}

CODE_DIR='/home/tristan/coding'
ARR_DIRS=("${CODE_DIR}/conf"\
          "${CODE_DIR}/loli"\
          "${CODE_DIR}/exp"\
          "${CODE_DIR}/soul"\
          "${CODE_DIR}/njlab"\
          "${CODE_DIR}/eclipse/eton")
LEN_ARR_DIRS=${#ARR_DIRS[@]}
for DIR in ${ARR_DIRS[@]}
do
    dailySync ${DIR}
done

kill $SSH_AGENT_PID
