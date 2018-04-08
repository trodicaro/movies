#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

50.times do
  Movie.create!(name: FFaker.Movie.title, duration: random(90..120))
end
