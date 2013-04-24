class Payment < ActiveRecord::Base
  attr_accessible :payers_mail, :payers_name, :shop, :sphere_id, :paymill_token
  belongs_to :shop
  before_create :create_token


  protected
  def create_token
    self.token = SecureRandom.hex(20)
  end 
end
