class AddBuyersNameToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :buyers_name, :string
  end
end
