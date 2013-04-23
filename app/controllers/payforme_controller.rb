class PayformeController < ApplicationController
  respond_to :json

  def authorize
    e = params['email']
    o = params['orderId']
    p = params['projectKey']
    client_id = Settings.sphere.client_id
    client_secret = Settings.sphere.client_secret
    respond_to do |format|
      format.json { render :json => 'OK' }
    end
  end
end
