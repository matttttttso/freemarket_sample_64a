# データベース設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|profile|text||
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|realname|string|null: false|
|realname_rub|string|null: false|
|birthday|string|null: false|
|zip_code|string|null: false|
|address|string|null: false|
|tel|string||

### Association
- has_one  :creditcard
- has_many :items
- has_many :comments
- has_many :messages
- has_many :trade_status
- has_many :likes

## CreditCardテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|validity|string|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|images|string|null: false|
|explain|text|null: false|
|category|string|null: false|
|brand|string|null: false|
|size|string|null: false|
|condition|string|null: false|
|postage|string|null: false|
|region|string|null: false|
|shopping_date|string|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_many   :comments
- has_many   :messages
- has_many   :likes
- has_one    :trade_state

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Trade_statusテーブル
|Column|Type|Options|
|------|----|-------|
|trade_state|string|null: false|
|item|references|foreign_key: true|
|buyer_id|integer||

### Association
- belongs_to :item
- belongs_to :user

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
