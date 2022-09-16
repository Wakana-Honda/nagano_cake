class Public::OrdersController < ApplicationController
  def new
   @adresses = Adress.all
   @order = Order.new
   # @total = 0
   @customer = current_customer
  end
  
  def confirm
  # binding.pry
   #@order = Order.new(order_params)
   # # @adress = Adress.find(params[:order][:adress_id])
   #@order.postal_code = current_customer.postal_code
   #@order.adress = current_customer.adress
   #@order.name = current_customer.first_name + current_customer.last_name
   @cart_items = current_customer.cart_items
   @total = 0
  end
  
  def create
   # @customer = current_customer
    @order = Order.new(order_params)
    @order.save
    redirect_to confirm_orders_path
   
  end
  
  def complete
  end
  
  def index 
  end
  
  def show
  end
  
  private
  def order_params
   params.require(:order).permit(:payment_method,:postal_code,:adress,:name,:shopping_cost,:total_payment,:status,:customer_id)
  end
  
end
