FROM ruby:2.4.2-alpine3.7
MAINTAINER Victor Matheus <orochidev@gmail.com>
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                nodejs \
                                tzdata
#TODO: Remove libsqlite3-dev from this in future and migrate all application to use Postgresql!

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle install

COPY . /usr/app
