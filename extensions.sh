#!/bin/bash
sudo pecl channel-update pecl.php.net
sudo yum install php8.1-devel php-pear gcc -y
sudo dnf install -y libzip libzip-devel ImageMagick ImageMagick-devel cyrus-sasl-devel
sudo wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
sudo tar -xvzf LATEST.tar.gz
cd libsodium-stable
sudo ./configure
sudo make && sudo make check
sudo make install
sudo pecl install -f libsodium
cd ..
sudo rm -rf libsodium-stable LATEST.tar.gz
sudo pecl install zip
sudo pecl install igbinary
yes '' | sudo pecl install imagick
yes '' | sudo pecl install apcu
sudo wget https://github.com/yalint/memcached-ssl/raw/master/libcrypto.so.1.1
sudo wget https://github.com/yalint/memcached-ssl/raw/master/libssl.so.1.1
sudo cp libcrypto.so.1.1 /usr/lib64
sudo cp libcrypto.so.1.1 /usr/lib64/libcrypt.so.1
sudo cp libssl.so.1.1 /usr/lib64
sudo wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.1/latest-64bit-X86-openssl1.1
sudo tar -xvzf latest-64bit-X86-openssl1.1
sudo cp amazon-elasticache-cluster-client.so /usr/lib64/php/modules/memcached.so
echo extension=memcached.so | sudo tee /etc/php.d/20-memcached.ini
sudo rm -rf latest-64bit-X86-openssl1.1 amazon-elasticache-cluster-client.so README.markdown
sudo dnf install -y xorg-x11-server-Xvfb libXrender libXext fontconfig
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox-0.12.6.1-3.fedora37.x86_64.rpm
sudo dnf install -y ./wkhtmltox-0.12.6.1-3.fedora37.x86_64.rpm
wkhtmltopdf --version
