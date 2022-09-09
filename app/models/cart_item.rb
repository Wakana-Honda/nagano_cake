class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  def sum_of_price
    product.price * quantity
  end

# https://zenn.dev/akhmgc/articles/2d060378c4260e

end
