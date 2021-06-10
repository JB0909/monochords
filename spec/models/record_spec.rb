require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:user) { build(:user) }
  describe 'バリデーション' do
    let(:record) { create(:record) }
    it "バリデーションが有効であること" do
      expect(record).to be_valid
    end

    context 'user_idカラム' do

      it "user_idがnilの場合無効" do
        record.user_id = nil
        expect(record).to be_invalid
      end

    end

    context 'bodyカラム' do
      
      it "空欄の場合無効" do
        record.body = nil
        expect(record).to be_invalid
      end

      it "256文字以上の場合無効" do
        record.body = "a" * 256
        expect(record).to be_invalid
      end
    end
  end

  describe "順序付け" do
    let!(:day_before_yesterday) { create(:record, :day_before_yesterday) }
    let!(:now) { create(:record, :now) }
    let!(:yesterday) { create(:record, :yesterday) }

    it "nowが最新であること" do
      expect(Record.first).to eq now
    end
  end

  describe "dependent :destroyテスト" do
    before do
      user.save
      user.records.create!(body: "test")
    end

    it "Recordのカウントが減ること" do
      expect do
        user.destroy
      end.to change(Record, :count).by(-1)
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

    context 'Record_likeモデルとの関係' do
      let(:target) { :record_likes }
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
  end
end
