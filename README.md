## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :products

## products テーブル

| Column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product_name    | string     | null: false                    |
| product_details | text       | null: false                    |
| category        | string     | null: false                    |
| product_state   | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| delivery_source | string     | null: false                    |
| delivery_days   | date       | null: false                    |
| product_price   | string     | null: false                    |

### Association

- belongs_to :user