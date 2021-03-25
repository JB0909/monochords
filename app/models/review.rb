class Review < ApplicationRecord
  belongs_to :user
  belongs_to :music
  #Comment
  has_many :comments, dependent: :destroy
  #Like
  has_many :review_likes, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  def liked_by?(user)
    review_likes.where(user_id: user.id).exists?
  end
end
