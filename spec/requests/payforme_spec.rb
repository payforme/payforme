require "spec_helper"

describe 'Payforme API' do
  it "get's the order from sphere" do
    post '/payforme.json', :email => 'foo@example.com', :orderId => "123", :projectKey => 'p'
    expect(response.status).to eq(200)
  end
end
