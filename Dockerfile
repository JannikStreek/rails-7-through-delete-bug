FROM ruby:3.2.2-bullseye as base

ENV APP_PATH=/home/ruby/app

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

FROM base as development

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
