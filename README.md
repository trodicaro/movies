### This project runs on
* Rails 5 (requires ruby 2.2.2+)

### To get up and running
* `git clone git@github.com:trodicaro/movies.git`
* `cd movies`
* `gem install bundler`
* `bundle install`
* `rails db:create db:migrate`

### To run tests
Make sure you can run the following two commands.
* `bundle exec rspec`

### To view the app
* `rails s` and in browser visit http://0.0.0.0:3000/

### Movie theater - user stories

As a customer:
* I want to see a page with upcoming movies scheduled at each theater
* I want to see a listing for a specific theater
* I want to see which movies are sold out (disabled)
* I want to purchase tickets for an available showing
* I want to receive an email confirmation

As a theater owner:
* I want to see on my dashboard popular movies
* I want to see on my dashboard popular times
* I want to see on my dashboard popular total revenue
* I want to see on my dashboard popular revenue by day of the week


