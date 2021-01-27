class Music < ApplicationRecord
    #=====アソシエーション=====
    #Review
    has_many :reviews, dependent: :destroy
    
    validates :external_id, uniqueness: { scope: [:album_name] }
end
