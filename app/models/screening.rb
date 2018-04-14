class Screening < ApplicationRecord
  belongs_to :theater
  belongs_to :movie

  scope :scheduled_today, -> { where(scheduled_at: Date.today.all_day) }

  def sold_out
  end

  def scheduled_today?
    scheduled_at.today?
  end

  def passed?
    scheduled_at < DateTime.now
  end
end
