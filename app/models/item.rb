class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one_attached :image
  belongs_to :genre
  
  def get_item_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
  
 def with_tax_price
   (price * 1.1).floor
 end
# enum is_active: { credit_card: 0, transfer: 1 }


end

