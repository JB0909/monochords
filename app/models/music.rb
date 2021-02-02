class Music < ApplicationRecord
    #=====アソシエーション=====
    #Review
    has_many :reviews, dependent: :destroy
    #Wish
    has_many :wishes, dependent: :destroy
    #Practicing
    has_many :practicings, dependent: :destroy
    #Practiced
    has_many :practiceds, dependent: :destroy
    #=====バリデーション=====
    validates :external_id, uniqueness: { scope: [:album_name] }

    def already_wishes?(user)
        wishes.where(user_id: user.id).exists?
    end

    def already_practicings?(user)
        practicings.where(user_id: user.id).exists?
    end

    def already_practiceds?(user)
        practiceds.where(user_id: user.id).exists?
    end
end
