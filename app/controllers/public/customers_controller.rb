class Public::CustomersController < ApplicationController
 def show
  # @customer = Customer.new
  # @customer=Customer.find(params[:id])
  @customer = current_customer
 end
 
 def edit
  @customer = current_customer
 end
 
 def update
 end
 
 def unsubscribe
 end
 
 def withdraw
 end
 
# private
#   def customer_params
#     params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:adress,:telephone_number)
#   end
  
end
