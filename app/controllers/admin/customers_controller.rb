class Admin::CustomersController < ApplicationController

def index
# binding.pry
 @customers = Customer.page(params[:page])
# @customers = Customer.page(params[:page]).per(2)
end

def show
 @customer =Customer.find(params[:id])
end

def edit
  @customer =Customer.find(params[:id])
end

def update
@customer = Customer.find(params[:id])
@customer.update(customer_params)
redirect_to admin_customer_path(@customer.id)
end

private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana, :email,:postal_code,:adress,:telephone_number, :is_deleted)
  end
  
  
end
