FROM ruby:2.5.3

ENV APP_ROOT /rspec_app
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && \
  apt-get install -y build-essential mysql-client nodejs && \
  npm install -g n && \
  n stable && \
  npm install -g yarn

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install --jobs=4

ADD package.json $APP_ROOT
ADD yarn.lock $APP_ROOT
RUN yarn install --frozen-lockfile

ADD . $APP_ROOT

#RUN bundle exec rake assets:precompile
