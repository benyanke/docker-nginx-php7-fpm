FROM benyanke/php7:7.2

MAINTAINER "Ben Yanke" <ben@benyanke.com>

# Laravel container command controls
# Set to '1' to run these commands from running on container start
ENV CMD_ROOT /var/www
ENV RUN_PERMISSION_FIX 0
ENV RUN_COMPOSER 0
ENV RUN_WEBPACK 0
ENV RUN_MIGRATIONS 0
ENV RUN_DB_SEED 0
ENV RUN_VENDOR_PUBLISH 0

WORKDIR /tmp

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

# Install Nginx
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    nginx \
    php7.2-fpm \
    supervisor && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx /var/run/php /var/log/supervisor

# Copy in config files
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-supervisor.conf /etc/supervisor/conf.d/nginx.conf
COPY www.conf /etc/php/7.2/fpm/pool.d/www.conf
COPY startup.sh /opt/startup/startup.sh

VOLUME ["/var/www", "/etc/nginx/sites-enabled", "/opt/startup"]

EXPOSE 80 9000

# Set workdir back to www dir so that console users are in right position
WORKDIR /var/www

CMD /opt/startup/startup.sh && /usr/bin/supervisord
