class Public::OrdersController < ApplicationController
def new
   @customer = current_customer
   @adresses = Adress.all
   @order = Order.new
   @total = 0
  end
  
  def confirm
   # binding.pry
   @cart_items = CartItem.all
   @orders = Order.all
   @total = 0
  end
  
  def create
   @customer = current_customer
   @order = Order.new
   @order.save
   redirect_to orders_confirm_path
   
  end
  
  def complete
  end
  
  def index 
  end
  
  def show
  end
  
  private
  def cart_item_params
   params.require(:cart_item).permit(:postal_code, :adress,:name)
  end
  
end
