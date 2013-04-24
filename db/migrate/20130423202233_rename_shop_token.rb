class RenameShopToken < ActiveRecord::Migration
  def up
    rename_column :shops, :shop_token, :project_key
  end

  def down
    rename_column :shops, :project_key, :shop_token
  end
end
