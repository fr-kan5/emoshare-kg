class Comment < ApplicationRecord
  belongs_to :album
  belongs_to :user

  validates :text, presence: true
end
