FROM ruby:2.4.2

RUN curl -fsSL get.docker.com | sh && \
    curl -o- -L https://yarnpkg.com/install.sh | bash  -s -- --version 1.5.1 && \
    apt-get update -qq && apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

ENV HALUNKE_IMAGE="moonglum/halunke:v0.6.2"
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
