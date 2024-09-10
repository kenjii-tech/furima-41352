FactoryBot.define do
  factory :formobject do
    post_code { '123-4567' } # 郵便番号のフォーマット
    prefecture_id { Faker::Number.between(from: 1, to: 47) } # 都道府県ID（1-47の範囲）
    city { Faker::Address.city } # 市区町村
    street_address { Faker::Address.street_address } # 番地
    building_name { Faker::Address.secondary_address } # 建物名（オプション）
    phone_number { Faker::Number.number(digits: 10).to_s } # 電話番号（10桁）
  end
end
