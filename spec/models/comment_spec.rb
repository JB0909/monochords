require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    subject(:user) { FactoryBot.create(:user) }
    subject(:micropost) { FactoryBot.create(:micropost) }
    subject(:record) { FactoryBot.create(:record) }
    subject(:review) { FactoryBot.create(:review) }
    subject(:comment) { FactoryBot.build(:comment, user_id: user.id, micropost_id: micropost.id) }

    it '正常に登録できること' do
      expect(comment).to be_valid
      comment.save
    end

    it '255文字以内なら登録できること' do
      comment.content = 'a' * 255
      expect(comment).to be_valid
      comment.save
    end

    it '空白だと登録できないこと' do
      comment.content = nil
      comment.valid?
      expect(comment.errors[:content]).to include("が入力されていません。")
    end

    it '256文字以上だと登録できないこと' do
      comment.content = 'a' * 256
      comment.valid?
      expect(comment.errors[:content]).to include("は255文字以下に設定して下さい。")
    end
  end

  describe 'アソシエーション' do
    context 'モデルとの関係' do
      it 'Userモデルとの関係' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end

      it 'Micropostモデルとの関係' do
        expect(Comment.reflect_on_association(:micropost).macro).to eq :belongs_to
      end
    end
  end
end
