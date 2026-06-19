class CustomersController < ApplicationController
    def index
    @customers = Customer.all
  end
 def alphabetized
    @customers = Customer.order(:fullname)
  end
  def show
    @customer = Customer.find(params[:id])
  end

  def missing_email
    @customers=Customer.where(emailaddress: [nil, ""])
  end


end
