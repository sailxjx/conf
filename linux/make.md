makefile中调用shell变量需要两个$$
shell中: $file
makefile中: $$file

pre-build

```
CC=gcc

.PHONY: all clean

all: post-build

pre-build:
@echo PRE

post-build: main-build
@echo POST

main-build: pre-build
@$(MAKE) --no-print-directory target
```
