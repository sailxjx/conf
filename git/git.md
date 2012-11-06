创建子模块
    git submodule add git@github.com:51fanli/sysd.git sysd
更新子模块
    git submodule update
创建新的空分支
    三种方法
    1.
    git symbolic-ref head refs/heads/empty
    rm .git/index
    git clean -fdx
    2.
    echo ref: refs/heads/newbranch > .git/HEAD
    git rm -rf .
    3.Git 1.7.2后 –orphan
    git checkout --orphan newbranch
    git rm -rf .
