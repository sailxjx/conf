find . | xargs sed -i.bak "s/params.//g" | rm *.bak

## 找到所有coffee文件并且替换

find . -name '*.coffee' | xargs sed -i "" "s/lib/src/g"

## 批量替换(mac)
find ./bin/ -type f -exec sed -i '' 's/--network host/--network sandbox_default/g' {} +

## 提取数字和点号

https://linuxconfig.org/how-to-extract-a-number-from-a-string-using-bash-example
`NUMBER=$(echo "I am 999 years old." | sed 's/[^0-9]*//g')`
