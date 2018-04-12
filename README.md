### This project runs on:
* Rails 5 (requires ruby 2.2.2+)
* PostgreSQL  9.5.12

### To get up and running
* `git clone git@github.com:trodicaro/movies.git`
* `cd movies`
* `gem install bundler`
* `export MOVIES_DATABASE_PASSWORD=your_password` (redo this step when rebooting)
* if postgres user password not known ([per this SO thread](https://stackoverflow.com/questions/7695962/postgresql-password-authentication-failed-for-user-postgres)): 
    `sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';" && sudo service postgresql restart` 
* `sudo -u postgres createuser -s movies`
* `sudo -u postgres psql`
* postgres=# `\password pguser` (complete details on this [Digital Ocean how-to](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04))
* `create user movies with password 'your_password';`
<!-- * `create database movies_development; create database movies_test;` -->
* `create role movies with createdb login password 'your_password';`
* `bundle install`
* `rails db:create db:migrate`

### To run tests
* `bundle exec rspec`

### To view the app
* `rails s` and in browser visit http://0.0.0.0:3000/

### Movie theater - user stories

### MVP
As a customer:
* I want to see a page with upcoming movies scheduled at each theater
* I want to see which movies are sold out (disabled)
* I want to purchase tickets for an available showing
* I want to receive an email confirmation

As a theater owner:
* I want to see on my dashboard popular movies
* I want to see on my dashboard popular times
* I want to see on my dashboard popular total revenue
* I want to see on my dashboard popular revenue by day of the week

### Nice to have:
* authentication to use dashboard
* automate the setup ([sample how-to](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04))
* continuous integration and test coverage ([sample how-to](https://medium.com/craft-academy/getting-started-with-rails-tests-continuous-integration-deployment-7b5bfec905a5))
* save pics with Paperclip ([sample how-to](http://julianveling.com/?p=18))
* React-ify some components (eg:movie, movie list, etc)

### Notes
* App seeds and uses links for movie images via themoviedb API - must be connected to internet to work
* Removed gem Spring - it kept not killing the server processes and it lead to errors with registering new code (eg: changes in secrets.yml didn't reflect in Rails.application.secrets)
