class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def charge
  	logger.info(params)
  end

  def show  
    @payment = Payment.find_by_token params[:token]

    #TEMP
    @amount = 123
    @curr = 'EUR'

  end

  def store_token
    @payment = Payment.find_by_token params[:token]
    
  end

end
