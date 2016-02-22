class OrdersAddProductIds < ActiveRecord::Migration
  def change
    add_column :orders, :product_ids, :integer, array: true, default: []
  end
end
