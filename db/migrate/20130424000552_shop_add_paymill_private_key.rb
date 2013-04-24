class ShopAddPaymillPrivateKey < ActiveRecord::Migration
  def up
    add_column :shops, :paymill_private_key, :string
  end


  def down
  end
end
