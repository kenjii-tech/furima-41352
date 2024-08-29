require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    let(:user) { FactoryBot.build(:user) }

    context '登録できない場合' do
      it 'nicknameが空では登録できない' do
        user.nickname = ''
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it 'emailが空では登録できない' do
        user.email = ''
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'passwordが空では登録できない' do
        user.password = ''
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it '苗字が空では登録できない' do
        user.last_name = ''
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end

      it '名前が空では登録できない' do
        user.first_name = ''
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it '苗字（カナ）が空では登録できない' do
        user.last_name_kana = ''
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank")
      end

      it '名前（カナ）が空では登録できない' do
        user.first_name_kana = ''
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it '生年月日が空では登録できない' do
        user.birthday = nil
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end
    end

    context '登録できる場合' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(user).to be_valid
      end
    end
  end
end
