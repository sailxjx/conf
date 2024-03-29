# 创建子模块

git submodule add git@github.com:51fanli/sysd.git sysd

# 更新子模块

git submodule update

# 更新子模块

git submodule update --rebase --remote

# 创建新的空分支

```
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
```

# 创建分支并且立刻切换到新分支

git checkout -b newbranch

# 从远程clone一个特定分支

`git clone git@github.com:sailxjx/blog.git --single-branch -b gh-pages _deploy`

# 恢复到以前的版本

git reset

<version>
</version>

# 回滚

git revert

<version>
</version>

# 查看完整log，包括被reset和revert的

git log -g

# 删除远程已不存在的分支

git fetch --prune

# 查看修改行数

git diff e236024 HEAD --shortstat

# 查看总commit数

git rev-list HEAD --count

# 删除指定的 tag

git tag | grep -v v1.13 | grep -v v1.14 | xargs git tag -d

# 删除远程 tag

git push --tags --prune

# 查看 commit hash

git rev-list v2.0.0-rc1 | head -n 1

# 压缩多个 commit 为一条记录 rebase + squash <https://ariejan.net/2011/07/05/git-squash-your-latests-commits-into-one/>

# 从所有历史中移除文件 <https://help.github.com/articles/removing-files-from-a-repository-s-history/>

# 更新从根节点开始的提交记录 git rebase -i --root

# 合并/更新从 HEAD 到之前某次的提交记录 git rebase -i HEAD~10

#### 提交空的 commit
git commit --allow-empty -m "Trigger notification"

# Track lfs

https://git-lfs.github.com/
`git lfs track "*.psd"`

# Check why the file is ignored

https://stackoverflow.com/questions/466764/git-command-to-show-which-specific-files-are-ignored-by-gitignore

`git check-ignore -v file`
