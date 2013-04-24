class AddRejectedAtToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :rejected_at, :datetime
  end
end
