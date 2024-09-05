FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'これはテスト用の商品です' }
    category_id { '2' }
    condition_id { '2' }
    shipping_fee_id { '2' }
    prefecture_id { '13' }
    shipping_day_id { '2' }
    price { '10000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/test_image.jpg')), filename: 'test_image.jpg',
                        content_type: 'image/jpeg')
    end
  end
end
