#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=https://github.com/ext-raphf.git
raphf_dir=ext-raphf
echo "-----> Building Raphf..."

### Raphf
echo "[LOG] Downloading Raphf"
git clone $dep_url -q
cd $raphf_dir

# /app/php/bin/phpize
# ./configure --with-php-config=$PHP_ROOT/bin/php-config
# make
# sudo make install
BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
bash ./install
cd echo "extension=raphf.so" >> /app/.heroku/php/etc/php/php.ini
