class CreatTableCartsProducts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :carts, :products
    add_index :carts_products, [:cart_id, :product_id]
  end
end
