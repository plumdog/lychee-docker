FROM php:7.0-fpm

ARG GIT_REF=v3.1.6

RUN apt update && apt install -y \
    git

RUN docker-php-ext-install pdo_mysql

RUN mkdir -p /var/www/html
RUN mkdir -p /appsrc && \
    cd /appsrc && \
    git clone https://github.com/LycheeOrg/Lychee.git && \
    cd Lychee && \
    git reset --hard $GIT_REF && \
    mv dist php plugins src LICENSE favicon.ico index.html robots.txt view.php /var/www/html/

RUN mkdir -p \
    /var/www/html/uploads \
    /var/www/html/uploads/big \
    /var/www/html/uploads/import \
    /var/www/html/uploads/medium \
    /var/www/html/uploads/thumb \
    /var/www/html/data

RUN chmod -R 777 /var/www/html/uploads
