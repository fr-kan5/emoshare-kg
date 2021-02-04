class Album < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :caption, presence: true
  validates :images, presence: true
end
