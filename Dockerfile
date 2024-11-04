# ベースイメージの指定（nginxとphp-fpmを使った軽量なイメージ）
FROM richarvey/nginx-php-fpm:3.1.6

# ホストのファイルをすべてコンテナ内にコピー
COPY . .

# エンドポイント用のファイルを指定のディレクトリにコピー
# 例：apiフォルダを/var/www/html/apiに配置する
COPY api /var/www/html/api

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# コンテナの開始スクリプト
CMD ["/start.sh"]
