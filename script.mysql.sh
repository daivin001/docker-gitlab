#!/bin/bash

apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      wget ca-certificates apt-transport-https \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E1DD270288B4E6030699E45FA1715D88E1DF1F24 \
 && echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu xenial main" >> /etc/apt/sources.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6 \
 && echo "deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu xenial main" >> /etc/apt/sources.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8B3981E7A6852F782CC4951600A6F0A3C300EE8C \
 && echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu xenial main" >> /etc/apt/sources.list \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
 && echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
 && wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && echo 'deb https://deb.nodesource.com/node_8.x xenial main' > /etc/apt/sources.list.d/nodesource.list \
 && wget --quiet -O - https://dl.yarnpkg.com/debian/pubkey.gpg  | apt-key add - \
 && echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      sudo supervisor logrotate locales curl \
      nginx openssh-server mysql-client postgresql-client redis-tools \
      git-core gnupg2 ruby${RUBY_VERSION} python2.7 python-docutils nodejs yarn gettext-base \
      libmysqlclient20 libpq5 zlib1g libyaml-0-2 libssl1.0.0 \
      libgdbm3 libreadline6 libncurses5 libffi6 \
      libxml2 libxslt1.1 libcurl3 libicu55 libre2-dev tzdata unzip \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && locale-gen en_US.UTF-8 \
 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
 && gem install --no-document bundler \
 && rm -rf /var/lib/apt/lists/*
