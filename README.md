# pg_template

Plantilla para crear una app Rails.

Creada con https://github.com/mattbrictson/rails-template

## Pre-requisitos

This project requires:

* Ruby 2.6.3, preferably managed using [rbenv][]
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

Run the `bin/setup` script. This script will:

* Check you have the required Ruby version
* Install dependencies using Bundler
* Create a `.env.development` file
* Create, migrate, and seed the database

### Run it!

<!--
  TODO:
  1. Run `bin/rake` to run all tests and lint checks. -->
1. Start the app with `bundle exec rails server`

Access the app at <http://localhost:3000/>.

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

