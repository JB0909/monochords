class Review < ApplicationRecord
  belongs_to :user
  belongs_to :music
  #Comment
  has_many :comments, dependent: :destroy
  #Like
  has_many :review_likes, dependent: :destroy

  #バリデーション
  validates :user_id, presence: true
  validates :music_id, presence: true
  validates :content, presence: true, length: {maximum: 255 }
  default_scope -> { order(created_at: :desc) }

  def liked_by?(user)
    review_likes.where(user_id: user.id).exists?
  end
end
