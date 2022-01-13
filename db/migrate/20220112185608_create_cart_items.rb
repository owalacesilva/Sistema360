class CreateCartItems < ActiveRecord::Migration[6.1]
  def up
    create_table :cart_items do |t|
      # Timestamps
      t.timestamps null: false

      # Cart Item's details
      t.integer :quantity, null: false, default: 0
      
      # References
      t.references :cart, null: false, foreign_key: { to_table: :carts, on_delete: :cascade, on_update: :cascade }
      t.references :product, null: false, foreign_key: { to_table: :products, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :cart_items, if_exists: true
  end
end
