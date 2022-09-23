class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one_attached :image_id
  belongs_to :genre
  
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
 def with_tax_price
   (price * 1.1).floor
 end
# enum is_active: { credit_card: 0, transfer: 1 }


end

