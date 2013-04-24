require 'sphere'

class PayformeController < ApplicationController
  respond_to :json

  def authorize

    o_id = params['orderId']
    p = params['projectKey']

    shop = Shop.find_by_project_key(params['projectKey'])
    payment = Payment.new(
      :payers_name => params['name'],
      :payers_mail => params['email'],
      :sphere_order_id => params[:orderId],
      :shop => shop)
    if payment.save
      m = UserMailer.email_to_mom(params['email'], payment)
      m.deliver

      respond_to do |format|
        format.json { render :json => 'OK' }
      end
    end
  end
end
