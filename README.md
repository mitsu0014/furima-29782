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
| birth_day        | date   | null: false              |


### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| postage            | integer    | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column  | Type    | Options                         |
| ------- | ------- | ------------------------------- |
| user_id | integer |  null: false, foreign_key: true |
| item_id | integer |  null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyersテーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal         | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| city           | string  | null: false                    |
| address        | string  | null: false                    |
| building       | string  |                                |
| phone          | string  | null: false                    |
| order_id       | integer | null: false, foreign_key: true |

### Association
belongs_to :order
