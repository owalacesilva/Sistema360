class CreateWallets < ActiveRecord::Migration[6.1]
  def up
    create_table :wallets do |t|
      # Timestamps
      t.timestamps null: false

      t.decimal :balance, precision: 10, scale: 2
      t.decimal :incomes, precision: 10, scale: 2
      t.decimal :expenses, precision: 10, scale: 2

      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :wallets, if_exists: true
  end
end
