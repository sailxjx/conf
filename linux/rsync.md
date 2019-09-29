# 只同步特定文件类型

rsync -zarv --include="*/" --include="*.sh" --exclude="*" "$from" "$to"
