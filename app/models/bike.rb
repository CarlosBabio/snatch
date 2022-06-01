class Bike < ApplicationRecord
  CATEGORIES = %w[Scooter Motorcycle Bicycle]

  belongs_to :user
  has_many :bookings
  has_many :bookmarks
  has_many :users, through: :bookings
  has_many_attached :photos

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 200 }
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :engine_size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
  validates :license_plate, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
end
