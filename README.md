## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_ruby    | string | null: false |
| last_name_ruby     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :products
- has_many :items_buy
- belongs_to :address

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| item_details       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_state_id      | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |
| delivery_days      | date       | null: false                    |
| item_price         | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :items_buy

## Items_buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## Address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| address | string     | null: false                    |

- belongs_to :user