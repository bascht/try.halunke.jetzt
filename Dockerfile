FROM ruby:2.6.2

RUN curl -fsSL get.docker.com | sh && \
    apt-get update -qq && apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install
COPY . .

ENV HALUNKE_IMAGE="moonglum/halunke:v0.10.0"
EXPOSE 3000
CMD ["/usr/src/app/docker-entrypoint.sh"]
