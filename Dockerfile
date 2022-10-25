FROM ruby:2.7.0-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    sqlite3 \ 
    libsqlite3-dev \
    libvips42 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

WORKDIR /usr/src/app

COPY . .

RUN gem update --system && gem install bundler

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000

CMD ["sh", "-c", "rm -f tmp/pids/server.pid && bin/rails s -p 3000 -b '0.0.0.0'"]