class CreateOrders < ActiveRecord::Migration[6.1]
  def up
    create_table :orders do |t|
      # Timestamps
      t.timestamps null: false
      
      # Order's status
      t.boolean :blocked, default: false, null: false
      t.date :blocked_at

      t.boolean :completed, default: false, null: false
      t.date :completed_at

      t.boolean :canceled, default: false, null: false
      t.date :canceled_at

      # Order's details
      t.string  :number, null: false, limit: 32
      t.date    :reference_date, null: false
      t.string  :status, null: false
      t.decimal :item_total, :precision => 10, :scale => 2, default: "0.0", null: false
      t.decimal :shipment_total, precision: 10, scale: 2, default: "0.0", null: false
      t.decimal :payment_total, :precision => 10, :scale => 2, default: "0.0"
      t.decimal :discount_total, :precision => 10, :scale => 2, default: "0.0"
      t.decimal :total, :precision => 10, :scale => 2, default: "0.0", null: false
      
      # References
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :billing_address, null: false, foreign_key: { to_table: :addresses, on_delete: :restrict, on_update: :cascade }
      t.references :shipping_address, null: false, foreign_key: { to_table: :addresses, on_delete: :restrict, on_update: :cascade }
    end
    
    add_reference :point_distributions, :order, index: true, foreign_key: true
  end

  def down
    remove_reference :point_distributions, :order, index: true, foreign_key: true
    drop_table :orders, if_exists: true
  end
end
