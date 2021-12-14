class CreateUserNetworks < ActiveRecord::Migration[6.1]
  def up
    create_table :user_networks do |t|
      # Timestamps
      t.timestamps null: false

      # User Network's details
      t.integer :left, null: false
      t.integer :right, null: false
      t.integer :depth, null: false
      t.decimal :points, :precision => 10, :scale => 2, default: "0.0", null: false

      # References
      t.references :user_sponsor, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :user_parent, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :user_networks, if_exists: true
  end
end
