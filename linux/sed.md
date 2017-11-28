find . | xargs sed -i.bak "s/params.//g" | rm *.bak

## 找到所有coffee文件并且替换

find . -name '*.coffee' | xargs sed -i "" "s/lib/src/g"

## 批量替换(mac)
find ./bin/ -type f -exec sed -i '' 's/--network host/--network sandbox_default/g' {} +
