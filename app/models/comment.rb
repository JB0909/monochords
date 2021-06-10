class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, optional: true
  belongs_to :record, optional: true
  belongs_to :review, optional: true

  #バリデーション
  validates :content, presence: true, length: { maximum: 255 }
end
