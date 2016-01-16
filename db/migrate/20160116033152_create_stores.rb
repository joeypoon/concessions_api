class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :vendor_id, index: true
      t.string :name
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps null: false
    end

    add_column :products, :store_id, :integer
    add_index :products, :store_id
    add_column :products, :vendor_id, :integer, index: true
    add_index :products, :vendor_id
    add_column :users, :roles, :string, array: true, default: ["consumer"]
  end
end