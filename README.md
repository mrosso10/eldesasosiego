[![CircleCI](https://circleci.com/gh/programandoarg/pg_template.svg?style=shield&circle-token=742874aa9019950a5755d89184e6eabe0e6d1855)](https://circleci.com/gh/programandoarg/pg_template)
[![Maintainability](https://api.codeclimate.com/v1/badges/c5410ac4a17c846a121e/maintainability)](https://codeclimate.com/repos/5fadf053541ba101b500a47b/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/c5410ac4a17c846a121e/test_coverage)](https://codeclimate.com/repos/5fadf053541ba101b500a47b/test_coverage)

# pg_template

Plantilla para crear una app Rails.

Creada con https://github.com/mattbrictson/rails-template

## Pre-requisitos

This project requires:

* Ruby 2.6.3, preferably managed using [rbenv][]
* libmagic-dev (en Ubuntu `sudo apt install -y libmagic-dev`)
* Node.js >= 10 ([Instalar en Ubuntu](https://github.com/nodesource/distributions/blob/master/README.md#debinstall))
* Chromedriver for Capybara testing
* PostgreSQL must be installed and accepting connections
* [Redis][] must be installed and running on localhost with the default port

## Setup

### Crear rol en Postgres

1. Ingresar a la consola de postgres:
```
sudo -u postgres psql template1
```
2. Crear el rol
```
create role template_pg password 'template_pg' login superuser;
```

### bin/setup

1. Instalar overcommit `gem install overcommit`
2. Ejecutar el script `bin/setup`. This script will:

* Check you have the required Ruby version
* Install dependencies using Bundler
* Create a `.env.development` file
* Create, migrate, and seed the database

### Run it!

1. Correr los linters con `overcommit -r`
2. Correr los tests con `bundle exec rspec`
3. Instalar foreman `gem install foreman`
4. Levantar el servidor local con `foreman start`

Acceder a la app en <http://localhost:3000/>.

## Deployment

Ensure the following environment variables are set in the deployment environment:

* `DATABASE_URL`
* `RACK_ENV`
* `RAILS_ENV`
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

