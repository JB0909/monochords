require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { build(:user) }
  describe 'バリデーション' do
    let(:review) { create(:review) }
    it "バリデーションが有効であること" do
      expect(review).to be_valid
    end

    context 'user_idカラム' do

      it "user_idがnilの場合無効" do
        review.user_id = nil
        expect(review).to be_invalid
      end

    end

    context 'bodyカラム' do
      
      it "空欄の場合無効" do
        review.content = nil
        expect(review).to be_invalid
      end

      it "256文字以上の場合無効" do
        review.content = "a" * 256
        expect(review).to be_invalid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
        described_class.reflect_on_association(target)
    end

    context 'Commentモデルとの関係' do
        let(:target) { :comments }
        it '1:Nとなっている' do
            expect(association.macro).to eq :has_many
        end
    end

    context 'Recview_likeモデルとの関係' do
      let(:target) { :review_likes }
      it '1:Nとなっている' do
          expect(association.macro).to eq :has_many
      end
    end

    context 'Userモデルとの関係' do
      let(:target) { :user }
      it '1:Nとなっている' do
          expect(association.macro).to eq :belongs_to
      end
    end

    context 'Musicモデルとの関係' do
      let(:target) { :music }
      it '1:Nとなっている' do
          expect(association.macro).to eq :belongs_to
      end
    end
  end
end
