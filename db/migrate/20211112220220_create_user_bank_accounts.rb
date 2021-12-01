class CreateUserBankAccounts < ActiveRecord::Migration[6.1]
  def up
    create_table :user_bank_accounts do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }

      # Custom fields
      t.string :bank_code
      t.string :bank_name
      t.string :account_type
      t.string :branch_number
      t.string :branch_code
      t.string :account_number
      t.string :account_code
      t.string :holder_name
      t.string :document_number
      t.string :operation
    end
  end

  def down
    drop_table :user_bank_accounts
  end
end
