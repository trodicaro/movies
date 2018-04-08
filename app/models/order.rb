class Order < ApplicationRecord
  belongs_to :customer, :theater, :movie
end
