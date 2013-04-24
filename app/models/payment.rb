class Payment < ActiveRecord::Base
  attr_accessible :payers_mail, :payers_name, :shop, :sphere_order_id
  belongs_to :shop
  before_create :create_token

  def order
    Order.new(shop, sphere_order_id)
  end

  protected
  def create_token
    self.token = SecureRandom.hex(20)
  end
end
