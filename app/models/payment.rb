class Payment < ActiveRecord::Base
  attr_accessible :payers_mail, :payers_name, :shop, :shpere_id
end
