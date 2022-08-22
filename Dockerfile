FROM ubuntu
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install software-properties-common apt-transport-https -y && add-apt-repository ppa:ondrej/php -y && apt update && apt install -y php7.4 php7.4-cli composer git
RUN git clone https://github.com/laravel/quickstart-basic /quickstart
WORKDIR /quickstart/
RUN composer install
RUN php artisan migrate

CMD ["php", "artisan", "serve"]
