class AddPaymillPublicKey < ActiveRecord::Migration
  def up
    add_column :shops, :paymill_public_key, :string
  end

  def down
  end
end
