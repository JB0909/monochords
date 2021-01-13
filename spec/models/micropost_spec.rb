require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) { build(:user) }

  describe 'バリデーション' do
    let(:micropost) { create(:micropost) }

    it "バリデーションが有効であること" do
      expect(micropost).to be_valid
    end

    context 'user_idカラム' do

      it "user_idがnilの場合無効" do
        micropost.user_id = nil
        expect(micropost).to be_invalid
      end

    end

    context 'bodyカラム' do
      
      it "空欄の場合無効" do
        micropost.body = nil
        expect(micropost).to be_invalid
      end

      it "256文字以上の場合無効" do
        micropost.body = "a" * 256
        expect(micropost).to be_invalid
      end

    end
    
  end

  describe "順序付け" do
    let!(:day_before_yesterday) { create(:micropost, :day_before_yesterday) }
    let!(:now) { create(:micropost, :now) }
    let!(:yesterday) { create(:micropost, :yesterday) }

    it "nowが最新であること" do
      expect(Micropost.first).to eq now
    end

  end

  describe "dependent :destroyテスト" do
    before do
      user.save
      user.microposts.create!(body: "test")
    end

    it "Micropostのカウントが減ること" do
      expect do
        user.destroy
      end.to change(Micropost, :count).by(-1)
    end
    
  end

end
