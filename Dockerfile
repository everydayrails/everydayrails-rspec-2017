FROM ruby:2.5.3

ENV APP_ROOT /rspec_app
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && \
  apt-get install -y build-essential mysql-client nodejs unzip --no-install-recommends && \
  npm install -g n && \
  n stable && \
  npm install -g yarn

RUN CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    chown root:root ~/chromedriver && \
    chmod 755 ~/chromedriver && \
    mv ~/chromedriver /usr/bin/chromedriver && \
    sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && apt-get install -y google-chrome-stable && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile Gemfile.lock ${APP_ROOT}/
RUN bundle install --jobs=4

ADD package.json $APP_ROOT
ADD yarn.lock $APP_ROOT
RUN yarn install --frozen-lockfile

COPY . ${APP_ROOT}/