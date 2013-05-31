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
创建分支并且立刻切换到新分支
    git checkout -b newbranch
从远程clone一个特定分支
    git clone git@github.com:sailxjx/blog.git --single-branch -b gh-pages _deploy

恢复到以前的版本
    git reset <version>
回滚
    git revert <version>
查看完整log，包括被reset和revert的
    git log -g