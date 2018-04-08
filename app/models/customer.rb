class Customer < ApplicationRecord
  has_many :credit_cards, :orders
end
