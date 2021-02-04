# ジャンク広場

## アプリケーション概要

自作PCの紹介や、分解作業、部品などの情報を共有できるサービス。

## URL

未完

## テスト用アカウント

* メールアドレス: abc@abc

* パスワード: abc123

## 利用方法

* 新規投稿ページでアカウントを作成してログインする。

* ログインした状態で記事を投稿したり、チャットルームを作成する。

* ログインした状態で記事に対してコメントしたり、チャットルームにメッセージ投稿する。

## 目指した課題解決

* パソコンの分解や組み立て作業をしていて、方法や部品についてわからない部分があるので質問したい。

* 自作PCや作業工程など、趣味を共有したい。

## 洗い出した要件

### ユーザー新規登録機能

## テーブル設計

### users テーブル

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

### posts テーブル

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

### post_users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

### messages テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |
| content         | content    |                                |

### Association

- belongs_to :post
- belongs_to :user

### tags テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| tag_name | string |             |

### Association

- has_many :post_tags
- has_many :posts, throuth: post_tags

### post_tags テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| tag             | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag

### favorites テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
