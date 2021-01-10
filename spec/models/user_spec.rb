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
                expect(test_user.errors[:username]).to include("can't be blank")
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
                expect(test_user.errors[:email]).to include("can't be blank")  
            end

            it '一意であること' do
                #:confirmableを追加した場合は、saveするとunconfirmed_emailに保存されるためエラー発生
                test_user.email = 'test1@test.co.jp'
                test_user.save
                test_user_2.email = 'test1@test.co.jp'
                test_user_2.save
                test_user_2.valid?
                expect(test_user_2).to be_invalid
            end

            it '一意ではない場合エラー発生' do
                #:confirmableを追加した場合は、saveするとunconfirmed_emailに保存されるためエラー発生
                test_user.email = 'test1@test.co.jp'
                test_user.save
                test_user_2.email = 'test1@test.co.jp'
                test_user_2.save
                test_user_2.valid?
                expect(test_user_2.errors[:email]).to include("has already been taken")
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
                expect(test_user.errors[:password]).to include("can't be blank")
            end

            it '6文字以上であること' do
                test_user.password = Faker::Lorem.characters(number: 1)
                is_expected.to eq false
            end

            it '6文字未満時はエラー発生' do
                test_user.password = Faker::Lorem.characters(number: 1)
                test_user.valid?
                expect(test_user.errors[:password]).to include("is too short (minimum is 6 characters)")  
            end

            it 'パスワードが不一致' do
                test_user.password = 'password_1'
                test_user.password_confirmation = 'password_2'
                test_user.valid?
                expect(test_user.errors[:password_confirmation]).to include("doesn't match Password")  
            end
        end
    end
end
