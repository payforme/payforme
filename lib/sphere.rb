require 'excon'
require 'json'

module Sphere

  def self.login(client_id, client_secret, project_key)
    encoded = Base64.urlsafe_encode64 "#{client_id}:#{client_secret}"
    headers = { 'Authorization' => "Basic #{encoded}", 'Content-Type' => 'application/x-www-form-urlencoded' }
    body = "grant_type=client_credentials&scope=manage_project:#{project_key}"
    res = Excon.post 'https://auth.sphere.io/oauth/token', :headers => headers, :body => body
    raise "Problems on getting access token from auth.sphere.io: #{res.body}" unless res.status == 200
    JSON.parse(res.body)['access_token']
  end

  def self.get_order(access_token, project_key, order_id)
    res = Excon.get "https://api.sphere.io/#{project_key}/orders/#{order_id}", :headers => head(access_token)
    JSON.parse res.body
  end

  def self.update_payment_state(access_token, project_key, order_id, payment_state)
    res = Excon.post "https://api.sphere.io/#{project_key}/orders/#{order_id}", :headers => head(access_token),
      :body => '{"action":"changePaymentState","paymentState":"payment_state"}'
  end

  private

  def self.head(t)
    { 'Authorization' => "Bearer #{t}" }
  end

end
