从源代码安装gem
    wget -c https://nodeload.github.com/github/gollum/zipball/v2.1.4
    unzip v2.1.4
    gem build gollum.gemspec
    gem install gollum-2.1.4.gem

[gem开发手册](https://github.com/radar/guides/blob/master/gem-development.md)

gem sources -a http://ruby.taobao.org/

.gemrc

```
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- http://ruby.taobao.org/
:update_sources: true
:verbose: true
gem: --no-rdoc --no-ri --no-document
```
