class Shop < ActiveRecord::Base
  attr_accessible :name, :project_key, :sphere_token, :paymill_private_key
end
