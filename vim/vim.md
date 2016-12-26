| 命令                 | 描述               |
|:---------------------|:-------------------|
| hjkl                 | 左下上右           |
| u                    | 撤销               |
| ^-r                  | 恢复撤销           |
| ^-w,w                | diff 模式切换窗口  |
| :e                   | 浏览当前文件夹     |
| diw                  | 删除当前单词       |
| :%s/origin/replace/g | 替换               |
| 0                    | 当前行首           |
| $                    | 当前行尾           |
| e                    | 后一个单词         |
| b                    | 前一个单词         |
| ^-f                  | 下一屏             |
| ^-b                  | 上一屏             |
| G                    | 文件尾             |
| gg                   | 文件头             |
| :w !sudo tee %       | 写入               |
| 5dd                  | 删除多行（5行）    |
| a                    | 在光标后插入       |
| viw                  | 选中当前单词       |
| select + U           | 将选中字符转成大写 |
| select + u           | 将选中字符转成小写 |

### <Esc> vs CTRL-C vs CTRL-[

http://stackoverflow.com/questions/5030164/whats-the-difference-between-ctrlc-and-ctrl

当多行输入时，使用 Esc 或 CTRL-[ 退出 insert 模式
