require 'sphere'

class PayformeController < ApplicationController
  respond_to :json

  def authorize
    n = params['name']
    e = params['email']
    o_id = params['orderId']
    p = params['projectKey']

    client_id = Settings.sphere.client_id
    client_secret = Settings.sphere.client_secret
    t = Sphere.login client_id, client_secret, p

    order = Sphere.get_order t, p, o_id

    m = UserMailer.email_to_mom e, order
    m.deliver

    respond_to do |format|
      format.json { render :json => 'OK' }
    end
  end
end
