class Payment < ActiveRecord::Base
  attr_accessible :payers_mail, :payers_name, :shop, :sphere_id
end
