find . | xargs sed -i.bak "s/params.//g" | rm *.bak

## 找到所有coffee文件并且替换

find . -name '*.coffee' | xargs sed -i "" "s/lib/src/g"
