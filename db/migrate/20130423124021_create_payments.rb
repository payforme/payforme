class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :shpere_id
      t.string :payers_mail
      t.string :payers_name
      t.references :shop

      t.timestamps
    end
  end
end
