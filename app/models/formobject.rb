class Formobject
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "must be in the format '123-4567'" }
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be selected' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
    validates :token
  end
  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
    ActiveRecord::Base.transaction do
      order = Order.create(user_id:, item_id:)
      ShippingAddress.create(
        order_id: order.id,
        post_code:,
        prefecture_id:,
        city:,
        street_address:,
        building_name:,
        phone_number:
      )
    end
  end
end
