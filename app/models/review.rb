class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, :comment, presence: true
  validates :rating, length: {minimum: 1}, {maximum: 5}
end
