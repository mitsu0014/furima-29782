# テーブル設計

## usersテーブル

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| name     | string | null: false              |
| email    | string | null: false              |
| password | string | null:false, unique: true |

### Association
- has_many :items


## profilesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| kana_family_name | string     | null: false                    |
| kana_first_name  | string     | null: false                    |
| birth_year       | date       | null: false                    |
| birth_month      | date       | null: false                    |
| birth_day        | date       | null: false                    |
| user_id          | references | null: false, foreign_key: true |


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| item_image       | references | null: false, foreign_key: true |
| price            | integer    | null: false, foreign_key: true |
| postage          | references | null: false                    |
| text             | text       | null: false                    |
| exhibitor        | references | null: false, foreign_key: true |
| category         | references | null: false, foreign_key: true |
| status           | references | null: false, foreign_key: true |
| shipping_ origin | references | null: false, foreign_key: true |
| date_shipping    | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to user


## buyersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal      | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |


## credit_cardsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_year  | date       | null: false                    |
| expiration_month | date       | null: false                    |
| code             | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |