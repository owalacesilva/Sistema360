class CreateProducts < ActiveRecord::Migration[6.1]
  def up
    create_table :products do |t|
      # Timestamps
      t.timestamps null: false
      
      # Product's status
      t.boolean :blocked, default: false, null: false
      t.date :blocked_at
      t.boolean :published, default: false, null: false
      t.date :published_at

      # Product's details
      t.string   :permalink, null: false, index: true
      t.string   :title, null: false
      t.text     :description
      t.string   :short_description
      t.text     :keywords
      t.string   :product_type, null: false
      t.decimal  :price, :precision => 10, :scale => 2, default: 0, null: false
      t.decimal  :discount_price, :precision => 10, :scale => 2, default: 0, null: true
      t.integer  :stock_quantity, default: 0
      t.boolean  :featured, default: false
      t.boolean  :sold_out, default: false

      # Product's properties
      t.decimal  :width,  :precision => 10, :scale => 2, default: 0
      t.decimal  :height, :precision => 10, :scale => 2, default: 0
      t.decimal  :length, :precision => 10, :scale => 2, default: 0
      t.decimal  :weigth, :precision => 10, :scale => 2, default: 0
      
      # Product's business plan
      t.decimal  :point_amount, :precision => 10, :scale => 2, default: 0

      # References
      t.references :category, null: false, foreign_key: { to_table: :product_categories, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :products, if_exists: true
  end
end
