class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, index: true
      t.integer :store_id, index: true
      t.datetime :pickup_time
      t.string :status, default: "placed"

      t.timestamps null: false
    end

    add_column :products, :order_id, :integer
  end
end
