nginx中的if不支持嵌套和&&或||
可以使用变量或break来支持流程控制

## try_files
location = /favicon.ico {
    try_files /path/to/favicon =404;
}