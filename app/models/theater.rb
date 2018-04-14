class Theater < ApplicationRecord
  has_many :screenings
  has_many :orders, through: :screenings
end
