require 'test_helper'

class RenderTest < Test::Unit::TestCase
  def test_render
    order = '{"type":"Order","id":"c8f2424b-3731-4005-b1bc-a12bddf6a0f9","version":6,"createdAt":"2013-04-23T14:30:12.059Z","lastModifiedAt":"2013-04-23T14:30:12.059Z","orderState":"Open","paymentState":"BalanceDue","lineItems":[{"id":"c3961e13-e445-41ec-9d22-a9efff03664e","productId":"190eaef0-6a91-4168-8989-35e95b4a09b9","name":"MB SOFTSHELL LINER","variant":{"id":1,"sku":"sku_MB_SOFTSHELL_LINER_variant1_1366719803478","prices":[{"value":{"currencyCode":"EUR","centAmount":10000}}],"images":[{"url":"https://sphere.io/cli/data/254391631_1.jpg","dimensions":{"w":1400,"h":1400}}],"attributes":[]},"price":{"value":{"currencyCode":"EUR","centAmount":10000}},"quantity":2,"taxRate":{"name":"19% MwSt","amount":0.19,"includedInPrice":true,"country":"DE","id":"aqUXSUpF"}}],"shippingAddress":{"id":"","title":"","salutation":"","firstName":"M","lastName":"K","streetName":"kkh","streetNumber":"khkh","additionalStreetInfo":"","postalCode":"123","city":"berlin","region":"","state":"","country":"DE","company":"ct","department":"","building":"","apartment":"","phone":"99","mobile":"","email":""},"totalPrice":{"currencyCode":"EUR","centAmount":20000},"taxedPrice":{"totalNet":{"currencyCode":"EUR","centAmount":16200},"totalGross":{"currencyCode":"EUR","centAmount":20000},"taxPortions":[{"rate":0.19,"amount":{"currencyCode":"EUR","centAmount":3800}}]},"country":"DE"}'
    t = ERB.new File.new("app/views/user_mailer/email_to_mom.html.erb").read
    e = t.result(binding)
    assert e.idnclude? 'kid'
  end
end
