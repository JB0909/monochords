class Review < ApplicationRecord
  belongs_to :user
  belongs_to :music

  default_scope -> { order(created_at: :desc) }
end
