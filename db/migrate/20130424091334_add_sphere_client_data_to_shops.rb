class AddSphereClientDataToShops < ActiveRecord::Migration
  def change
    add_column :shops, :sphere_client_id, :string
    add_column :shops, :sphere_client_secret, :string
  end
end
