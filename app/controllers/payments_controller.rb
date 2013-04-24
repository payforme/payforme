require 'sphere'

class PaymentsController < ApplicationController

  def show
    @payment = Payment.find_by_token params[:token]

    #TEMP
    @order_struct = @payment.order.to_struct
  end

  # mom doesn't want to pay
  def reject
    payment = Payment.find_by_token params[:token]
    payment.rejected_at = Time.now

    buyer_mail = 'mathias@musterdenker.de' #TODO get mail from order object
    mail = UserMailer.not_paid(buyer_mail, @payment)
    mail.deliver

    payment.save
  end

  def handle
    @payment = Payment.find_by_token params[:token]
    @payment.paymill_token = params[:paymill_token]
    @payment.save

    #now process payment
    private_key = @payment.shop.paymill_private_key
    amount = 123
    order_ref = "Bestellbezeichung"
    currency = 'EUR'
    endpoint = 'https://api.paymill.com/v2/transactions'

    client = HTTPClient.new
    client.set_auth(endpoint, private_key, '')
    query = {
        :amount => amount,
        :currency => currency,
        :token => @payment.paymill_token,
        :description => order_ref
        }
    answer = JSON.parse(client.post(endpoint, query).body)

    if answer['data'] && answer['data']['status'] == 'closed'
      @payment.paid_at = Time.now
      @payment.paymill_transaction_id = answer['data']['id']
      @payment.save

      buyer_mail = 'mathias@musterdenker.de' #TODO get mail from order object
      mail = UserMailer.paid(buyer_mail, @payment)
      mail.deliver

      client_id = @payment.shop.sphere_client_id
      client_secret = @payment.shop.sphere_client_secret
      sphere_login_token = Sphere.login(client_id, client_secret, @payment.shop.project_key)
      @order_data_hash = Sphere.update_payment_state(sphere_login_token, @payment.shop.project_key, @payment.sphere_order_id, 'Paid')

      redirect_to :action => 'thankyou'
    else
      redirect_to :action => 'show', :controller => 'payments', :token => @payment.token, :error => 'ERROR'
    end
  end

  def thankyou

  end

end
