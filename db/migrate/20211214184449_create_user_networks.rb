class CreateUserNetworks < ActiveRecord::Migration[6.1]
  def up
    create_table :user_networks do |t|
      # Timestamps
      t.timestamps null: false

      # User Network's details
      t.integer :lft, null: false
      t.integer :rgt, null: false
      t.integer :depth, null: false
      t.decimal :points, :precision => 10, :scale => 2, default: "0.0", null: false

      # References
      t.references :sponsor_node, null: true, foreign_key: { to_table: :user_networks, on_delete: :nullify, on_update: :cascade }
      t.references :parent_node, null: true, foreign_key: { to_table: :user_networks, on_delete: :nullify, on_update: :cascade }
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :user_networks, if_exists: true
  end
end
