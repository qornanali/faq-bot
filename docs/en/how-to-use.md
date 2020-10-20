# How to use this project

**Table of contents**

* [Getting started with project](#getting-started)
  + [Prerequisite](#prerequisite)
  + [Setup project](#setup-project)
  + [Running server on local](#running-server-on-local)
* [In Development process](#in-development-process)
  + [Check specifications](#check-specifications)
* [How to contribute](#how-to-contribute)

## Getting started with project

### Prerequisite

1. Ruby ~> v2.5

2. Docker

3. Bundler ~> 2.1.4

To install, open terminal/command-line then run the following :

```console
$ gem install bundle -v 2.0.2
```

### Setup project

1. Setting up settings

Open terminal/command-line at project directory then run:

```console
$ cp config/application.yml.sample config/application.yml
```

**Change settings configuration**

`application.yml` contains _key_ and _value_ that use for application settings.
You can leave it or fill it as you like.

2. Set container

Open terminal / command-line at project directory, then run :

```console
$ docker-compose up -d
```

If you want to turn off container, run :

```console
$ docker-compose down --volumes
```

3. Create database

Open terminal/command-line at project directory, then run : 

```console
$ bin/rails db:create
```

**Create scheme to database**

```console
$ RAILS_ENV=test bin/rails db:migrate
$ RAILS_ENV=development bin/rails db:migrate
```

4. Installation dependencies-dependencies

**Rubygems Installation**

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ bundle set config path vendor/bundle
$ bundle install
```

### Running server on local

Open terminal/command-line at project directory then run the following :

```console
$ bin/rails s
```

By _default_, running on `http://localhost:3000`.

## In Development process

To maintain the code quality, run the following instructions everytime before sending _pull-request_:

### Specifications check

To make sure, your changes did not disrupt anything, try _unit-test_
We'll call it as `spec` in this project .

Open terminal / command-line at project directory then run the following :

```console
$ bundle exec rspec
```

Make sure your changes did not decrease the percentage of _code-coverage_ .

## How to contribute

Work in progress 🛠
