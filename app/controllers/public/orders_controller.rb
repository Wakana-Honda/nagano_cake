class Public::OrdersController < ApplicationController
  def new
   @adresses = Adress.all
   @order = Order.new
   # @total = 0
   @customer = current_customer
  end
  
  def confirm
   @order = Order.new(order_params)
   # @order.payment_method = params[:payment_method]
   @cart_items = current_customer.cart_items
   @total = 0
   # select_adress = params[:order][:select_adress]
    # binding.pry
   if params[:order][:select_adress] == '0'
     @order = Order.new(order_params)
     @order.postal_code = current_customer.postal_code
     @order.adress = current_customer.adress
     @order.name = current_customer.first_name + current_customer.last_name
   
   elsif params[:order][:select_adress] == '1'
     @adress = Adress.find(params[:order][:select_adress])
     @order.postal_code = @adress.postal_code
     @order.adress = @adress.adress
     @order.name = @adress.name
   
   elsif params[:order][:select_adress] == '2'
    # binding.pry
     @adress = current_customer.adresses.new(adress_params)
     @order.postal_code = @adress.postal_code
     @order.adress = @adress.adress
     @order.name = @adress.name
    
   else
       render 'new'
   end
   
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
  
  def adress_params
   params.require(:order).permit(:postal_code,:adress,:name)
  end
  
  def order_params
   params.require(:order).permit(:payment_method,:postal_code,:adress,:name,:customer_id)
  end
  
end
