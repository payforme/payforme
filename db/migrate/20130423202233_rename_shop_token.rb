class RenameShopToken < ActiveRecord::Migration
  def up
    rename_column :shops, :shop_token, :project_key
  end

  def down
  end
end
