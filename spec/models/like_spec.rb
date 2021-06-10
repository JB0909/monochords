require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
      it 'Userモデルとの関係' do
        expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
      end

      it 'Micropostモデルとの関係' do
        expect(Like.reflect_on_association(:micropost).macro).to eq :belongs_to
      end
    end
  end
end
