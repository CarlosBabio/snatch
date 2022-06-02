class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  has_one :review
  validates :total_price, presence: true, numericality: { only_float: true }
  validates :start_date, presence: true
  validates :end_date, presence: true

  before_validation :calculate_total_price

  def calculate_total_price
    return unless start_date && end_date

    self.total_price = (bike.price_per_day * (end_date - start_date).to_i).to_i
  end
end
