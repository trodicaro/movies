class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :screening

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :screening
end
