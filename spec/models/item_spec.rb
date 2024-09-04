require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it 'is valid with all attributes' do
      @item = FactoryBot.build(:item)
      expect(@item).to be_valid
    end

    it 'is invalid without an image' do
      @item = FactoryBot.build(:item)
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")

      # @item = FactoryBot.build(:item, image: nil)
      # @item.valid?
      # expect(@item.errors.full_messages).to include("can't be blank")
    end

    it 'is invalid without a name' do
      @item = FactoryBot.build(:item, name: nil)
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      @item = FactoryBot.build(:item, description: nil)
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a category' do
      @item = FactoryBot.build(:item, category_id: nil)
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'is invalid without a condition' do
      @item = FactoryBot.build(:item, condition_id: nil)
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    it 'is invalid without a shipping fee' do
      @item = FactoryBot.build(:item, shipping_fee_id: nil)
      @item.valid?
      expect(@item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it 'is invalid without a prefecture' do
      @item = FactoryBot.build(:item, prefecture_id: nil)
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'is invalid without a shipping day' do
      @item = FactoryBot.build(:item, shipping_day_id: nil)
      @item.valid?
      expect(@item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it 'is invalid without a price' do
      @item = FactoryBot.build(:item, price: nil)
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it 'is invalid with a price less than 300' do
      @item = FactoryBot.build(:item, price: 299)
      @item.valid?
      expect(@item.errors[:price]).to include('must be between ¥300 and ¥9,999,999')
    end

    it 'is invalid with a price greater than 9,999,999' do
      @item = FactoryBot.build(:item, price: 10_000_000)
      @item.valid?
      expect(@item.errors[:price]).to include('must be between ¥300 and ¥9,999,999')
    end
  end
end
