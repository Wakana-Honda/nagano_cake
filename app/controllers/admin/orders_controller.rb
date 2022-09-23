class Admin::OrdersController < ApplicationController
  def show
  # binding.pry
   @order = Order.find(params[:id])
    
  # @order_items = @order.order_details
  # @customer = Customer.find(params[:customer][:id])
  end
  
  def update
  end
  
end
