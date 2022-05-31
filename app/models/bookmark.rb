class Bookmark < ApplicationRecord
  belongs_to :user
  validates :comment, length: { maximum: 50 }
end
