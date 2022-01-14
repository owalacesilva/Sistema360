# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_14_045254) do

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "alternative_phone_number"
    t.string "company_name"
    t.string "postal_code"
    t.string "street_address"
    t.string "building_number"
    t.string "recipient"
    t.string "apartament"
    t.string "door_code"
    t.string "floor"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "state_abbr"
    t.string "country"
    t.string "country_code"
    t.string "latitude"
    t.string "longitude"
  end

  create_table "cart_items", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 0, null: false
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "total", precision: 10, scale: 2, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "commission_types", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_name", null: false
    t.string "unique_name", null: false
    t.string "description"
  end

  create_table "commissions", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_name", null: false
    t.string "description"
    t.integer "percentage", default: 0, null: false
    t.integer "depth", null: false
    t.bigint "type_id", null: false
    t.bigint "reference_id"
    t.bigint "qualification_id", null: false
    t.index ["qualification_id"], name: "index_commissions_on_qualification_id"
    t.index ["reference_id"], name: "index_commissions_on_reference_id"
    t.index ["type_id"], name: "index_commissions_on_type_id"
  end

  create_table "graduations", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_name", null: false
    t.string "unique_name", null: false
    t.decimal "volume", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "max_points_by_team", precision: 10, scale: 2, default: "0.0", null: false
  end

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "cost_price", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "blocked", default: false, null: false
    t.date "blocked_at"
    t.boolean "completed", default: false, null: false
    t.date "completed_at"
    t.boolean "canceled", default: false, null: false
    t.date "canceled_at"
    t.string "number", limit: 32, null: false
    t.date "reference_date", null: false
    t.string "status", null: false
    t.decimal "item_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "shipment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "payment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "discount_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "user_id", null: false
    t.bigint "billing_address_id", null: false
    t.bigint "shipping_address_id", null: false
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_methods", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "blocked", default: false, null: false
    t.date "blocked_at"
    t.string "name", null: false
    t.string "display_name", null: false
    t.text "description"
    t.text "preferences"
    t.string "preferences_source"
    t.integer "position", default: 0, null: false
  end

  create_table "point_distributions", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "done", default: false
    t.decimal "base_value", precision: 10, scale: 2
    t.string "params"
    t.bigint "user_id"
    t.bigint "reference_id"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_point_distributions_on_order_id"
    t.index ["reference_id"], name: "index_point_distributions_on_reference_id"
    t.index ["user_id"], name: "index_point_distributions_on_user_id"
  end

  create_table "product_categories", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "display_name", null: false
    t.string "description"
    t.boolean "is_default", default: false
    t.string "tax_code"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "blocked", default: false, null: false
    t.date "blocked_at"
    t.boolean "published", default: false, null: false
    t.date "published_at"
    t.string "permalink", null: false
    t.string "title", null: false
    t.text "description"
    t.string "short_description"
    t.text "keywords"
    t.string "product_type", null: false
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "discount_price", precision: 10, scale: 2, default: "0.0"
    t.integer "stock_quantity", default: 0
    t.boolean "featured", default: false
    t.boolean "sold_out", default: false
    t.decimal "width", precision: 10, scale: 2, default: "0.0"
    t.decimal "height", precision: 10, scale: 2, default: "0.0"
    t.decimal "length", precision: 10, scale: 2, default: "0.0"
    t.decimal "weigth", precision: 10, scale: 2, default: "0.0"
    t.decimal "point_amount", precision: 10, scale: 2, default: "0.0"
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["permalink"], name: "index_products_on_permalink"
  end

  create_table "qualifications", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_name", null: false
    t.string "unique_name", null: false
    t.decimal "volume", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "max_points_by_team", precision: 10, scale: 2, default: "0.0", null: false
  end

  create_table "references", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_name", null: false
    t.string "unique_name", null: false
  end

  create_table "tickets", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", null: false
    t.string "subject", null: false
    t.text "message"
    t.text "reply"
    t.string "department", null: false
    t.string "priority", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "transactions", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "operation", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.integer "percentage"
    t.decimal "point_amount", precision: 10, scale: 2, null: false
    t.bigint "origin_user_id", null: false
    t.bigint "target_user_id", null: false
    t.bigint "target_wallet_id", null: false
    t.bigint "origin_wallet_id", null: false
    t.bigint "reference_id", null: false
    t.bigint "withdraw_id"
    t.index ["origin_user_id"], name: "index_transactions_on_origin_user_id"
    t.index ["origin_wallet_id"], name: "index_transactions_on_origin_wallet_id"
    t.index ["reference_id"], name: "index_transactions_on_reference_id"
    t.index ["target_user_id"], name: "index_transactions_on_target_user_id"
    t.index ["target_wallet_id"], name: "index_transactions_on_target_wallet_id"
    t.index ["withdraw_id"], name: "index_transactions_on_withdraw_id"
  end

  create_table "user_bank_accounts", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "bank_code"
    t.string "bank_name"
    t.string "account_type"
    t.string "branch_number"
    t.string "branch_code"
    t.string "account_number"
    t.string "account_code"
    t.string "holder_name"
    t.string "document_number"
    t.string "operation"
    t.index ["user_id"], name: "index_user_bank_accounts_on_user_id"
  end

  create_table "user_graduations", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "graduation_id", null: false
    t.index ["graduation_id"], name: "index_user_graduations_on_graduation_id"
    t.index ["user_id"], name: "index_user_graduations_on_user_id"
  end

  create_table "user_networks", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", null: false
    t.decimal "points", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "sponsor_node_id"
    t.bigint "parent_node_id"
    t.bigint "user_id", null: false
    t.index ["parent_node_id"], name: "index_user_networks_on_parent_node_id"
    t.index ["sponsor_node_id"], name: "index_user_networks_on_sponsor_node_id"
    t.index ["user_id"], name: "index_user_networks_on_user_id"
  end

  create_table "user_point_records", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "origin_user_id", null: false
    t.bigint "reference_id", null: false
    t.date "record_date"
    t.decimal "base_value", precision: 10, scale: 2
    t.decimal "amount", precision: 10, scale: 2
    t.bigint "point_distribution_id"
    t.bigint "commission_id"
    t.index ["commission_id"], name: "index_user_point_records_on_commission_id"
    t.index ["origin_user_id"], name: "index_user_point_records_on_origin_user_id"
    t.index ["point_distribution_id"], name: "index_user_point_records_on_point_distribution_id"
    t.index ["reference_id"], name: "index_user_point_records_on_reference_id"
    t.index ["user_id"], name: "index_user_point_records_on_user_id"
  end

  create_table "user_points", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "reference_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.index ["reference_id"], name: "index_user_points_on_reference_id"
    t.index ["user_id", "reference_id"], name: "index_user_points_on_user_id_and_reference_id", unique: true
    t.index ["user_id"], name: "index_user_points_on_user_id"
  end

  create_table "user_qualifications", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "qualification_id", null: false
    t.index ["qualification_id"], name: "index_user_qualifications_on_qualification_id"
    t.index ["user_id"], name: "index_user_qualifications_on_user_id"
  end

  create_table "user_spill_queues", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "spilled", default: false, null: false
    t.date "spilled_at"
    t.string "side", null: false
    t.bigint "user_id", null: false
    t.bigint "user_sponsor_id", null: false
    t.index ["user_id"], name: "index_user_spill_queues_on_user_id"
    t.index ["user_sponsor_id"], name: "index_user_spill_queues_on_user_sponsor_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "blocked", default: false
    t.datetime "blocked_at"
    t.boolean "verified", default: false
    t.datetime "verified_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "status", default: "actived", null: false
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "person_type", limit: 2, default: "PF"
    t.string "rg_number"
    t.string "cpf_number"
    t.string "razao_social"
    t.string "cnpj_number"
    t.string "gender", limit: 6, null: false
    t.date "birth_date"
    t.string "phone_number"
    t.string "personal_number"
    t.string "postal_code"
    t.string "street_address"
    t.string "building_number"
    t.string "recipient"
    t.string "apartament"
    t.string "door_code"
    t.string "floor"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "state_abbr"
    t.string "country"
    t.string "country_code"
    t.string "latitude"
    t.string "longitude"
    t.bigint "sponsor_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sponsor_id"], name: "index_users_on_sponsor_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "wallets", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "balance", precision: 10, scale: 2
    t.decimal "incomes", precision: 10, scale: 2
    t.decimal "expenses", precision: 10, scale: 2
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  create_table "withdraws", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "blocked", default: false, null: false
    t.date "blocked_at"
    t.boolean "approved", default: false, null: false
    t.date "approved_at"
    t.decimal "balance", precision: 10, scale: 2
    t.bigint "wallet_id", null: false
    t.index ["wallet_id"], name: "index_withdraws_on_wallet_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cart_items", "products", on_update: :cascade
  add_foreign_key "carts", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "commissions", "commission_types", column: "type_id", on_update: :cascade
  add_foreign_key "commissions", "qualifications", on_update: :cascade
  add_foreign_key "commissions", "references", on_update: :cascade
  add_foreign_key "order_items", "orders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "order_items", "products", on_update: :cascade
  add_foreign_key "orders", "addresses", column: "billing_address_id", on_update: :cascade
  add_foreign_key "orders", "addresses", column: "shipping_address_id", on_update: :cascade
  add_foreign_key "orders", "users", on_update: :cascade
  add_foreign_key "point_distributions", "orders"
  add_foreign_key "point_distributions", "references"
  add_foreign_key "point_distributions", "users"
  add_foreign_key "products", "product_categories", column: "category_id", on_update: :cascade
  add_foreign_key "tickets", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "transactions", "references", on_update: :cascade
  add_foreign_key "transactions", "users", column: "origin_user_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "transactions", "users", column: "target_user_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "transactions", "wallets", column: "origin_wallet_id", on_update: :cascade
  add_foreign_key "transactions", "wallets", column: "target_wallet_id", on_update: :cascade
  add_foreign_key "transactions", "withdraws", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_bank_accounts", "users", on_update: :cascade
  add_foreign_key "user_graduations", "graduations", on_update: :cascade
  add_foreign_key "user_graduations", "users", on_update: :cascade
  add_foreign_key "user_networks", "user_networks", column: "parent_node_id", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user_networks", "user_networks", column: "sponsor_node_id", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user_networks", "users", on_update: :cascade
  add_foreign_key "user_point_records", "commissions"
  add_foreign_key "user_point_records", "point_distributions"
  add_foreign_key "user_point_records", "references", on_update: :cascade
  add_foreign_key "user_point_records", "users", column: "origin_user_id", on_update: :cascade
  add_foreign_key "user_point_records", "users", on_update: :cascade
  add_foreign_key "user_points", "references", on_update: :cascade
  add_foreign_key "user_points", "users", on_update: :cascade
  add_foreign_key "user_qualifications", "qualifications", on_update: :cascade
  add_foreign_key "user_qualifications", "users", on_update: :cascade
  add_foreign_key "user_spill_queues", "users", column: "user_sponsor_id", on_update: :cascade
  add_foreign_key "user_spill_queues", "users", on_update: :cascade
  add_foreign_key "users", "users", column: "sponsor_id", on_update: :cascade
  add_foreign_key "wallets", "users", on_update: :cascade
  add_foreign_key "withdraws", "wallets", on_update: :cascade, on_delete: :cascade
end
