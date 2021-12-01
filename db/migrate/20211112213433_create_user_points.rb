class CreateUserPoints < ActiveRecord::Migration[6.1]
  def up
    create_table :user_points do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { to_table: :references, on_delete: :restrict, on_update: :cascade }

      # Custom fields
      t.decimal :amount, precision: 10, scale: 2
    end
  end

  def down
    drop_table :user_points
  end
end
