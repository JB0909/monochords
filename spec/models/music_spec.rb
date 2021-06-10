require 'rails_helper'

RSpec.describe Music, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
        described_class.reflect_on_association(target)
    end
    
    context 'Wishモデルとの関係' do
      let(:target) { :wishes }
      it '1:Nとなっている' do
          expect(association.macro).to eq :has_many
      end
    end

    context 'Practicingモデルとの関係' do
      let(:target) { :practicings }
      it '1:Nとなっている' do
          expect(association.macro).to eq :has_many
      end
    end

    context 'Practicedモデルとの関係' do
      let(:target) { :practiceds }
      it '1:Nとなっている' do
          expect(association.macro).to eq :has_many
      end
    end
  end
end
