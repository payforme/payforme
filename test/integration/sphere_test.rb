require 'test_helper'
require 'sphere'
require 'json'

class SphereTest < Test::Unit::TestCase

  def setup
    @id = 'fJVOsIBb4cQ8ShBJbjIFghUR'
    @secret = 'A5QTCj1OnhTK6jNAjH1KAsaJp3J9t3Zl'
    @proj = 'payforme'
  end

  def test_login
    t = Sphere.login(@id, @secret, @proj)
    assert t != ''
  end

  def test_get_order
    t = Sphere.login(@id, @secret, @proj)
    o_id = 'c8f2424b-3731-4005-b1bc-a12bddf6a0f9'
    o = Sphere.get_order(t, @proj, o_id)
    assert t != ''
    assert o['id'] == o_id
  end
end
