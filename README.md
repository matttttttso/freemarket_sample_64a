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
|tel|string||

### Association
- has_one  :creditcard
- has_one  :address
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

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefectures｜string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building_name|string||

### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
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
- has_many   :images
- has_many   :comments
- has_many   :messages
- has_many   :likes
- has_one    :trade_state

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_name|string|null: false|
|item|references|foreign_key: true|

### Association
- belongs_to :item

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
