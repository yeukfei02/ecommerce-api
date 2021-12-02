
# ecommerce-api

ecommerce-api

documentation: <https://documenter.getpostman.com/view/3827865/TzCP8Tks>

api url: <https://ecommerce-api-rails.herokuapp.com/>

cms url: <https://ecommerce-api-rails.herokuapp.com/admin>

```
username: admin@admin.com
password: adminadmin
```

## Requirement

- install ruby (v2.6.6)
- install gem
- install bundle
- install yarn
- install node (v12+)

## Testing and run

```zsh
// install ruby dependencies
$ bundle install

// install node dependencies
$ yarn

// run api in local
$ rails s

// create controller
$ rails g controller <controllerName>

// create model
$ rails g model <modelName>

// create migration file
$ rails g migration <migrationName>

// db migration
$ rails db:migrate

// db rollback
$ rails db:rollback

// list routes
$ rails routes

// rubocop
$ rubocop --auto-correct

// reek
$ reek

// generate schema info in model
$ annotate --models

// audit Gemfile.lock
$ bundler-audit
```

## ActiveAdmin

```zsh
// create admin view
$ rails g active_admin:resource <resourcesName>

// open localhost:3000/admin
email: admin@admin.com
password: adminadmin
```
