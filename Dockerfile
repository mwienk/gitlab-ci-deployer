FROM php:cli-alpine

ENV DEPLOYER_VERSION=6.2.0
ENV DEPLOYER_SHA1=49f5ffa976a842434783d577822c52cbb06dadcb

RUN apk update --no-cache \
    && apk add --no-cache \
	openssh-client

RUN curl -o deployer -fSL "https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar"; \
	echo "DEPLOYER_SHA1 deployer" | sha1sum -c -; \
	mv deployer /usr/local/bin/dep; \
	chmod +x /usr/local/bin/dep


