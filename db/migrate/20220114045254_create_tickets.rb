class CreateTickets < ActiveRecord::Migration[6.1]
  def up
    create_table :tickets do |t|
      # Timestamps
      t.timestamps null: false

      # Ticket's details
      t.string :status, null: false
      t.string :subject, null: false
      t.text :message
      t.text :reply
      t.string :department, null: false
      t.string :priority, null: false
      
      # References
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
    end
  end

  def down
    drop_table :tickets, if_exists: true
  end
end
