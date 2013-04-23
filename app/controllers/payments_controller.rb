class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def charge
  	logger.info(params)
  end

end
