class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  # validates :comment, length: { maximum: 50 }
end
