FROM ruby:3.1.2-alpine3.16

RUN apk update && apk add bash build-base postgresql-dev tzdata

WORKDIR /mnt/auctorize-server

COPY Gemfile /mnt/auctorize-server
COPY Gemfile.lock /mnt/auctorize-server

RUN bundle config --global frozen 1
RUN bundle install --path vendor --without development test

COPY . .

CMD ["bin/rails", "s"]