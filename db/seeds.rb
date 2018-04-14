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
  backdrop_path: movie['backdrop_path'],
  overview: movie['overview'])
end

theaters = Theater.all

Movie.all.each do |movie|
  rand(5..10).times do |i|
    movie.screenings << Screening.new(scheduled_at: rand(1..72).business_hours.from_now.beginning_of_hour, theater: theaters.sample)
  end
end

# 40.times do
#   customer = Customer.create!(name: Faker::Name.name , email: Faker::Internet.email)

#   customer.orders << Order.new(time: rand(1..500).business_hours.from_now,
#     total_cost: rand(5.00..20.00),
#     seat_count: rand(1..6),
#     screening: Screening.all.sample
# end

