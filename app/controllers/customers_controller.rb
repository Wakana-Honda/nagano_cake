class CustomersController < ApplicationController
  def show
  end
  
  private

  def set_user
    @customer = Customer.find([:id])
  end
  
end
