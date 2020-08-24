# TabiLog DB 設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
<br>

### Association

- has_many :travels_users
- has_many :travels, through: :travels_users

---

## travels テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| start_date | string | null: false |
| end_date   | string | null: false |
| image      | string |             |
<br>

### Association

- has_many :scrap_folders
- has_many :travels_users
- has_many :users, through: :travels_users

---

## travels_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| travel | references | null: false, foreign_key: true |
<br>

### Association

- belongs_to :travel
- belongs_to :user

---

## scrap_folders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| travel | references | null: false, foreign_key: true |
<br>

### Association

- has_many :scraps
- belong_to :travel

---

## scraps テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| memo         | text       |                                |
| scrap_folder | references | null: false, foreign_key: true |
<br>

### Association

- belong_to :folder
- belong_to :user

---
