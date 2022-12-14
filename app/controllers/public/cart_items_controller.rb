class Public::CartItemsController < ApplicationController
 
 before_action :check_customer 
  
 def index
 @cart_items = CartItem.all
 @cart_items = current_customer.cart_items
 @total = 0
 end
 
 def create
  # binding.pry
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  @item = Item.find(cart_item_params[:item_id])
  
  if CartItem.find_by(item_id:params[:cart_item][:item_id]).present?
   cart_item = CartItem.find_by(item_id:params[:cart_item][:item_id])
   cart_item.amount += params[:cart_item][:amount].to_i
   cart_item.save
   redirect_to cart_items_path
  else @cart_item.save
   @cart_items = CartItem.all
   @cart_items = current_customer.cart_items
   redirect_to cart_items_path
  end
 end
 
 def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(cart_item_params)
  redirect_to cart_items_path
 end
 
 def destroy
  cart_item = CartItem.find(params[:id])
  cart_item.destroy
  @cart_items = CartItem.all
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
 
 def check_customer
  unless customer_signed_in?
   flash[:alert]= "ログインしてください。"
   redirect_to new_customer_session_path
  end
 end
 
end