class CreateOrderItems < ActiveRecord::Migration[6.1]
  def up
    create_table :order_items do |t|
      # Timestamps
      t.timestamps null: false

      # Order Item's details
      t.integer :quantity, null: false
      t.decimal :price, :precision => 10, :scale => 2, default: "0.0", null: false
      t.decimal :cost_price, :precision => 10, :scale => 2, default: "0.0", null: false
      t.decimal :additional_tax_total, :precision => 10, :scale => 2, default: "0.0", null: false
      
      # References
      t.references :order, null: false, foreign_key: { to_table: :orders, on_delete: :cascade, on_update: :cascade }
      t.references :product, null: false, foreign_key: { to_table: :products, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :order_items, if_exists: true
  end
end
