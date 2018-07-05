FROM ruby:2.4.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client mysql-client vim

# capybara
RUN apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

RUN apt-get install -y nodejs

# bundle
WORKDIR /tmp

ADD Gemfile /tmp
ADD Gemfile.lock /tmp
RUN bundle install

WORKDIR /app
