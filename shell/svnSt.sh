#!/bin/bash
codeDir='/usr/local/www/'
svnDir=(\
    "${codeDir}fun" \
    "${codeDir}static" \
    "${codeDir}search" \
    "${codeDir}rbac"\
    )
if [ ! -e $1 ]; then
    cmd=$1
else
    cmd='st'
fi

for dir in ${svnDir[@]}
do
    echo 'dir: '${dir}
    cd ${dir}
    svn ${cmd}
done 

