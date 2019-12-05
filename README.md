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
- has_many :nice

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
|explain|text|null: false|
|category|references|foreign_key: true|
|brand|references|foreign_key: true|
|size|references|foreign_key: true|
|condition|references|foreign_key: true|
|postage|references|foreign_key: true|
|region|references|foreign_key: true|
|shopping_date|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- belongs_to :condition
- belongs_to :postage
- belongs_to :region
- belongs_to :shoppig_date
- belongs_to :user
- has_many   :images
- has_many   :comments
- has_many   :messages
- has_many   :nice
- has_one    :trade_state

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_name|string|null: false|
|item|references|foreign_key: true|

### Association
- belongs_to :item

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many :items

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association
- has_many :items

## Sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :items

## Conditionテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_many :items

## Regionsテーブル
|Column|Type|Options|
|------|----|-------|
|region|string|null: false|

### Association
- has_many :items

## Shopping_datesテーブル
|Column|Type|Options|
|------|----|-------|
|shopping_date|string|null: false|

### Association
- has_many :items

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

## Niceテーブル
|Column|Type|Options|
|------|----|-------|
|nice|integer||
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
