# Store Demo

* [Performance Workshop](https://github.com/JumpstartLab/store_demo/tree/performance-workshop)

### Setup

Clone the repo, then run:

```plain
$ bundle install
$ bundle exec rake db:migrate db:test:prepare db:seed
$ unicorn -p 3000
```

Log in as admin:

* email: rosie@example.com
* password: password

Log in as a regular user:

* email: judy@example.com
* password: password

## About the Project

Frank's Monsterporium has the best selection, nay, the ONLY selection of Frank's awesome creations on the web.

### Original Source

This project was created for the [gSchool StoreEngine Project](http://tutorials.jumpstartlab.com/projects/store_engine.html).

The original source for this codebase can be found at [github.com/raphweiner/store_engine](https://github.com/raphweiner/store_engine).

