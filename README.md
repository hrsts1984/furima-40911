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

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| nickname                | string    | null: false  |
| email                   | string    | null: false,unique:true |
| encrypted_password      | string    | null: false  |
| family_name             | string    | null: false  |
| first_name              | string    | null: false  |
| family_name_kana        | string    | null: false  |
| first_name_kana         | string    | null: false  |
| birth_day               | date      | null: false  |


##  Association
has_many :items
has_many :orders


## items テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| product_name            | string    | null: false  |
| description             | text      | null: false  |
| category_id             | integer   | null: false  |
| product_condition_id    | integer   | null: false  |
| shipping_cost_id        | integer   | null: false  |
| shipping_area_id        | integer   | null: false  |
| shipping_time_id        | integer   | null: false  |
| price                   | integer   | null: false  |
| user                    | references| null: false, foreign_key: true |

##  Association
belongs_to :user
has_one :order


##shipping_address テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| post_cord               | string    | null: false  |
| prefecture              | integer   | null: false  |
| city                    | string    | null: false  |
| address                 | string    | null: false  |
| building_number         | string    |
| phone_number            | string    | null: false  |
| order                   | references| null: false, foreign_key: true |


##  Association
belongs_to :order


## orders　テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| item                    | references| null: false, foreign_key: true |
| user                    | references| null: false, foreign_key: true |

## Association
belongs_to :user
belongs_to :item
has_one :address
