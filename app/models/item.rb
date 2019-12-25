class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
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

  private

  def images_presence
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%('image/jpg image/jpeg image/png'))
          image.purge
          errors.add(:images, 'には画像ファイルを添付してください')
        end
      end
    else
      errors.add(:images, '画像がありません')
    end
  end
  
end
