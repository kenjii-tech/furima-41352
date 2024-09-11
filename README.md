# テーブル設計

## users テーブル

| Column             | Type       | Options     |      
| ------------------ | ------     | ----------- |      
| nickname           | string     | null: false |      
| email              | string     | null: false, unique: true |      
| encrypted_password | string     | null: false |       
| last_name          | string     | null: false |      
| first_name         | string     | null: false |      
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :purchase_records



## items テーブル

| Column           | Type      | Options                        |
| ------           | ------    | -----------                    |
| name             | string    | null: false                    |#商品名
| description      | text      | null: false                    |#説明
| category_id      | integer   | null: false                    |#カテゴリーp
| condition_id     | integer   | null: false                    |#商品の状態p
| shipping_fee_id  | integer   | null: false                    |#配送料の負担p
| prefecture_id    | integer   | null: false                    |#発送元の地域p
| shipping_day_id  | integer   | null: false                    |#発送までの日数p
| price            | integer   | null: false                    |#価格
| user             | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order




## order テーブル

| Column     | Type       | Options      |
| ------     | ---------- | ------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address




## shipping_addresses テーブル

| Column          | Type       | Options      |
| ------          | --------   | ------------ |
| post_code       | string     | null: false  |
| prefecture_id   | integer    | null: false  |
| city            | string     | null: false  |
| street_address  | string     | null: false  |
| building_name   | string     |              |
| phone_number    | string     | null: false  |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order





商品名
説明
カテゴリーp
商品の状態p
配送料の負担p
発送元の地域p
発送までの日数p
価格