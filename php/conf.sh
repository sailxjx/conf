./configure \
    --prefix=/usr/local/php \
    --with-config-file-path=/etc \
    --enable-fpm \
    --with-readline \
    --with-fpm-user=tristan \
    --with-pdo-odbc=unixODBC,/usr/local/unixODBC \
    --enable-pcntl \
    --with-openssl \
    --with-zlib \
    --with-curl \
    --enable-exif \
    --with-freetype-dir \
    --enable-mbstring \
    --with-mysql=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --enable-zip \
    --with-pear

