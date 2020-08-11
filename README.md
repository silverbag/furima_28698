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
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column    | Type   | Options     |
| image     | ------ | ----------- |
| text      | string | null: false |
| users_id  | string | null: false |

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column       | Type   | Options     |
| name         | ------ | ----------- |
| city         | string | null: false |
| users_id     | string | null: false |
| items_id  | string | null: false |

- belongs_to :user
- belongs_to :item
