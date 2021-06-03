require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'バリデーション' do
        subject { test_user.valid? }
        let(:user) { create(:user) }
        let(:user_2) { create(:user) }

        context 'usernameカラム' do
            let(:test_user) { user }

            it '空欄ではないこと' do
                test_user.username = ''
                is_expected.to eq false
            end
            it '空欄時エラー発生' do
                test_user.username = ''
                test_user.valid?
                expect(test_user.errors[:username]).to include("が入力されていません。")
            end
        end

        context 'emailカラム' do
            let(:test_user) { user }
            let(:test_user_2) { user_2 }

            it '空欄ではないこと' do
                test_user.email = ''
                is_expected.to eq false
            end
            
            it '空欄時エラー発生' do
                test_user.email = ''
                test_user.valid?
                expect(test_user.errors[:email]).to include("が入力されていません。")  
            end

            it '一意であること' do
                test_user.email = 'test1@test.co.jp'
                test_user.save
                test_user_2.email = 'test1@test.co.jp'
                test_user_2.save
                test_user_2.valid?
                expect(test_user_2).to be_invalid
            end

            it '一意ではない場合エラー発生' do
                test_user.email = 'test1@test.co.jp'
                test_user.save
                test_user_2.email = 'test1@test.co.jp'
                test_user_2.save
                test_user_2.valid?
                expect(test_user_2.errors[:email]).to include("は既に使用されています。")
            end
        end

        context 'passwordカラム' do
            let(:test_user) { user }

            it '空欄ではないこと' do
                test_user.password = ''
                is_expected.to eq false
            end

            it '空欄時エラー発生' do
                test_user.password = ''
                test_user.valid?
                expect(test_user.errors[:password]).to include("が入力されていません。")
            end

            it '6文字以上であること' do
                test_user.password = Faker::Lorem.characters(number: 1)
                is_expected.to eq false
            end

            it '6文字未満時はエラー発生' do
                test_user.password = Faker::Lorem.characters(number: 1)
                test_user.valid?
                expect(test_user.errors[:password]).to include("は6文字以上に設定して下さい。")  
            end

            it 'パスワードが不一致' do
                test_user.password = 'password_1'
                test_user.password_confirmation = 'password_2'
                test_user.valid?
                expect(test_user.errors[:password_confirmation]).to include("が内容とあっていません。")  
            end
        end
    end
end
