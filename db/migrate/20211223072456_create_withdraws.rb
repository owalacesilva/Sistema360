class CreateWithdraws < ActiveRecord::Migration[6.1]
  def up
    create_table :withdraws do |t|
      # Timestamps
      t.timestamps null: false

      t.boolean :blocked, default: false, null: false
      t.date :blocked_at

      t.boolean :approved, default: false, null: false
      t.date :approved_at

      t.decimal :balance, precision: 10, scale: 2

      t.references :wallet, null: false, foreign_key: { to_table: :wallets, on_delete: :cascade, on_update: :cascade }
    end

    def down
      drop_table :withdraws, if_exists: true
    end
  end
end
