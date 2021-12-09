class CreateReferences < ActiveRecord::Migration[6.1]
  def up
    create_table :references do |t|
      # Timestamps
      t.timestamps null: false

      # Custom fields
      t.string :title, null: false
    end
  end

  def down
    drop_table :user_points
  end
end
