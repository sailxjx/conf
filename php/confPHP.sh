./configure \
    --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php \
    --enable-fpm \
    --with-apxs2=/usr/local/httpd/bin/apxs \
    --with-pdo-odbc=unixODBC,/usr/local/unixODBC \
    --disable-cgi \
    --enable-pcntl \
    --with-openssl \
    --with-zlib \
    --with-bz2=/usr \
    --enable-calendar \
    --with-curl \
    --enable-exif \
    --with-freetype-dir \
    --enable-mbstring \
    --with-mysql=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --enable-soap \
    --enable-zip \
    --with-pear

