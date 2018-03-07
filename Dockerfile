FROM cytopia/php-fpm-7.2:latest

###
### Labels
###
LABEL \
	name="Robs PHP Postfix Addon" \
	image="Robs php-fpm-7.2-mailhog" \
	build-date="2018-03-02"


###
### Envs
###

# User/Group
ENV MY_USER="devilbox" \
	MY_GROUP="devilbox" \
	MY_UID="1000" \
	MY_GID="1000"

# User PHP config directories
ENV MY_CFG_DIR_PHP_CUSTOM="/etc/php-custom.d"

# Log Files
ENV MY_LOG_DIR="/var/log/php" \
	MY_LOG_FILE_XDEBUG="/var/log/php/xdebug.log" \
	MY_LOG_FILE_ACC="/var/log/php/www-access.log" \
	MY_LOG_FILE_ERR="/var/log/php/www-error.log" \
	MY_LOG_FILE_SLOW="/var/log/php/www-slow.log" \
	MY_LOG_FILE_FPM_ERR="/var/log/php/php-fpm.err"


### Fix Postfix
###

#COPY ./scripts/main.cf /etc/postfix
COPY ./scripts/docker-entrypoint.sh /
#RUN /usr/sbin/postfix reload

###
### Ports
###
EXPOSE 9000


###
### Volumes
###
VOLUME /var/log/php
VOLUME /etc/php-custom.d
VOLUME /var/mail


