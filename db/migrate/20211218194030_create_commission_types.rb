class CreateCommissionTypes < ActiveRecord::Migration[6.1]
  def up
    create_table :commission_types do |t|
      # Timestamps
      t.timestamps null: false

      # Commission Type's details
      t.string :display_name, null: false
      t.string :unique_name, null: false
      t.string :description
    end
  end

  def down
    drop_table :commission_types, if_exists: true
  end
end
