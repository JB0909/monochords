class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable

    #=====アソシエーション=====
    #Micropost
    has_many :microposts, dependent: :destroy
    has_many :likes, dependent: :destroy

    #=====バリデーション=====
    validates :username, presence: true
    validates :email, presence: true

    #パスワードはデフォルトで6文字以上を要求

    
end
