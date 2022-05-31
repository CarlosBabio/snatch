class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :bikes
  has_many :bookmarks
  has_many :booked_bikes, through: :bookings, source: :bike
  has_one_attached :avatar
  has_one_attached :government_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
end
