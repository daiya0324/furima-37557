# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |
### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category            | text       | null: false                    |
| status              | string     | null: false                    |
| shipping_fee_burden | string     | null: false                    |
| ship_from           | string     | null: false                    |
| shipping_date       | date       | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :purchase_record

## purchases テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| postal_code    | string | null: false |
| prefecture     | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building       | string |             |
| phone_number   | string | null: false |
### Association

- has_many :purchase_record

## purchase_record テーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |
| purchases | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- belongs_to :purchase