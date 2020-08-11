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
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one :addresses

## items テーブル

| Column    | Type   | Options     |
| image     | string | null: false |
| name      | string | null: false |
| text      | text   | null: false |
| category  | string | null: false |
| status    | string | null: false |
| charge    | string | null: false |
| city      | string | null: false |
| day       | string | null: false |
| price     | string | null: false |
| user_id   | string | foreign_key: true |

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column       | Type   | Options     |
| users_id     | string | foreign_key: true |
| items_id     | string | foreign_key: true |

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column       | Type   | Options     |
| name         | string | null: false |
| city         | string | null: false |
| users_id     | string | foreign_key: true |

- belongs_to :user