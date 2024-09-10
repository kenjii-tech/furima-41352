require 'rails_helper'

RSpec.describe Formobject, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @formobject = FactoryBot.build(:formobject,user_id: @user.id, item_id: @item.id, token: 'tok_abcdefghijk00000000000000000')
  end

  describe 'validations' do
    context '商品購入ができる時' do
      it 'is valid with all attributes' do
        expect(@formobject).to be_valid
      end
    end

    context '商品購入ができない時' do
    end

    it '郵便番号が空の場合は無効である' do
      @formobject.post_code = nil
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include("Post code can't be blank")
    end

    it "郵便番号が'123-4567'の形式でない場合は無効である" do
      @formobject.post_code = nil
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include("Post code must be in the format '123-4567'")
    end

    it '都道府県が選択されていない場合は無効である' do
      @formobject.prefecture_id = nil
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include('Prefecture must be selected')
    end

    it '市区町村が空の場合は無効である' do
      @formobject.city = nil
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include("City can't be blank")
    end

    it '電話番号が空の場合は無効である' do
      @formobject.phone_number = nil
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が10桁または11桁でない場合は無効である' do
      @formobject.phone_number = "888"
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include('Phone number must be 10 or 11 digits')
    end

    it 'トークンが空の場合は無効である' do
      @formobject.token = nil
      @formobject.valid?
      expect(@formobject.errors.full_messages).to include("Token can't be blank")
    end
  end
end
