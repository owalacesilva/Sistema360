class CreatePointDistributions < ActiveRecord::Migration[6.1]
  def up
    create_table :point_distributions do |t|
      # Timestamps
      t.timestamps null: false

      # Custom fields
      t.boolean :done, default: false
      t.decimal :base_value, precision: 10, scale: 2
      t.string :params

      # References
      # t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      # t.references :reference, null: false, foreign_key: { to_table: :references, on_delete: :restrict, on_update: :cascade }
      # t.references :order, null: false, foreign_key: { to_table: :orders, on_delete: :restrict, on_update: :cascade }
    end

    add_reference :point_distributions, :user, index: true, foreign_key: true
    add_reference :point_distributions, :reference, index: true, foreign_key: true
    add_reference :user_point_records, :point_distribution, index: true, foreign_key: true
  end

  def down
    remove_reference :point_distributions, :user, index: true, foreign_key: true
    remove_reference :point_distributions, :reference, index: true, foreign_key: true
    remove_reference :user_point_records, :point_distribution, index: true, foreign_key: true
    drop_table :point_distributions
  end
end
