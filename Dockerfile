FROM ruby:2.6.5
#必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn
#作業ディレクトリの作成＆指定
WORKDIR /tabilog
#ローカルのGemfileを追加
COPY Gemfile Gemfile.lock /tabilog/
#Gemfileのbundle installを実行
RUN gem install bundler && bundle install

