class CreatePointDistributions < ActiveRecord::Migration[6.1]
  def up
    create_table :point_distributions do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { to_table: :references, on_delete: :restrict, on_update: :cascade }

      # Custom fields
      t.boolean :done
      t.decimal :base_value, precision: 10, scale: 2
      t.string :params
    end
  end

  def down
    drop_table :point_distributions
  end
end
