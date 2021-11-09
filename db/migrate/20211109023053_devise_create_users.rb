# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      # Timestamps
      t.timestamps null: false

      # Blocked
      t.boolean :blocked,     default: false
      t.datetime :blocked_at
      t.boolean :verified,    default: false
      t.datetime :verified_at

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :password,           null: true, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## User fields
      t.string :status,       null: false, default: 'actived'
      t.string :username,     null: false
      t.string :first_name
      t.string :last_name
      t.string :person_type,  null: true, limit: 2, default: 'PF'
      t.string :rg_number,    null: true
      t.string :cpf_number,   null: true
      t.string :razao_social, null: true
      t.string :cnpj_number,  null: true
      t.string :gender,       null: false, limit: '6'
      t.date :birth_date
      t.string :phone_number
      t.string :personal_number

      ## Address
      t.string :postal_code
      t.string :street_address
      t.string :building_number
      t.string :recipient
      t.string :apartament
      t.string :door_code
      t.string :floor
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :state_abbr
      t.string :country
      t.string :country_code
      t.string :latitude
      t.string :longitude

      # References
      t.references :sponsor, null: true, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end

  def down
    remove_index :users, :email
    remove_index :users, :reset_password_token
    remove_index :users, :confirmation_token
    remove_index :users, :unlock_token
    drop_table :users
  end
end
