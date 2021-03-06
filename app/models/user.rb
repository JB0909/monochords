class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable

    attachment :profile_image

    #=====アソシエーション=====
    #Micropost
    has_many :microposts, dependent: :destroy
    #Like
    has_many :likes, dependent: :destroy
    has_many :record_likes, dependent: :destroy
    has_many :review_likes, dependent: :destroy
    #Relationship
    has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
    has_many :following, through: :following_relationships
    has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :follower_relationships
    #Review
    has_many :reviews, dependent: :destroy
    #Wish
    has_many :wishes, dependent: :destroy
    #Practicing
    has_many :practicings, dependent: :destroy
    #Practiced
    has_many :practiceds, dependent: :destroy
    #Record
    has_many :records, dependent: :destroy
    #Comment
    has_many :comments, dependent: :destroy

    #=====バリデーション=====
    validates :username, presence: true
    validates :email, presence: true



    #パスワードはデフォルトで6文字以上を要求

    #フォローしているかを確認するメソッド
    def following?(user)
        following_relationships.find_by(following_id: user.id)
    end
    
    #フォローするときのメソッド
    def follow(user)
        following_relationships.create!(following_id: user.id)
    end
    
    #フォローを外すときのメソッド
    def unfollow(user)
        following_relationships.find_by(following_id: user.id).destroy
    end
end
