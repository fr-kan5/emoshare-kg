class Album < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :caption, presence: true
  validates :image, presence: true
end
