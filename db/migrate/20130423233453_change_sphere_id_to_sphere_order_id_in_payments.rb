class ChangeSphereIdToSphereOrderIdInPayments < ActiveRecord::Migration
  def change
    rename_column :payments, :sphere_id, :sphere_order_id
  end
end
