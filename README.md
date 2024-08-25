# テーブル設計

## users テーブル

| Column             | Type          | Options     |
| ------------------ | ------        | ----------- |
| nickname           | string        | null: false |
| email              | string        | null: false, unique: true |
| encrypted_password | string　　　　　| null: false | 
| last_name          | string        | null: false |
| first_name         | string        | null: false |
| last_name_kana     | string        | null: false |
| first_name_kana    | string        | null: false |
| birthday           | date          | null: false |

- has_many :items



## items テーブル

| Column           | Type      | Options     |
| ------           | ------    | ----------- |
| item_name        | string    | null: false |
| description      | text      | null: false | 
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| shipping_fee_id     | integer    | null: false |
| ship_from_address_id| integer    | null: false |
| shipping_day_id    | integer    | null: false |
| price               | integer   | null: false |
| user             | reference | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase_record




## purchase_record テーブル

| Column        | Type       | Options      |
| ------        | ---------- | ------------ |
| user             | reference | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

- belongs_to :Item
- has_one :shipping_addresses




## shipping_address テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| post_code          | string     | null: false  |
| prefecture_id        | integer    | null: false  |
| city               | string     | null: false  |
| street_address     | string     | null: false  |
| building_name      | string     |              |
| phone_number       | string     | null: false  |
| purchase_record | references | null: false, foreign_key: true |

- belongs_to :purchase_record


