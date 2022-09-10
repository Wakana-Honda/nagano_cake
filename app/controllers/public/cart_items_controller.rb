class Public::CartItemsController < ApplicationController
  
 def index
 @cart_items = CartItem.all
 @cart_items = current_customer.cart_items
 @total = 0
 end
 
 def create
  # binding.pry
  @cart_item = CartItem.new(cart_item_params)
  @item = Item.find(cart_item_params[:item_id])
  # if CartItem.find_by(item_id:item_id)
  #  puts "a"
  #  else
  #  puts "b"
  # end
  @cart_item.customer_id = current_customer.id
  @cart_item.save
  redirect_to cart_items_path
 end
 
 def destroy_all
   @cart_items = CartItem.all
   @cart_items = current_customer.cart_items
   current_customer.cart_items.destroy_all
   redirect_to '/cart_items'

 end
 
 private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount)
  end
 
end