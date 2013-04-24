class AddPaymillTokenToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :paymill_token, :string
  end
end
