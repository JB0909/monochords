class Record < ApplicationRecord
  belongs_to :user
  #Comment
  has_many :comments, dependent: :destroy
  #Like
  has_many :record_likes, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  def liked_by?(user)
    record_likes.where(user_id: user.id).exists?
  end
end
