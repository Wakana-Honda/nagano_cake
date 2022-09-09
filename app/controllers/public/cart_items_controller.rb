class Public::CartItemsController < ApplicationController
  
 def index
 @cart_item = CartItem.new#(cart_item_params)
 @cart_item.customer_id=current_customer.id
 # @cart_item=CartItem.new
 @cart_items = current_customer.cart_items
 end
 
 def create
  # binding.pry
  @cart_item = CartItem.new(cart_item_params)
  @item = Item.find(cart_item_params[:item_id])
  #@cart_item.customer_id = current_customer.id
 end
 
 private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount)
  end
 
end