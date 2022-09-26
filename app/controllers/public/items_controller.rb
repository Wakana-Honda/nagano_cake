class Public::ItemsController < ApplicationController
  def index
   @item = Item.page(params[:page])
   @genres = Genre.all
  end
  
  def show
   @item = Item.find(params[:id])
   @genres = Genre.all
   if customer_signed_in?
   # カートアイテムに送るための記述
     @cart_item=CartItem.new
    else
     redirect_to new_customer_session_path
    end
   # @cart_item.customer_id=current_customer.id
   # ユーザーidの取得
   # @cart_item.save
   # redirect_to cart_items_path
  end
  
  # private

  # def item_params
  #   params.require(:cart_item).permit(:item_id, :amount)
  # end
  
end
