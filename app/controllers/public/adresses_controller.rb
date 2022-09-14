class Public::AdressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = Adress.all
  end
  
  def create
    @adress = Adress.new(adress_params)
    @adress.customer_id = current_customer.id
    @adresses = Adress.all
    @adress.save
     redirect_to adresses_path
  end
  
  def edit
   @adress=Adress.find(params[:id])
  end
  
  def update
  end
  
  def destroy
   @adress=Adress.find(params[:id])
   @adress.destroy
    redirect_to adresses_path
   
  end
  
  private
  def adress_params
   params.require(:adress).permit(:name, :postal_code,:adress)
 end
 
end
