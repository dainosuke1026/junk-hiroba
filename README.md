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
#### 目的
* ユーザーがサービス利用のための個人を特定するアカウントを登録するため
#### 詳細
* 新規登録ページでアカウントを登録できる
#### ストーリー(ユースケース)
* ニックネームとメールアドレスとパスワードを入力して、登録するボタンを押すと登録が完了する
* 登録が完了するとトップページに遷移してログイン状態になる。

### ログイン・ログアウト機能
#### 目的
* ユーザーが自分のアカウント情報にアクセス、またはアクセスを解除するため
#### 詳細
* ログインページでログインできる
* ログアウトボタンでログアウトできる
#### ストーリー(ユースケース)
* ログインページでメールアドレスとパスワードを入力してログインできる
* ログインしたらトップページに遷移する
* ログイン状態時、ヘッダーバーにユーザーのニックネームが表示される

### チャットルーム作成機能
#### 目的
* ユーザー同士がチャット形式で雑談できるようにするため
#### 詳細
* チャットルーム作成画面で作成できる
#### ストーリー(ユースケース)
* チャットルーム名とタグ名(任意)を入力して作成するボタンを押すと作成される
* 作成されたらチャットルームに遷移する

### チャットルームメッセージ機能
#### 目的
* チャットルームにメッセージや画像を送れるようにするため
#### 詳細
* 自分の作成したチャットルームや、他ユーザーのチャットルームにメッセージや画像を送信できる
#### ストーリー(ユースケース)
* チャットルームのフォームにメッセージを入力して投稿できる。
* 画像を貼り付けたい場合、画像ボタンを押すとファイルが開き、画像を選択できる。
* 送信ボタンを押すとメッセージと画像が表示される。

### 記事投稿機能
#### 目的
* ユーザーが作品や作業内容を記事にまとめて投稿できるようにするため
#### 詳細
* 記事作成画面で記事を投稿できる
#### ストーリー(ユースケース)
* 記事タイトル名とタグ名(任意)と文章を入力して投稿するボタンを押すと投稿される
* 画像を貼り付けたい場合、画像ボタンを押すとファイルが開き、画像を選択できる。
* 投稿が完了するとトップページに遷移する。

### 記事コメント機能
#### 目的
* 記事に対してコメントができるようにするため
#### 詳細
* 他ユーザーの記事、自分の記事にコメントできる
#### ストーリー(ユースケース)
* 記事詳細ページのフォームに入力して送信ボタン押すとコメントできる
* コメントが送信されると記事詳細画面が表示される

### マイページ機能
#### 目的
* アカウント管理やお気に入り記事の管理などをできるようにするため
#### 詳細
* アカウントのニックネームやメールアドレスやパスワードを変更ができる
* お気に入り記事の管理や自分の投稿した記事一覧などが見れる
#### ストーリー(ユースケース)
* お気に入り記事一覧からお気に入りを外せる
* アカウント編集ページでユーザー名、メールアドレス、パスワードを変更できる。

### SNS認証
#### 目的
* ユーザーアカウント登録方法の選択肢を増やす
#### 詳細
* SNSアカウント（Twitter、Google、Facabook）を利用したログイン方法を選択肢として追加する
#### ストーリー(ユースケース)
* ユーザーアカウントの登録方法を「手打ち入力」「Googleアカウントを利用」「Facabookアカウントを利用」の3つから選べるようにする

### 検索機能
#### 目的
* ユーザーが簡単にデータ検索出来るようにする
#### 詳細
* 複数条件を指定した上で記事やチャットルームの検索を可能にする
#### ストーリー(ユースケース)
* 記事やチャットルームがあることが前提
* キーワードを検索できる検索ボックスを設ける
* 条件に該当する記事やチャットルームを検索結果のページで表示する

## 実装した機能について
### ユーザー新規登録機能
![ユーザー新規登録機能](https://i.gyazo.com/025870ed89c74cf2df5dff624dd35bb4.gif)

### チャットルームメッセージ機
* メッセージ非同期送信(画像非同期送信未完)
![チャットルームメッセージ機能](https://i.gyazo.com/cb622d5b8d2bd8b826d656beda669751.gif)

## 実装予定の機能
* 画像非同期送信
* SNS認証
* 記事投稿機能
* タグ検索機能

## テーブル設計

### ER図
![ER図](https://i.gyazo.com/e4bfb8b31afdd43c99843ab0047d4b37.png)

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

## ローカルでの動作環境
- macOS
- ruby '2.6.5'

- gem 'rails', '~> 6.0.0'
- gem 'devise'
- gem 'mini_magick'
- gem 'image_processing', '~> 1.2'
