# テーブル設計

## usersテーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------ ----------- |
| name             | string | null: false              |
| email            | string | null: false              |
| password         | string | null:false, unique: true |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| kana_family_name | string | null: false              |
| kana_first_name  | string | null: false              |
| created_at       | date   | null: false              |


### Association
- has_many :items, through: order
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false,                   |
| postage          | references | null: false                    |
| text             | text       | null: false                    |
| exhibitor        | references | null: false, foreign_key: true |
| category         | integer    | null: false, foreign_key: true |
| status           | integer    | null: false, foreign_key: true |
| shipping_origin  | integer    | null: false, foreign_key: true |
| shipping_date    | integer    | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to user

### Association
- has_many :users, through: orders
- has_many :orders

| Column            | Type        | Options                        |
| ------- | ------- | ----------- | ------------------------------ |
| user_id | string  | null: false | null: false, foreign_key: true |
| item_id | integer | null: false | null: false, foreign_key: true |

## ordersテーブル

- belongs_to :user
- belongs_to :item

## buyersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal      | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | stringer   | null: false                    |
| user_id     | references | null: false, foreign_key: true |