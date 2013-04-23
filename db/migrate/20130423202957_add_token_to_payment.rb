class AddTokenToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :token, :string
  end
end
