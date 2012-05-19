#!/bin/bash
idea='/home/tristan/coding/conf/ideas/idea.md';
dateTime=`date +%x%T`
if [ -f ${idea} ]; then
    ideaLines=`expr $(cat ${idea}|wc -l) + 1` #plus 1 on current lines
else
    ideaLines=1
fi

ideaCon=''
while read -p 'please enter your ideas [enter `q` to exit] : ' ideaLine
do
    [[ ${ideaLine} = 'q' ]] && break
    ideaCon+=${ideaLine}
done

if [ ! -z "${ideaCon}" ];then
    echo "${ideaLines}.[${dateTime}] ${ideaCon}" >> ${idea}
fi
