class CreateProductCategories < ActiveRecord::Migration[6.1]
  def up
    create_table :product_categories do |t|
      # Timestamps
      t.timestamps null: false

      # Product Category's details
      t.string :name, null: false
      t.string :description
      t.boolean :is_default, default: false
      t.string :tax_code
    end
  end

  def down
    drop_table :product_categories, if_exists: true
  end
end
