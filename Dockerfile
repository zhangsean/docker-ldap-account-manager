FROM php:7-apache
MAINTAINER jaekwon park <jaekwon.park@code-post.com>

ARG LAM_VERSION=6.5

# Configure apt
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends fontconfig-config fonts-dejavu fonts-dejavu-core fonts-dejavu-extra ghostscript gsfonts imagemagick-common libavahi-client3 libavahi-common-data \
  libavahi-common3 libcups2 libcupsfilters1 libcupsimage2 libcurl3 libfftw3-double3 libfontconfig1 libgd3 libgomp1 libgs9 libgs9-common libijs-0.35 \
  libjbig0 libjbig2dec0 liblcms2-2 liblqr-1-0 libltdl7 libpaper-utils libpaper1 \
  libtiff5 libxpm4 libxslt1.1 libzip4 libzip-dev libghc-ldap-dev wget ca-certificates && \
  docker-php-ext-install gettext zip ldap && \
  wget http://prdownloads.sourceforge.net/lam/ldap-account-manager-${LAM_VERSION}.tar.bz2?download -O /tmp/ldap-account-manager-${LAM_VERSION}.tar.bz2 && \
  tar xvf /tmp/ldap-account-manager-${LAM_VERSION}.tar.bz2 -C /var/www/ && \
  rm -rf /var/www/html && \
  mv /var/www/ldap-account-manager-${LAM_VERSION} /var/www/html && \
  apt-get purge -y wget ca-certificates && apt-get autoremove -y && apt-get clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log && \
    ln -sf /config/config.cfg /var/www/html/config/config.cfg && \
    ln -sf /config/lam.conf /var/www/html/config/lam.conf && \
    chown www-data:www-data /var/www/html/config && \
    chown www-data:www-data /var/www/html/sess && \
    chown www-data:www-data /var/www/html/tmp

COPY apache2-foreground /usr/local/bin/

VOLUME /config /var/www/html/sess

EXPOSE 80

CMD ["apache2-foreground"]
                                                                                                                                                                                                                                                                                                                                                                        
