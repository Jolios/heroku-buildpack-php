#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=https://github.com/m6w6/ext-propro.git
propro_dir=ext-propro

### Propro
echo "[LOG] Downloading Propro"
git clone $dep_url -q
cd $dep_url

# /app/php/bin/phpize
# ./configure --with-php-config=$PHP_ROOT/bin/php-config
# make
# sudo make install
BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
bash ./install
cd
echo "extension=propro.so" >> /app/.heroku/php/etc/php/php.ini
