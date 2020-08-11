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
- has_one :purchase

## purchases テーブル

| Column       | Type   | Options     |
| user_id     | string | foreign_key: true |
| item_id     | string | foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type   | Options     |
| zip-code        | integer | null: false |
| state           | string | null: false |
| city            | string | null: false |
| house_number    | string | null: false |
| building        | string | null: false |
| phone-number    | string | null: false |
| purchase_id     | integer | foreign_key: true |

- belongs_to :purchase