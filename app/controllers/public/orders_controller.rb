class Public::OrdersController < ApplicationController
def new
   @customer = current_customer
   @order = Order.new
   @total = 0
  end
  
  def comfirm
   @cart_items = CartItem.all
   @orders = Order.all
   @total = 0
  end
  
  def create
  end
  
  def complete
  end
  
  def index 
  end
  
  def show
  
end
