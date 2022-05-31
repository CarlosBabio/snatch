class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, :comment, presence: true
  validates :comment, length: {minimum: 5}, {maximum: 150}
  validates :rating, length: {minimum: 1}, {maximum: 5}
end
