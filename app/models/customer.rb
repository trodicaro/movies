class Customer < ApplicationRecord
  has_many :credit_cards
  has_many :orders
end
