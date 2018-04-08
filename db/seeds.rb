require 'faker'

Theater.create!(name: 'The Music Box', seating: [100, 250, 50].sample)
Theater.create!(name: 'Davis Theater', seating: [100, 250, 50].sample)
Theater.create!(name: 'ShowPlace ICON', seating: [100, 250, 50].sample)
Theater.create!(name: "Landmark's Century Center", seating: [100, 250, 50].sample)
Theater.create!(name: 'Gene Siskel Film Center', seating: [100, 250, 50].sample)
Theater.create!(name: 'AMC River East 21', seating: [100, 250, 50].sample)

Movie.create!(name: 'A Wrinkle in Time', duration: rand(90..120))
Movie.create!(name: 'The Shape of Water', duration: rand(90..120))
Movie.create!(name: 'Paddington 2', duration: rand(90..120))
Movie.create!(name: 'In the Fade', duration: rand(90..120))
Movie.create!(name: 'Loveless', duration: rand(90..120))
Movie.create!(name: 'Black Panther', duration: rand(90..120))
Movie.create!(name: 'The Death of Stalin', duration: rand(90..120))
Movie.create!(name: 'Anihilation', duration: rand(90..120))
Movie.create!(name: 'Pacific Rim', duration: rand(90..120))
Movie.create!(name: 'Isle of Dogs', duration: rand(90..120))

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

