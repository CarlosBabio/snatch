class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :start_date, :end_date, validates_date: true
  validates :total_price, presence: true, numericality: {only_float: true}
end
