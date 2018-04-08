class CreditCard < ApplicationRecord
  belongs_to :customer
  # validations: card number has enough digits, visa starts with 4, not expired
end
