FROM ruby:2.7.0

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs sqlite yarn

RUN gem install bundler

RUN mkdir /code/
WORKDIR /code/
COPY . /code/

RUN bundle install
RUN yarn install --check-files
