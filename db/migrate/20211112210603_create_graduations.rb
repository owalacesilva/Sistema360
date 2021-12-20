class CreateGraduations < ActiveRecord::Migration[6.1]
  def up
    create_table :graduations do |t|
      # Timestamps
      t.timestamps null: false

      ## Custom fields
      t.string :display_name, null: false
      t.string :unique_name, null: false
      t.decimal :volume, null: false, precision: 10, scale: 2, default: false
      t.decimal :max_points_by_team, null: false, precision: 10, scale: 2, default: false
    end
  end

  def down
    drop_table :graduations
  end
end
