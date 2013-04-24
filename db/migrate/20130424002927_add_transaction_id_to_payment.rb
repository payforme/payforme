class AddTransactionIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :paymill_transaction_id, :string
  end
end
