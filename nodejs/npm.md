npm i git+ssh://git@github.com:teambition/panther.git#v0.1.2

配置国内镜像
npm config set registry http://registry.cnpmjs.org 

在安装依赖时忽略 prepublish （因为脑残的设计 https://github.com/npm/npm/issues/3059）
npm i --ignore-scripts
