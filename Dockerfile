FROM ruby:3.2.2-bullseye as base

RUN apt install curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install nodejs

ENV APP_PATH=/home/ruby/app

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

FROM base as development

RUN gem install bundler
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
