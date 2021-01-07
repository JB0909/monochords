class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    #=====バリデーション=====
    validates :name, presence: true
    validates :email, presence: true

    #パスワードはデフォルトで6文字以上を要求

    
end
