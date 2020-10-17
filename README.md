TODO: agregar badges

# eldesasosiego

Plantilla para crear una app Rails.

Creada con https://github.com/mattbrictson/rails-template

## Pre-requisitos

This project requires:

* Ruby 2.7.2, preferably managed using [rbenv][]
* libmagic-dev (en Ubuntu `sudo apt install -y libmagic-dev`)
* Node.js >= 10 ([Instalar en Ubuntu](https://github.com/nodesource/distributions/blob/master/README.md#debinstall))
* Chromedriver for Capybara testing
* PostgreSQL must be installed and accepting connections
* [Redis][] must be installed and running on localhost with the default port

## Snippet para tuitear
```
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_KEY']
  config.consumer_secret     = ENV['TWITTER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

client.update('aaay ay ay')
```

## Development

### Setup

#### Crear rol en Postgres

1. Ingresar a la consola de postgres:
```
sudo -u postgres psql template1
```
2. Crear el rol
```
create role eldesasosiego password 'eldesasosiego' login superuser;
```

3. Ejecutar el script `bin/setup`. This script will:

* Check you have the required Ruby version
* Install dependencies using Bundler
* Create a `.env.development` file
* Create, migrate, and seed the database

### Testear y ejecutar

1. Instalar overcommit: `gem install overcommit`
2. Correr los linters con `overcommit -r`
3. Correr los tests con `bundle exec rspec`
4. Instalar foreman: `gem install foreman`
5. Levantar el servidor local con `foreman start`

Acceder a la app en <http://localhost:3000/>.

## Deployment

Ensure the following environment variables are set in the deployment environment:

* `REDIS_URL`
* `SECRET_KEY_BASE`

Optionally:

* `BASIC_AUTH_PASSWORD`
* `BASIC_AUTH_USERNAME`
* `POSTMARK_API_KEY`
* `RAILS_FORCE_SSL`
* `RAILS_HOSTNAME`
* `RAILS_LOG_TO_STDOUT`
* `RAILS_MAX_THREADS`
* `RAILS_SERVE_STATIC_FILES`
* `SIDEKIQ_CONCURRENCY`
* `SIDEKIQ_WEB_PASSWORD`
* `SIDEKIQ_WEB_USERNAME`
* `WEB_CONCURRENCY`

[rbenv]:https://github.com/sstephenson/rbenv
[redis]:http://redis.io
[Homebrew]:http://brew.sh
