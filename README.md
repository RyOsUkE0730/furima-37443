# テーブル設計

## Users テーブル

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


## Items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| selling_price      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

## Association

- belongs_to : user
- has_many : comments
- has_one : order


## Comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true | 
| item               | references | null: false, foreign_key: true | 

## Association

- belongs_to : user
- belongs_to : item


## Orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| user               | references | null: false, foreign_key: true | 
| item               | references | null: false, foreign_key: true | 

## Association

- belongs_to : user
- belongs_to : item
- has_one : buyer


## Buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------      |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                | 
| telephone_num      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to : order