class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  has_one :review
  validates :total_price, presence: true, numericality: {only_float: true}
  validates :start_date, presence: true
  validates :end_date, presence: true
end
