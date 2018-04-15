class Movie < ApplicationRecord
  has_many :screenings
  has_many :orders, through: :screenings

  scope :ordered_by_popularity, -> { order(popularity: :desc) }
end
