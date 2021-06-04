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

    describe 'アソシエーションのテスト' do
        let(:association) do
            described_class.reflect_on_association(target)
        end

        context 'Micropostモデルとの関係' do
            let(:target) { :microposts }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
        end

        context 'Likeモデルとの関係' do
            let(:target) { :likes }
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

        context 'Review_likeモデルとの関係' do
            let(:target) { :review_likes }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
        end

        context 'Following_relationshipモデルとの関係' do
            let(:target) { :following_relationships }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
            it '結合するモデルのクラスはRelationship' do
                expect(association.class_name).to eq 'Relationship'
            end
        end

        context 'Followingモデルとの関係' do
            let(:target) { :following }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
            it '結合するモデルのクラスはUser(Follower)' do
                expect(association.class_name).to eq 'User'
            end
        end

        context 'Follower_relationshipsモデルとの関係' do
            let(:target) { :follower_relationships }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
            it '結合するモデルのクラスはRelationship' do
                expect(association.class_name).to eq 'Relationship'
            end
        end

        context 'Followerモデルとの関係' do
            let(:target) { :followers }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
            it '結合するモデルのクラスはUser(Following)' do
                expect(association.class_name).to eq 'User'
            end
        end

        context 'Reviewモデルとの関係' do
            let(:target) { :reviews }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
        end

        context 'Wisheモデルとの関係' do
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

        context 'Recordモデルとの関係' do
            let(:target) { :records }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
        end

        context 'Commentモデルとの関係' do
            let(:target) { :comments }
            it '1:Nとなっている' do
                expect(association.macro).to eq :has_many
            end
        end
    end

    describe 'データベースへの接続のテスト' do
        subject { described_class.connection_config[:database] }
    
        it '指定のDBに接続していること' do
            is_expected.to match(/monochords_test/)
        end
    end
end
