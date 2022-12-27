FROM ruby:3.1.2-alpine

WORKDIR /domus
COPY . /domus 

RUN apk add \
  build-base \
  postgresql-dev

RUN apk add \
    tzdata \
    nodejs \
    vips \
    vips-dev \
    libc-dev \
    libjpeg-turbo-dev \
    build-base \ 
    postgresql-client

RUN apk add --update npm

RUN npm install -g yarn

RUN bundle install

RUN yarn install --check-files

CMD ["rails", "server", "-b", "0.0.0.0"]