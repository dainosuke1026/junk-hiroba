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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |

### Association

- has_many :post_users
- has_many :posts, through: post_users
- has_many :messages
- has_many :favorites

## posts テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |

### Association

- has_many :post_users
- has_many :users, through: post_users
- has_many :messages
- has_many :favorites
- has_many :post_tags
- has_many :tags, throuth: post_tags

## post_users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## messages テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |
| content         | content    |                                |

### Association

- belongs_to :post
- belongs_to :user

## tags テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| tag_name | string |             |

### Association

- has_many :post_tags
- has_many :posts, throuth: post_tags

## post_tags テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tag             | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag

## favorites テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post