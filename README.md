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

- has_many :posts
- has_many :comments
- has_many :questions
- has_many :answers
- has_many :favorites

## posts テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| title           | string     | null: false                    |
| text            | text       | null: false                    |

### Association

- belongs_to :user
- has_many :commnets
- has_many :favorites
- has_many :post_tags
- has_many :tags, throuth: post_tags

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |
| text            | text       | null: false                    |

### Association

- belongs_to :post

## questions テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| title           | string     | null: false                    |
| text            | text       | null: false                    |

### Association

- belongs_to :user
- has_many :answers
- has_many :favorites
- has_many :question_tags
- has_many :tags, throuth: question_tags

## answers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| question        | references | null: false, foreign_key: true |
| text            | text       | null: false                    |

### Association

- belongs_to :question

## favorites テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |
| question        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
- belongs_to :question

## post_tags テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tag             | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag

## question_tags テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tag             | references | null: false, foreign_key: true |
| question        | references | null: false, foreign_key: true |

### Association

- belongs_to :question
- belongs_to :tag

## tags テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| tag_name | string |             |

### Association

- has_many :post_tags
- has_many :posts, throuth: post_tags
- has_many :question_tags
- has_many :questions, throuth: question_tags