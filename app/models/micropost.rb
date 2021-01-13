class Micropost < ApplicationRecord
    #=====アソシエーション=====
    #User
    belongs_to :user

    #=====バリデーション=====
    validates :user_id, presence: true
    validates :body, presence: true, length: {maximum: 255 }


    default_scope -> { order(created_at: :desc) }
end
