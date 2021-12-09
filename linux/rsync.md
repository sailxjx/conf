# 只同步特定文件类型

`rsync -zarv --include="*/" --include="*.sh" --exclude="*" "$from" "$to"`

# 使用特定端口

`sync -avz -e "ssh -p 2232" SRC/ user@remote.host:/DEST/ `
