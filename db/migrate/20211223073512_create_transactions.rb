class CreateTransactions < ActiveRecord::Migration[6.1]
  def up
    create_table :transactions do |t|
      # Timestamps
      t.timestamps null: false

      # Transaction's details
      t.string :description
      t.string :operation, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.integer :percentage
      t.decimal :point_amount, precision: 10, scale: 2, null: false

      t.references :origin_user, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
      t.references :target_user, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
      t.references :target_wallet, null: false, foreign_key: { to_table: :wallets, on_delete: :restrict, on_update: :cascade }
      t.references :origin_wallet, null: false, foreign_key: { to_table: :wallets, on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { to_table: :references, on_delete: :restrict, on_update: :cascade }
      t.references :withdraw, null: false, foreign_key: { to_table: :withdraws, on_delete: :cascade, on_update: :cascade }
    end
  end

  def down
    drop_table :transactions, if_exists: true
  end
end
