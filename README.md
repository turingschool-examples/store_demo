# Store Demo

## Setup

First, clone the repo

The Ruby version is defined in both the `Gemfile` and `.ruby-version`. Install that specific version using your Ruby Version Manager.

Then in your terminal

```plain
$ bundle install
$ bundle exec rake db:migrate db:test:prepare db:seed
```

### Run the Tests

Run the tests and confirm that they're passing:

```plain
$ rake
```

## Running in Development

Start the server normally:

```plain
$ rails server
```

You can login in as admin:

* email: rosie@example.com
* password: password

Or as a regular user:

* email: judy@example.com
* password: password

## About the Project

Frank's Monsterporium has the best selection, nay, the ONLY selection of Frank's awesome creations on the web.

### Original Source

This project was created for the [gSchool StoreEngine Project](http://tutorials.jumpstartlab.com/projects/store_engine.html) by the legendary Raphael Weiner who's code [can be found here](https://github.com/raphweiner/store_engine).
