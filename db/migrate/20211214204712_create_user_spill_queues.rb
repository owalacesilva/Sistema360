class CreateUserSpillQueues < ActiveRecord::Migration[6.1]
  def up
    create_table :user_spill_queues do |t|
      # Timestamps
      t.timestamps null: false

      # User Spill Queue's status
      t.boolean :spilled, default: false, null: false
      t.date :spilled_at

      # User Spill Queue's details
      t.string :side, null: false

      # References
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :user_sponsor, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :user_spill_queues, if_exists: true
  end
end
