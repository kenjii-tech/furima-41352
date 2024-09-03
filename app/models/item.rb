require 'active_hash'

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  validates :name, :description, presence: true
  validate :image_presence
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: 'を選択してください' }

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true,
    message: 'は¥300~¥9,999,999の間で入力してください'
  }

  private

  def image_presence
    errors.add(:image, 'を選択してください') unless image.attached?
  end
end
