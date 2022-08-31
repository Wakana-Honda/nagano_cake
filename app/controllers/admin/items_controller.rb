class Admin::ItemsController < ApplicationController
 
  def new
    @item=Item.new
  end
 
  def create
    @item=Item.new(item_params)
    # @items=Items.all
    # @item.genre_id = current_genre.id
    @item.save
    redirect_to admin_item_path(@item.id)
  end
  
  def show
   @item = Item.find(params[:id])
   @genre = @item.genre
  end
  
  def index
  @item = Item.all
  @items = Item.page(params[:page]).per(2)
  # @item=Item.new
  # @item = Item.find(params[:id])
  # @user = @book.user
  end
  
  def edit
   @item = Item.find(params[:id])
   @genre = @item.genre
  end
  
  def update
   @item = Item.find(params[:id])
   @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end
  
  private

  def item_params
    params.require(:item).permit(:imege_id,:name,:introduction,:price,:genre_id,:is_active)
    # ひとまずネームだけ他も追加してね
  end
  
end
