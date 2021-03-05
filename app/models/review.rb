class Review < ApplicationRecord
  belongs_to :user
  belongs_to :music
  #Comment
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
end
