class Public::OrdersController < ApplicationController
  def new
   @customer = current_customer
   @adresses = Adress.all
   @order = Order.new
   @total = 0
  end
  
  def confirm
   # binding.pry
   @order = Order.new(order_params)
   @adress = Adress.find(params[:order][:adress_id])
   @order.postal_code = current_customer.postal_code
   @order.adress = current_customer.adress
   @order.name = current_customer.first_name + current_customer.last_name
  end
  
  def create
   # @customer = current_customer
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
  def order_params
   params.permit(:payment,:postal_code,:adress,:name)
  end
  
end
