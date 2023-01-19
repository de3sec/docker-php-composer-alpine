FROM alpine:edge

Maintainer Geshan Manandhar <geshan@gmail.com>

RUN apk --update add wget \ 
		     curl \
		     git \
		     php8.1 \
		     php8.1-curl \
		     php8.1-openssl \
		     php8.1-iconv \
		     php8.1-json \
		     php8.1-mbstring \
		     php8.1-phar \
		     php8.1-gd \
		     php8.2-xml \
		     php8.1-bcmath \
		     php8.1-ctype \
		     php8.1-tokenizer \
		     php8.1-fileinfo \
		     php8.1-pdo \
		     php8.1-dom --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]
