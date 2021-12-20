class CreateCommissions < ActiveRecord::Migration[6.1]
  def up
    create_table :commissions do |t|
      # Timestamps
      t.timestamps null: false

      # Commission's details
      t.string :display_name, null: false
      t.string :description
      t.integer :percentage, null: false, default: 0
      t.integer :depth, null: false

      # References
      t.references :type, null: false, foreign_key: { to_table: :commission_types, on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: true, foreign_key: { to_table: :references, on_delete: :restrict, on_update: :cascade }
      t.references :qualification, null: false, foreign_key: { to_table: :qualifications, on_delete: :restrict, on_update: :cascade }
    end

    add_reference :user_point_records, :commission, index: true, foreign_key: true
  end

  def down
    remove_reference :user_point_records, :commission, index: true, foreign_key: true
    drop_table :commissions, if_exists: true
  end
end
