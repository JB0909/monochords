class Micropost < ApplicationRecord
    #=====アソシエーション=====
    #User
    belongs_to :user
    has_many :likes, dependent: :destroy

    #=====バリデーション=====
    validates :user_id, presence: true
    validates :body, presence: true, length: {maximum: 255 }


    default_scope -> { order(created_at: :desc) }

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end
end
