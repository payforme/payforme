class Shop < ActiveRecord::Base
  attr_accessible :name, :project_key, :sphere_token, :paymill_public_key, :paymill_private_key, :sphere_client_id, :sphere_client_secret
  has_many :payments, :inverse_of => :shop
end
