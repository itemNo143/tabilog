# TabiLog DB 設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :scrap
- has_many :travels_users
- has_many :travels, through: :travels_users

---

## travels テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| start_date | string | null: false |
| end_date   | string | null: false |
| image      | text   |             |

### Association

- has_many :folder
- has_many :travels_users
- has_many :users, through: :travels_users

---

## travels_users テーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| user_id   | integer | null: false, foreign_key: true |
| travel_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :travel
- belongs_to :user

---

## folders テーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| name      | string  | null: false                    |
| travel_id | integer | null: false, foreign_key: true |

### Association

- has_many :scraps
- belong_to :travel

---

## scraps テーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| image     | text    | null: false                    |
| text      | text    |                                |
| user_id   | integer | null: false, foreign_key: true |
| folder_id | integer | null: false, foreign_key: true |


### Association

- belong_to :folder
- belong_to :user

---
