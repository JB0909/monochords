class Record < ApplicationRecord
  belongs_to :user
  #Comment
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
end
