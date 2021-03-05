FROM debian:buster

ENV AUTOINDEX on

COPY ./srcs/* /home/
COPY ./srcs/autoindexoff/default /tmp/

RUN apt-get update
RUN apt-get install -y nginx openssl vim \
	php7.3-fpm mariadb-server php-mysql wget \
	curl php-mbstring


EXPOSE 80
EXPOSE 443

CMD bash ./home/run.sh && bash
