ActiveRecord::Schema.define(version: 2020_04_10_040148) do
  create_table "allpeopls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "peopl_id"
    t.bigint "sert_id"
    t.bigint "prof_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["peopl_id"], name: "index_allpeopls_on_peopl_id"
    t.index ["prof_id"], name: "index_allpeopls_on_prof_id"
    t.index ["sert_id"], name: "index_allpeopls_on_sert_id"
  end
  create_table "contracts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "organisation_id"
    t.bigint "explosive_id"
    t.float "coutn"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["explosive_id"], name: "index_contracts_on_explosive_id"
    t.index ["organisation_id"], name: "index_contracts_on_organisation_id"
  end
  create_table "cuts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  create_table "deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "contract_id"
    t.bigint "storehouse_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "time"
    t.index ["contract_id"], name: "index_deliveries_on_contract_id"
    t.index ["storehouse_id"], name: "index_deliveries_on_storehouse_id"
  end
  create_table "explosives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "oxygen"
    t.float "heat"
    t.float "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  create_table "organisations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  create_table "peopls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fn"
    t.string "sn"
    t.string "tn"
    t.string "dolj"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  create_table "profs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_prof"
    t.bigint "peopl_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["peopl_id"], name: "index_profs_on_peopl_id"
  end
  create_table "requirements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "requi1"
    t.string "requi2"
    t.string "requi3"
    t.string "requi4"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  create_table "serts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_sert"
    t.bigint "peopl_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["peopl_id"], name: "index_serts_on_peopl_id"
  end
  create_table "storehouses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "peopl_id"
    t.bigint "peopl1_id"
    t.bigint "requirement_id"
    t.bigint "cut_id"
    t.float "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["cut_id"], name: "index_storehouses_on_cut_id"
    t.index ["peopl1_id"], name: "index_storehouses_on_peopl1_id"
    t.index ["peopl_id"], name: "index_storehouses_on_peopl_id"
    t.index ["requirement_id"], name: "index_storehouses_on_requirement_id"
  end
  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "fname"
    t.string "sname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  create_table "wells", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "explosive_id"
    t.bigint "cut_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cut_id"], name: "index_wells_on_cut_id"
    t.index ["explosive_id"], name: "index_wells_on_explosive_id"
  end
  create_table "works", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "well_id"
    t.bigint "peopl_id"
    t.bigint "peopl1_id"
    t.datetime "time"
    t.float "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["peopl1_id"], name: "index_works_on_peopl1_id"
    t.index ["peopl_id"], name: "index_works_on_peopl_id"
    t.index ["well_id"], name: "index_works_on_well_id"
  end
  add_foreign_key "allpeopls", "peopls"
  add_foreign_key "allpeopls", "profs"
  add_foreign_key "allpeopls", "serts"
  add_foreign_key "contracts", "explosives", column: "explosive_id"
  add_foreign_key "contracts", "organisations"
  add_foreign_key "deliveries", "contracts"
  add_foreign_key "deliveries", "storehouses"
  add_foreign_key "profs", "peopls"
  add_foreign_key "serts", "peopls"
  add_foreign_key "storehouses", "cuts"
  add_foreign_key "storehouses", "peopls"
  add_foreign_key "storehouses", "peopls", column: "peopl1_id"
  add_foreign_key "storehouses", "requirements"
  add_foreign_key "wells", "cuts"
  add_foreign_key "wells", "explosives", column: "explosive_id"
  add_foreign_key "works", "peopls"
  add_foreign_key "works", "peopls", column: "peopl1_id"
  add_foreign_key "works", "wells"
end
