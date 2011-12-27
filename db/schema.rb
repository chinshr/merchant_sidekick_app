# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111227201625) do

  create_table "addresses", :force => true do |t|
    t.integer "addressable_id"
    t.string  "addressable_type"
    t.integer "academic_title_id"
    t.string  "gender",            :limit => 1
    t.string  "first_name"
    t.string  "middle_name"
    t.string  "last_name"
    t.text    "street"
    t.string  "city"
    t.string  "postal_code"
    t.string  "province"
    t.string  "province_code",     :limit => 2
    t.string  "country"
    t.string  "country_code",      :limit => 2
    t.string  "company_name"
    t.text    "note"
    t.string  "phone"
    t.string  "mobile"
    t.string  "fax"
    t.string  "type"
  end

  add_index "addresses", ["academic_title_id"], :name => "index_addresses_on_academic_title_id"
  add_index "addresses", ["addressable_id", "addressable_type"], :name => "fk_addresses_addressable"
  add_index "addresses", ["city"], :name => "index_addresses_on_city"
  add_index "addresses", ["company_name"], :name => "index_addresses_on_company_name"
  add_index "addresses", ["country"], :name => "index_addresses_on_country"
  add_index "addresses", ["country_code"], :name => "index_addresses_on_country_code"
  add_index "addresses", ["fax"], :name => "index_addresses_on_fax"
  add_index "addresses", ["first_name"], :name => "index_addresses_on_first_name"
  add_index "addresses", ["gender"], :name => "index_addresses_on_gender"
  add_index "addresses", ["last_name"], :name => "index_addresses_on_last_name"
  add_index "addresses", ["middle_name"], :name => "index_addresses_on_middle_name"
  add_index "addresses", ["mobile"], :name => "index_addresses_on_mobile"
  add_index "addresses", ["phone"], :name => "index_addresses_on_phone"
  add_index "addresses", ["province"], :name => "index_addresses_on_state"
  add_index "addresses", ["province_code"], :name => "index_addresses_on_state_code"
  add_index "addresses", ["type"], :name => "index_addresses_on_type"

  create_table "cart_line_items", :force => true do |t|
    t.string   "item_number"
    t.string   "name"
    t.string   "description"
    t.integer  "quantity",                  :default => 1,       :null => false
    t.string   "unit",                      :default => "piece", :null => false
    t.integer  "pieces",                    :default => 0,       :null => false
    t.integer  "cents",                     :default => 0,       :null => false
    t.string   "currency",     :limit => 3, :default => "USD",   :null => false
    t.boolean  "taxable",                   :default => false,   :null => false
    t.integer  "product_id",                                     :null => false
    t.string   "product_type",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_line_items", ["item_number"], :name => "index_cart_line_items_on_item_number"
  add_index "cart_line_items", ["name"], :name => "index_cart_line_items_on_name"
  add_index "cart_line_items", ["pieces"], :name => "index_cart_line_items_on_pieces"
  add_index "cart_line_items", ["product_id", "product_type"], :name => "index_cart_line_items_on_product_id_and_product_type"
  add_index "cart_line_items", ["quantity"], :name => "index_cart_line_items_on_quantity"
  add_index "cart_line_items", ["unit"], :name => "index_cart_line_items_on_unit"

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gateways", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "mode"
    t.string   "type"
    t.string   "login_id"
    t.string   "transaction_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gateways", ["name"], :name => "index_gateways_on_name"
  add_index "gateways", ["type"], :name => "index_gateways_on_type"

  create_table "invoices", :force => true do |t|
    t.integer  "buyer_id"
    t.string   "buyer_type"
    t.integer  "seller_id"
    t.string   "seller_type"
    t.integer  "net_cents",     :default => 0,         :null => false
    t.integer  "tax_cents",     :default => 0,         :null => false
    t.integer  "gross_cents",   :default => 0,         :null => false
    t.string   "currency",      :default => "USD",     :null => false
    t.string   "type"
    t.string   "number"
    t.string   "status",        :default => "pending", :null => false
    t.datetime "paid_at"
    t.integer  "order_id"
    t.datetime "authorized_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["buyer_id", "buyer_type"], :name => "index_invoices_on_buyer_id_and_buyer_type"
  add_index "invoices", ["number"], :name => "index_invoices_on_number"
  add_index "invoices", ["order_id"], :name => "index_invoices_on_order_id"
  add_index "invoices", ["seller_id", "seller_type"], :name => "index_invoices_on_seller_id_and_seller_type"
  add_index "invoices", ["type"], :name => "index_invoices_on_type"

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "invoice_id"
    t.integer  "sellable_id"
    t.string   "sellable_type"
    t.integer  "net_cents",                                     :default => 0,     :null => false
    t.integer  "tax_cents",                                     :default => 0,     :null => false
    t.integer  "gross_cents",                                   :default => 0,     :null => false
    t.string   "currency",                                      :default => "USD", :null => false
    t.decimal  "tax_rate",      :precision => 15, :scale => 10, :default => 0.0,   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["invoice_id"], :name => "index_line_items_on_invoice_id"
  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["sellable_id", "sellable_type"], :name => "index_line_items_on_sellable_id_and_sellable_type"

  create_table "merchants", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "buyer_id"
    t.string   "buyer_type"
    t.integer  "seller_id"
    t.string   "seller_type"
    t.integer  "invoice_id"
    t.integer  "net_cents",                :default => 0,         :null => false
    t.integer  "tax_cents",                :default => 0,         :null => false
    t.integer  "gross_cents",              :default => 0,         :null => false
    t.string   "currency",    :limit => 3, :default => "USD",     :null => false
    t.string   "type"
    t.string   "status",                   :default => "created", :null => false
    t.string   "number"
    t.string   "description"
    t.datetime "canceled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["buyer_id", "buyer_type"], :name => "index_orders_on_buyer_id_and_buyer_type"
  add_index "orders", ["seller_id", "seller_type"], :name => "index_orders_on_seller_id_and_seller_type"
  add_index "orders", ["status"], :name => "index_orders_on_status"
  add_index "orders", ["type"], :name => "index_orders_on_type"

  create_table "payments", :force => true do |t|
    t.integer  "payable_id"
    t.string   "payable_type"
    t.boolean  "success"
    t.string   "reference"
    t.string   "message"
    t.string   "action"
    t.string   "params"
    t.boolean  "test"
    t.integer  "cents",                       :default => 0,     :null => false
    t.string   "currency",       :limit => 3, :default => "USD", :null => false
    t.integer  "position"
    t.string   "type"
    t.string   "paypal_account"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["action"], :name => "index_payments_on_action"
  add_index "payments", ["payable_id", "payable_type"], :name => "index_payments_on_payable_id_and_payable_type"
  add_index "payments", ["position"], :name => "index_payments_on_position"
  add_index "payments", ["reference"], :name => "index_payments_on_reference"
  add_index "payments", ["uuid"], :name => "index_payments_on_uuid"

end
