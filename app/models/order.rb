class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :theater
  belongs_to :movie
end
