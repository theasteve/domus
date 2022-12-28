FROM ruby:3.1.2-alpine

WORKDIR /domus
COPY . /domus 

RUN apk add \
  build-base \
  postgresql-dev

RUN gem install bundler -v 2.4.1

RUN apk add \
    tzdata \
    nodejs \
    vips \
    vips-dev \
    libc-dev \
    libjpeg-turbo-dev \
    build-base

RUN apk add --update npm

RUN npm install -g yarn

RUN bundle install

RUN yarn install --check-files

RUN RAILS_ENV=production rails assets:precompile

CMD ["rails", "server", "-e","production","-b", "0.0.0.0"]