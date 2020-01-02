FROM composer

RUN set -eux; \
  apk add --no-cache --virtual \
    rsync

RUN composer global require deployer/deployer --dev; \
    composer global require deployer/recipes --dev

ENV PATH="/tmp/vendor/bin:${PATH}"
