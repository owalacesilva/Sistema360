class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def up
    create_table :payment_methods do |t|
      # Timestamps
      t.timestamps null: false
      
      # Payment Method's status
      t.boolean :blocked, default: false, null: false
      t.date :blocked_at

      # Payment Method's details
      t.string :type, null: false
      t.string :name, null: false
      t.text :description
      t.string :display_name
      t.text :preferences
      t.string :preferences_source
      t.integer :position, default: 0
    end
  end

  def down
    drop_table :payment_methods, if_exists: true
  end
end
