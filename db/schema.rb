ActiveRecord::Schema.define(version: 20170717014730) do

  create_table "parkings", force: :cascade do |t|
    t.string "parking_type"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parkings_on_user_id"
  end

end
