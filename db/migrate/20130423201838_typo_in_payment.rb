class TypoInPayment < ActiveRecord::Migration
  def up
    rename_column :payments,  :shpere_id, :sphere_id
  end

  def down
  end
end
