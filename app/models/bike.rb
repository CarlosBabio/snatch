class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :bookmarks
  has_many :users, through: :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :category, presence: true
end
