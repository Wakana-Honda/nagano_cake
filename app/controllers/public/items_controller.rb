class Public::ItemsController < ApplicationController
  def index
   @item = Item.all
   @items = Item.page(params[:page]).per(2)
   @genres = Genre.all
  end
  
  def show
   @item = Item.find(params[:id])
   @genres = Genre.all
  end
end
