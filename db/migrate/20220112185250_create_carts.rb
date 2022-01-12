class CreateCarts < ActiveRecord::Migration[6.1]
  def up
    create_table :carts do |t|
      # Timestamps
      t.timestamps null: false

      # Cart's details
      t.decimal :total, precision: 10, scale: 2, null: false

      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
    end
  end

  def down
    drop_table :carts, if_exists: true
  end
end
