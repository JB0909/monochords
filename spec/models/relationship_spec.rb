require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context 'モデルとの関係' do
    it 'following' do
      expect(Relationship.reflect_on_association(:following).macro).to eq :belongs_to
    end
    
    it 'follower' do
      expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
    end
  end
end
