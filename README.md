# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first-name | string | null: false |
| last-name  | string | null: false |
| f-furigana   | string | null: false |
| l-furigana   | string | null: false |
| birthday   | date | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column    | Type   | Options     |
| image     | string | null: false |
| name      | string | null: false |
| text      | text   | null: false |
| category  | integer | null: false |
| status    | integer | null: false |
| charge    | integer | null: false |
| city      | integer | null: false |
| day       | integer | null: false |
| price     | integer | null: false |
| user_id   | integer | foreign_key: true |

- belongs_to :user
- has_one :order
- has_many :message, through: :item_message
- has_many :item_message

## orders テーブル

| Column       | Type   | Options     |
| user_id     | integer | foreign_key: true |
| item_id     | integer | foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type   | Options     |
| zip-code        | string | null: false |
| state           | string | null: false |
| city            | string | null: false |
| house_number    | string | null: false |
| building        | string |             |
| phone-number    | string | null: false |
| order_id     | integer | foreign_key: true |

- belongs_to :purchase

## messages  テーブル

| Column          | Type   | Options     |
| text            | string | null: false |
| item_id         | references | foreign_key: true |
| user_id         | references | foreign_key: true |

has_many :item_message
has_many :item, through: :item_message

<!-- ## item_message 中間 テーブル

| Column          | Type   | Options     |
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

- belongs_to :item
- belongs_to :message -->