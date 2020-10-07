# テーブル設計

## usersテーブル

| Column          | Type   | Options    |
| nickname        | string | null false |
| email           | string | null false |
| password        | string | null false |
| first_name      | string | null false |
| last_name       | string | null false |
| first_name_kana | string | null false |
| last_name_kana  | string | null false |
| birthday        | date   | null false |

### Association

has_many :items
has_many :orders

## itemsテーブル

| Column            | Type       | Options                       |
| item_title        | string     | null false                    |
| item_description  | text       | null false                    |
| category_id       | integer    | null false                    |
| item_status_id    | integer    | null false                    |
| shipping_cost_id  | integer    | null false                    |
| shipment_score_id | integer    | null false                    |
| shipping_days_id  | integer    | null false                    |
| price             | integer    | null false                    |
| user              | references | null false, foreign_key: true |

### Association

belongs_to :user
belongs_to :order

## ordersテーブル

| Column | Type       | Options                     |
| user   | references | null false,foreign_key:true |
| item   | references | null false,foreign_key:true |

### Association

belongs_to :user
has_one :address

## addressテーブル

| Column        | Type    | Options    |
| zip_number    | string  | null false |
| ken_id        | integer | null false |
| city_name     | string  | null false |
| block_name    | string  | null false |
| building_name | string  | null false |
| phone_number  | integer | null false |

### Association

belongs_to :order