class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :shop_token
      t.string :sphere_token

      t.timestamps
    end
  end
end
