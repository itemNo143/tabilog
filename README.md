# TabiLog

## App URL

https://heroku-deploy-tabilog.herokuapp.com

## ● 概要

TabiLogは旅の思い出を記録するためのアプリです。

<br>

## ● 機能一覧

- 写真をファイルごとに保存できます。
- 地図上に保存した写真の撮影した場所を表示できます。マーカーをクリックすればその写真が表示されます。
- 写真をドラッグ＆ドロップすればAjax通信で投稿できます。

<br>

## ● 技術一覧

- Heroku
- Docker
- Travis CI
- MySQL
- Google Maps API
- 開発環境
  - 言語
    - Ruby
      - Ruby on Rails
    - JavaScript
      - jQuery
  - macOS
  - RubyMine, VScode（テキストエディター）
- 主な使用ライブラリ
  - device（認証機能）
  - carrierwave（画像アップロード）
  - mini_magick（画像リサイズ）
  - font-awesome-sass（使用アイコン）
  - exifr（写真からexif情報を取得）

<br>

## ● DB設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
<br>

### Association

- has_many :travel_users
- has_many :travels, through: :travel_users
- has_many :scraps

---

## travelsテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| start_date | string | null: false |
| end_date   | string | null: false |
| image      | string |             |
| memo       | text   |             |
<br>

### Association

- has_many :scrap_folders
- has_many :travel_users
- has_many :users, through: :travel_users

---

## travels_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| travel | references | null: false, foreign_key: true |
<br>

### Association

- belongs_to :travel
- belongs_to :user

---

## scrap_foldersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| travel | references | null: false, foreign_key: true |
<br>

### Association

- has_many :scraps
- belongs_to :travel

---

## scrapsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| latitude     | float      |                                |
| longitude    | float      |                                |
| scrap_folder | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
<br>

### Association

- belongs_to :scrap_folder
- belongs_to :user

---
