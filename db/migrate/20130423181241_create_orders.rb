class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :sphere_id
      t.binary :data

      t.timestamps
    end
    add_index :orders, sphere_id
  end
end
