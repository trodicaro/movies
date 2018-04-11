require 'faker'
require 'net/http'
require 'json'

Theater.create!(name: 'Screen 1', seating: [100, 250, 50].sample)
Theater.create!(name: 'Screen 2', seating: [100, 250, 50].sample)
Theater.create!(name: 'Screen 3', seating: [100, 250, 50].sample)
Theater.create!(name: 'Screen 4', seating: [100, 250, 50].sample)
Theater.create!(name: 'Screen 5', seating: [100, 250, 50].sample)

# http://blog.honeybadger.io/how-to-try-again-when-exceptions-happen-in-ruby/
uri =  URI("http://api.themoviedb.org/4/discover/movie?api_key=#{Rails.application.secrets.themoviedb_api_key}&sort_by=popularity.desc&primary_release_year=#{Date.today.year}")

begin
  retries ||= 0
  puts "try ##{ retries }"
  response = Net::HTTP.get(uri)
rescue
  retry if (retries += 1) < 3
end

movies = JSON.parse(response)["results"]

movies.map do |movie| Movie.create!(
  name: movie['title'],
  duration: rand(90..120),
  backdrop_path: movie['backdrop_path'],
  overview: movie['overview'])
end

40.times do
  customer = Customer.create!(name: Faker::Name.name , email: Faker::Internet.email)

  customer.credit_cards << CreditCard.new(number: Faker::Business.credit_card_number,
    expiration: Faker::Business.credit_card_expiry_date,
    issuer: ['Visa', 'MasterCard', 'Discover', 'Amex'].sample)

  customer.orders << Order.new(time: rand(1..500).business_hours.from_now,
    amount: rand(5.00..20.00),
    movie: Movie.all.sample,
    theater: Theater.all.sample)
end

