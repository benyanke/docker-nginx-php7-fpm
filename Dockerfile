FROM benyanke/php7:7.2

MAINTAINER "Vitor Carreira" <vitor.carreira@gmail.com>

WORKDIR /tmp

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && composer self-update

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
