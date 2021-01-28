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