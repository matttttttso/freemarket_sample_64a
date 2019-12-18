class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_one :trade_state
end
