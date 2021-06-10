require 'rails_helper'

RSpec.describe ReviewLike, type: :model do
  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
      it 'Userモデルとの関係' do
        expect(ReviewLike.reflect_on_association(:user).macro).to eq :belongs_to
      end
      
      it 'Reviewモデルとの関係' do
        expect(ReviewLike.reflect_on_association(:review).macro).to eq :belongs_to
      end
    end
  end
end
