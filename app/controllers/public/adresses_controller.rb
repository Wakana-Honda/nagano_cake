class Public::AdressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = current_customer.adresses
  end
  
  def create
    @adress = Adress.new(adress_params)
    @adress.customer_id = current_customer.id
    @adress.save
     redirect_to adresses_path
  end
  
  def edit
   @adress=Adress.find(params[:id])
  end
  
  def update
   @adress=Adress.find(params[:id])
   @adress.update(adress_params)
    redirect_to adresses_path(@adress.id)
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
