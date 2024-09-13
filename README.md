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

##users テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| nickname                | string    | null: false  |
| email                   | string    | null: false  |
| password                | string    | null: false  |
| encrypted_password      | string    | null: false  |
| family_name             | string    | null: false  |
| first_name              | string    | null: false  |
| family_name_kana        | string    | null: false  |
| first_name_kana         | string    | null: false  |
| birth_day               | text      | null: false  |



##items テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| image                   | text      | null: false  |
| product_name            | string    | null: false  |
| description             | string    | null: false  |
| category                | string    | null: false  |
| product_condition       | string    | null: false  |
| shipping_cost           | string    | null: false  |
| shipping_area           | string    | null: false  |
| shipping_time           | string    | null: false  |
| price                   | string    | null: false  |
| user_id                 | string    | null: false, foreign_key: true |


##shipping_address テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| post_cord               | string    | null: false  |
| prefecture              | string    | null: false  |
| city                    | string    | null: false  |
| address                 | string    | null: false  |
| phone_number            | string    | null: false  |
| user_id                 | string    | null: false, foreign_key: true |


##cards テーブル

| Column                  |  Type     |  Options     |
| ------------------------| --------- | ------------ |
| card-id                 | string    | null: false  |
| user_id                 | string    | null: false  |
