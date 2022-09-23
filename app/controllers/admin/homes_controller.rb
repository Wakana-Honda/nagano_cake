class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_items = OrderDetail.all

  end
end
