class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  validates :item_name,        presence: true, length: { maximum: 40 }
  validates :explain,          presence: true
  validates :category,         presence: true
  validates :size,             presence: true
  validates :condition,        presence: true
  validates :postage,          presence: true
  validates :shipping_method,  presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_days,    presence: true
  validates :price,            numericality: {greater_than_or_equal_to: 300}
  validates :price,            numericality: {less_than_or_equal_to: 9999999}

  validate :images_presence

  def images_presence
    if images.attached?
      if !images.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:images, '画像がありません')
    end
  end
end
