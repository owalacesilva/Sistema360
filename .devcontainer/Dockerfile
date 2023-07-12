# Ruby version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.0, 2, 2.7, 2.6, 3-bullseye, 3.0-bullseye, 2-bullseye, 2.7-bullseye, 2.6-bullseye, 3-buster, 3.0-buster, 2-buster, 2.7-buster, 2.6-buster
ARG RUBY_VARIANT=2.7

FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${RUBY_VARIANT}

LABEL version="1.0"
LABEL author="Walace Silva"
LABEL email="wsilva.emp@gmail.com"

ENV NODE_VERSION 14

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x -o | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends nodejs yarn mariadb-client libmariadb-dev

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    export LC_ALL="en_US.utf8"

WORKDIR "/workspace"

STOPSIGNAL SIGTERM

CMD ["/bin/bash"]