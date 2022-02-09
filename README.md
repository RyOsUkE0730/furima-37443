# テーブル設計

## User テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      | 
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birthday           | data       | null: false                    |

## Association

- has_many : items
- has_many : comments
- has_many : orders


## Item テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category           | text       | null: false                    |
| condition          | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| consignor_area     | string     | null: false                    |
| delivery_time      | string     | null: false                    |
| selling_place      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

## Association

- belongs_to : user
- has_many : comments
- has_one : order


## Comment テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true | 
| item               | references | null: false, foreign_key: true | 

## Association

- belongs_to : user
- belongs_to : item


## Oder テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| user               | references | null: false, foreign_key: true | 
| item               | references | null: false, foreign_key: true | 

## Association

- belongs_to : user
- belongs_to : item
- has_one : Buyer


## Buyer テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| post_code          | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                | 
| telephone_num      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to : user
- belongs_to : oder