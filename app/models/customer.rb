class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end
end
