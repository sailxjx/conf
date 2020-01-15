## 跳过首层目录解压
tar -xvf ../build/distributions/connect-mongo-1.0-SNAPSHOT.tgz -C target-libs --strip 1

# Unarchive to another dir and skip first dir
`tar -xf julia-1.1.0-linux-x86_64.tar.gz -C /usr/local --strip 1`

## tar
* 压缩 `tar -cvzf {file} {dir}`
* 解压 `tar -xvf {file}`
