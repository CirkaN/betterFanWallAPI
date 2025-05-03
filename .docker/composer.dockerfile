FROM composer:latest

RUN addgroup -g 1000 development && adduser -G development -g development -s /bin/sh -D development

USER development
