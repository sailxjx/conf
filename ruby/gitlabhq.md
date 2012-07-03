1. 准备工作
    su
    git clone git://git.gnome.org/libxslt
    cd libxslt
    ./autogen.sh && make && make install
    apt-get install libicu-dev
    apt-get install libmysql-ruby libmysqlclient-dev
    apt-get install sqlite3
    apt-get install libsqlite3-ruby
    apt-get install libsqlite3-dev
    
2. 安装gemlibs
    gem install nokogiri
    gem install charlock_holmes
    gem install mysql2
    gem install sqlite3
    
3. 安装bundles
    bundle install
