# emoshare
### アルバム投稿アプリ

# 概要

### アルバム投稿をメインとしたSNS

撮った写真をアルバムとしてその時の思い出全てを共有できるSNS
共有されたアルバムにコメントをして思い出を共有

# 目指した課題解決

### TwitterもInstagramも数枚しか写真を投稿できない
### instagramみたいな感じでアルバムを見せたい
既存の有名SNSにはその瞬間の気持ちは共有できても、数枚の写真だけで表さなければならない。その時の思い出全部を共有したいSNSの流行りに敏感な若年層に対して、アルバムごと共有できるようにする

# 洗い出した要件

| 機能             | 概要                                              |
|-----------------|---------------------------------------------------|
| ユーザー管理機能   | サインアップ/ログイン/ログアウト/ユーザー編集ができる     |
| 複数枚画像投稿機能 | 複数枚の写真を投稿でき、アルバムとして表示できる          |
| 投稿詳細表示機能   | 各投稿詳細が詳細ページで閲覧できる                     |
| 投稿編集・削除機能 | 投稿者本人のみ投稿編集・削除ができる                    |
| ユーザー詳細機能   | ユーザー詳細ページで投稿者の情報と今までの投稿を閲覧できる |
| コメント投稿機    | アルバムへのコメント欄からコメントができる               |
| プレビュー機能    | 投稿、編集時に選択した画像がプレビューとして表示させる     |


# 🔨 追加予定機能

- 投稿されたアルバムがいつの投稿かがわかるよう日付設定昨日の追加
- 投稿されているアルバムへ非同期通信でのいいね機能の追加

# DB 設計

## users table

| Column          | Type             | Options              |
|-----------------|------------------|----------------------|
| email           | string           | null: false          |
| password        | string           | null: false          |
| nickname        | string           | null: false          |
| profile         | text             |                      |

### Association

* has_many :albums
* has_many :comments

## albums table

| Column          | Type             | Options              |
|-----------------|------------------|----------------------|
| title           | string           | null: false          |
| caption         | text             | null: false          |
| user            | references       | foreign_key: true    |
| image           |                                         |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column          | Type            | Options               |
|-----------------|-----------------|-----------------------|
| text            | text            | null: false           |
| album           | references      | foreign_key: true     |
| user            | references      | foreign_key: true     |

### Association

- belongs_to :album
- belongs_to :user