# テーブル設計

## users テーブル

| Column             | Type          | Options     |
| ------------------ | ------        | ----------- |
| nickname           | string        | null: false |
| email              | string        | null: false, unique: true |
| encrypted_password | string,integer| null: false | 
| last_name          | string        | null: false |
| first_name         | string        | null: false |
| last_name_kana     | string        | null: false |
| first_name_kana    | string        | null: false |
| birthday           | date          | null: false |


## items テーブル

| Column           | Type      | Options     |
| ------           | ------    | ----------- |
| item_name        | string    | null: false |
| description      | text      | null: false | 
| category         | string    | null: false |
| condition        | string    | null: false |
| shipping_fee     | string    | null: false |
| ship_from_address| string    | null: false |
| shipping_days    | string    | null: false |
| price            | integer   | null: false |
| user_id          | reference | null: false, foreign_key: true |


## purchase_record テーブル

| Column        | Type       | Options      |
| ------        | ---------- | ------------ |
| purchase_name | string     | null: false  |
| purchase_date | datetime   | null: false  |
| item_id       | references | null: false, foreign_key: true |



## shipping_address テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| post_code          | integer    | null: false  |
| prefectures        | string     | null: false  |
| city               | string     | null: false  |
| street_address     | string     | null: false  |
| building_name      | string     |              |
| phone_number       | string     | null: false  |
| purchase_record_id | references | null: false, foreign_key: true |


