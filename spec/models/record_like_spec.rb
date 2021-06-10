require 'rails_helper'

RSpec.describe RecordLike, type: :model do
  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
      it 'Userモデルとの関係' do
        expect(RecordLike.reflect_on_association(:user).macro).to eq :belongs_to
      end

      it 'Recordモデルとの関係' do
        expect(RecordLike.reflect_on_association(:record).macro).to eq :belongs_to
      end
    end
  end
end
