require 'spec_helper'
require 'sphere'
require 'json'

describe Sphere do

  before do
    @id = 'fJVOsIBb4cQ8ShBJbjIFghUR'
    @secret = 'A5QTCj1OnhTK6jNAjH1KAsaJp3J9t3Zl'
    @proj = 'payforme'
  end

  it '#login' do
    t = Sphere.login(@id, @secret, @proj)
    t.should_not eq ''
  end

  it '#get_order' do
    t = Sphere.login(@id, @secret, @proj)
    o_id = 'c8f2424b-3731-4005-b1bc-a12bddf6a0f9'
    o = Sphere.get_order(t, @proj, o_id)
    o['id'].should eq o_id
  end

  describe 'update order' do
    Excon.stub(
      { :method => :post, :path => '/my-proj/orders/myOrder' },
      { :status => 200, :body => '{}' })
    Sphere.update_payment_state '123', 'my-proj', 'myOrder', 'Paid'
  end
end
