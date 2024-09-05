require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'validations' do
    context '商品登録ができる時' do
      it 'is valid with all attributes' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it 'is invalid without a user' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include('must exist')
      end
    end

    it 'is invalid without an image' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a category' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'is invalid without a condition' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    it 'is invalid without a shipping fee' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it 'is invalid without a prefecture' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'is invalid without a shipping day' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it 'is invalid without a price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it 'is invalid with a price less than 300' do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include('must be between ¥300 and ¥9,999,999')
    end

    it 'is invalid with a price greater than 9,999,999' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors[:price]).to include('must be between ¥300 and ¥9,999,999')
    end
  end
end
