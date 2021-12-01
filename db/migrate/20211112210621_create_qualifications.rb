class CreateQualifications < ActiveRecord::Migration[6.1]
  def up
    create_table :qualifications do |t|
      # Timestamps
      t.timestamps null: false

      ## Custom fields
      t.string :title, null: false
      t.decimal :volume, null: false, precision: 10, scale: 2, default: false
      t.decimal :max_points_by_team, null: false, precision: 10, scale: 2, default: false
    end
  end

  def down
    drop_table :qualifications
  end
end
