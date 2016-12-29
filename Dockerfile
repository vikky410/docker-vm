#!/bin/bash
FROM ubuntu:14.04

RUN mkdir /u01 && \
  chmod a+xr /u01
COPY /files/readme.txt /u01/

RUN apt-get update
RUN apt-get install -q -y apache2
EXPOSE 80
COPY /web-site/ /var/www/html/
