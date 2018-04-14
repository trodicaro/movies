class Screening < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  has_many :orders

  scope :scheduled_today, -> { where(scheduled_at: Date.today.all_day) }

  def sold_out?
    total_seats = self.orders.pluck(:seat_count).reduce(:+)

    return false if !total_seats

    total_seats > self.theater.seating
  end

  def scheduled_today?
    scheduled_at.today?
  end

  def passed?
    scheduled_at < DateTime.now
  end
end
