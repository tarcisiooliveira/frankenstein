FROM ruby:3.1.2

# install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev libxml2-dev libxslt1-dev \
  nodejs vim postgresql-client locales cron imagemagick\
  yarn npm

ENV LANG C.UTF-8

# create work directory
ENV APP_HOME /frankenstein
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN echo "gem: --no-document" > $APP_HOME/.gemrc

COPY . ./

RUN bundle check || bundle install


RUN chmod +x entrypoints/default.sh entrypoints/run.sh entrypoints/db-migrate.sh entrypoints/bundle.sh
# run config/init.sql

EXPOSE 3000

ENTRYPOINT ["./entrypoints/default.sh"]
