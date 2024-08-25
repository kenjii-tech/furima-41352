# テーブル設計

## users テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| nickname           | string    | null: false |
| email              | string    | null: false, unique: true |
| password           | string,int| null: false | // 
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_name_kana     | string    | null: false |
| first_name_kana    | string    | null: false |
| birthday           | int       | null: false |


## items テーブル

| Column      | Type      | Options     |
| ------      | ------    | ----------- |
| item_image  | string    | null: false |
| item_name   | string    | null: false |
| description | text      | null: false | 
| price       | int       | null: false |
| user        | reference | null: false, foreign_key: true |


## purchase_record テーブル

| Column        | Type       | Options      |
| ------        | ---------- | ------------ |
| purchase_name | string     | null: false  |
| purchase_date | datetime   | null: false                    |
| item          | references | null: false, foreign_key: true |



## shipping_address テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| post_code          | int        | null: false, |
| city               | string     | null: false, |
| street_address     | string     | null: false, |
| building_name      | string     | null: true,  |
| phone_number       | int        | null: false, |
| credit_card_number | int        | null: false, |
| expire_date        | int        | null: false, |
| security_code      | int        | null: false, |
| user               | references | null: false  foreign_key: true |
| item               | references | null: false, foreign_key: true |


