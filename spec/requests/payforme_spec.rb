require "spec_helper"

describe 'Payforme API' do
  it "get's the order from sphere" do
    post '/payforme.json', :email => 'hajo@commercetools.de', :orderId => "c8f2424b-3731-4005-b1bc-a12bddf6a0f9", :projectKey => 'payforme'
    expect(response.status).to eq(200)
  end
end
