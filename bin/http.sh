#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=https://github.com/m6w6/ext-http.git
http_dir=ext-http
echo "-----> Building http..."

### HTTP
echo "[LOG] Downloading http-ext"
git clone --branch v3.x $dep_url
cd $http_dir

# /app/php/bin/phpize
# ./configure --with-php-config=$PHP_ROOT/bin/php-config
# make
# sudo make install
BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
bash ./install
cd 
echo "extension=http.so" >> /app/.heroku/php/etc/php/php.ini
