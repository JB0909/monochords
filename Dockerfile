# FROM ruby:2.7.1

# RUN apt-get update -qq && \
#     apt-get install -y build-essential \
#     nodejs\
#     mariadb-server\
#     mariadb-client\
#     yarn

# WORKDIR /monochords

# COPY Gemfile /monochords/Gemfile
# COPY Gemfile.lock /monochords/Gemfile.lock

# RUN gem install bundler -v 2.2.17
# RUN bundle install

# RUN mkdir -p tmp/sockets

FROM ruby:2.7.1

# リポジトリを更新し依存モジュールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
    nodejs

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# ルート直下にmonochordsという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /monochords
WORKDIR /monochords

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /monochords/Gemfile
ADD Gemfile.lock /monochords/Gemfile.lock

# bundle installの実行

RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /monochords

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets