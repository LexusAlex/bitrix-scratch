FROM phpearth/php:7.2-apache


RUN apk add --no-cache \
        bash \
        git \
        vim \
        php7.2-mcrypt \
        php7.2-mysqli \
        php7.2-pdo \
        php7.2-pdo_mysql \
        #php7.2-pdo_pgsql \
        #php7.2-pdo_sqlite \
        #php7.2-soap \
        php7.2-xdebug \
        php7.2-gd \
        #php7.2-zip \
        #php7.2-zlib \
        #unzip \
		composer
		#phpunit \

#RUN echo "dispay_errors On" >> /etc/php/7.2/php.ini && echo "short_open_tag On" >> /etc/php/7.2/php.ini

COPY php.ini /etc/php/7.2/
COPY httpd.conf /etc/apache2/


CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
