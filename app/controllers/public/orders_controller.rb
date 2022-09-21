class Public::OrdersController < ApplicationController
  def new
   @adresses = Adress.all
   @order = Order.new
   @customer = current_customer
  end
  
  def confirm
   @order = Order.new(order_params)
   # @order.payment_method = params[:payment_method]
   @cart_items = current_customer.cart_items
   # @order.shopping_cost = 800
   @total = 0
   # @order.total_payment = @order.shopping_cost + @total
     # binding.pry
   if params[:order][:select_adress] == '0'
     @order = Order.new(order_params)
     @order.postal_code = current_customer.postal_code
     @order.adress = current_customer.adress
     @order.name = current_customer.first_name + current_customer.last_name
   
   elsif params[:order][:select_adress] == '1'
     @adress=Adress.find(params[:order][:adress_id])
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
   # @order = Order.new(order_params)
   @cart_items = current_customer.cart_items
   @order = current_customer.orders.new(order_params)
   if @order.save
   # current_customer.cart_items.each do |cart_item|
   #  order_item = OrderDetail.new
   #  order_item.item_id = cart_item.item_id
   #  order_item.order_id = @order.id
   #  order_item.amount = cart_item.amount
   #  order_item.price = @order.total_payment
   #  order_item.save
   # end
     redirect_to complete_orders_path
     @cart_items.destroy_all
    else
     @order = Order.new(order_params)
     render :new
    end
         
  end
  
  def complete
  end
  
  def index 
   @orders = Order.all
   cart_items = CartItem.all
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
