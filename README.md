# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

## prototypes テーブル

| Column     | Type       | Options     |
| ------     | ------     | ----------- |
| title      | string     | null: false |
| catch_copy | string     | null: false |
| consept    | string     | null: false |
| user       | referrence | null: false, foreign_key: true |

## comments テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | text       | null: false                    |
| room       | references | null: false, foreign_key: true |
| prototypes | referrence | null: false, foreign_key: true |

