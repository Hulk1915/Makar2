# Используем базовый образ с нужной версией Ruby
FROM ruby:3.2.2

# Устанавливаем необходимые зависимости
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Устанавливаем Bundler
RUN gem install bundler

# Создаем директорию приложения внутри контейнера
WORKDIR /app

# Копируем Gemfile и Gemfile.lock в контейнер
COPY Gemfile Gemfile.lock ./

# Устанавливаем зависимости
RUN bundle install

# Копируем все файлы из текущей директории в контейнер
COPY . .

# Устанавливаем переменную окружения для Rails
ENV RAILS_ENV=production

# Создаем базу данных и выполняем миграции
RUN bundle exec rails db:wait
RUN bundle exec rails db:create
RUN bundle exec rails db:migrate

# Экспонируем порт 3000
EXPOSE 3000

# Запускаем Rails-приложение
CMD ["rails", "server", "-b", "0.0.0.0"]
