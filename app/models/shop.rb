class Shop < ActiveRecord::Base
  attr_accessible :name, :project_key, :sphere_token, :paymill_private_key, :sphere_client_id, :sphere_client_secret
end
