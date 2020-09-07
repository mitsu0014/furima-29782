# テーブル設計

## usersテーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| name             | string | null: false              |
| email            | string | null: false              |
| password         | string | null:false, unique: true |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| kana_family_name | string | null: false              |
| kana_first_name  | string | null: false              |
| birth_day_at     | date   | null: false              |


### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | integer    | null: false                    |
| price            | integer    | null: false                    |
| postage          | integer    | null: false                    |
| text             | text       | null: false                    |
| category         | integer    | null: false                    |
| status           | integer    | null: false                    |
| shipping_origin  | integer    | null: false                    |
| shipping_date    | integer    | null: false                    |
| user_id          | integer    | null: false, foreign_key: true |


### Association

- has_one :order

## ordersテーブル

| Column  | Type    | Options                         |
| ------- | ------- | ------------------------------- |
| user_id | integer |  null: false, foreign_key: true |
| item_id | integer |  null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer

## buyersテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| postal      | string  | null: false                    |
| prefectures | string  | null: false                    |
| city        | string  | null: false                    |
| address     | string  | null: false                    |
| building    | string  |                                |
| phone       | string  | null: false                    |
| order_id    | integer | null: false, foreign_key: true |

### Association
has_one :order