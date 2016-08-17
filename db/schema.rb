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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160817205736) do

  create_table "allsettings", force: :cascade do |t|
    t.boolean  "default"
    t.string   "name",                        limit: 255
    t.string   "allcountriesname",            limit: 255
    t.integer  "allcountriessort",            limit: 4
    t.string   "allwondersname",              limit: 255
    t.integer  "allwonderssort",              limit: 4
    t.string   "allbestname",                 limit: 255
    t.integer  "allbestsort",                 limit: 4
    t.integer  "mainmenusort",                limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "leftmenusort",                limit: 4
    t.string   "homeinfografik_file_name",    limit: 255
    t.string   "homeinfografik_content_type", limit: 255
    t.integer  "homeinfografik_file_size",    limit: 4
    t.datetime "homeinfografik_updated_at"
    t.text     "copyright",                   limit: 65535
    t.string   "contactadress",               limit: 255
    t.integer  "gorodasort",                  limit: 4
    t.string   "gorodaname",                  limit: 255
  end

  create_table "baners", force: :cascade do |t|
    t.text     "kode",                    limit: 65535
    t.integer  "showcount",               limit: 4
    t.integer  "position_id",             limit: 4
    t.string   "likeurl",                 limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "clickcount",              limit: 4
    t.string   "banerimage_file_name",    limit: 255
    t.string   "banerimage_content_type", limit: 255
    t.integer  "banerimage_file_size",    limit: 4
    t.datetime "banerimage_updated_at"
    t.text     "gourl",                   limit: 65535
    t.integer  "showclickcount",          limit: 4,     default: 0
    t.integer  "showshowcount",           limit: 4,     default: 0
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "descrip",    limit: 65535
    t.text     "hint",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "sortorder",  limit: 4
  end

  create_table "chudesas", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "toptext",      limit: 65535
    t.text     "bottomtext",   limit: 65535
    t.integer  "sortorder",    limit: 4
    t.integer  "showplace_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "chudesas", ["showplace_id"], name: "index_chudesas_on_showplace_id", using: :btree

  create_table "chudesas_showplaces", id: false, force: :cascade do |t|
    t.integer "chudesa_id",   limit: 4
    t.integer "showplace_id", limit: 4
  end

  add_index "chudesas_showplaces", ["chudesa_id"], name: "index_chudesas_showplaces_on_chudesa_id", using: :btree
  add_index "chudesas_showplaces", ["showplace_id"], name: "index_chudesas_showplaces_on_showplace_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "h1",                  limit: 255
    t.text     "keywords",            limit: 65535
    t.text     "description",         limit: 65535
    t.string   "offname",             limit: 255
    t.string   "stolica",             limit: 255
    t.string   "language",            limit: 255
    t.string   "valute",              limit: 255
    t.string   "ploscha",             limit: 255
    t.string   "naselenie",           limit: 255
    t.string   "datanezavis",         limit: 255
    t.string   "delenie",             limit: 255
    t.string   "glava",               limit: 255
    t.string   "zakon",               limit: 255
    t.string   "ispolnit",            limit: 255
    t.text     "shortdesc",           limit: 65535
    t.text     "googlemap",           limit: 65535
    t.text     "descforturist",       limit: 65535
    t.text     "primech",             limit: 65535
    t.text     "visum",               limit: 65535
    t.text     "chtonugnoznat",       limit: 65535
    t.text     "ceny",                limit: 65535
    t.text     "valutes",             limit: 65535
    t.text     "jazik",               limit: 65535
    t.text     "bezopasnost",         limit: 65535
    t.text     "oteli",               limit: 65535
    t.text     "pitanie",             limit: 65535
    t.text     "transport",           limit: 65535
    t.text     "prazdniki",           limit: 65535
    t.text     "internet",            limit: 65535
    t.text     "chtobrat",            limit: 65535
    t.text     "suvenir",             limit: 65535
    t.text     "dostoprimech",        limit: 65535
    t.text     "politika",            limit: 65535
    t.text     "cultura",             limit: 65535
    t.integer  "region_id",           limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "tag",                 limit: 255
    t.string   "flag_file_name",      limit: 255
    t.string   "flag_content_type",   limit: 255
    t.integer  "flag_file_size",      limit: 4
    t.datetime "flag_updated_at"
    t.string   "globus_file_name",    limit: 255
    t.string   "globus_content_type", limit: 255
    t.integer  "globus_file_size",    limit: 4
    t.datetime "globus_updated_at"
    t.integer  "chaspoyas",           limit: 4,     default: 0,     null: false
    t.text     "pogoda",              limit: 65535
    t.integer  "parent_id",           limit: 4
    t.string   "timezone",            limit: 255,   default: "UTC"
    t.string   "crest_file_name",     limit: 255
    t.string   "crest_content_type",  limit: 255
    t.integer  "crest_file_size",     limit: 4
    t.datetime "crest_updated_at"
    t.string   "title",               limit: 255
  end

  add_index "countries", ["region_id"], name: "index_countries_on_region_id", using: :btree

  create_table "countrypictures", force: :cascade do |t|
    t.integer  "country_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "name",               limit: 255
  end

  add_index "countrypictures", ["country_id"], name: "index_countrypictures_on_country_id", using: :btree

  create_table "countrytextblocks", force: :cascade do |t|
    t.text     "fulltext",           limit: 65535
    t.integer  "sortorder",          limit: 4
    t.integer  "country_id",         limit: 4
    t.integer  "textblock_id",       limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "image_file_name",    limit: 65535
    t.text     "image_content_type", limit: 65535
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "showplace_id",       limit: 4
    t.text     "blocklink",          limit: 65535
  end

  add_index "countrytextblocks", ["country_id"], name: "index_countrytextblocks_on_country_id", using: :btree
  add_index "countrytextblocks", ["textblock_id"], name: "index_countrytextblocks_on_textblock_id", using: :btree

  create_table "countryvideos", force: :cascade do |t|
    t.text     "kode",       limit: 65535
    t.integer  "country_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name",       limit: 255
  end

  add_index "countryvideos", ["country_id"], name: "index_countryvideos_on_country_id", using: :btree

  create_table "footermenus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sortorder",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "footersubmenus", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "sortorder",         limit: 4
    t.string   "url",               limit: 255
    t.integer  "footermenu_id",     limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size",    limit: 4
    t.datetime "icon_updated_at"
  end

  add_index "footersubmenus", ["footermenu_id"], name: "index_footersubmenus_on_footermenu_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "descrip",    limit: 65535
    t.text     "hint",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "grouptextblocks", force: :cascade do |t|
    t.text     "name",              limit: 65535
    t.integer  "sortorder",         limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size",    limit: 4
    t.datetime "icon_updated_at"
  end

  create_table "homekarusels", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "sortorder",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "linkobjtocounts", force: :cascade do |t|
    t.integer  "showplace_id", limit: 4
    t.integer  "country_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "linkobjtocounts", ["country_id"], name: "index_linkobjtocounts_on_country_id", using: :btree
  add_index "linkobjtocounts", ["showplace_id"], name: "index_linkobjtocounts_on_showplace_id", using: :btree

  create_table "mainmenus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sortorder",  limit: 4
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "marquees", force: :cascade do |t|
    t.text     "full",       limit: 65535
    t.integer  "showcount",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "menulasts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "sortorder",   limit: 4
    t.text     "hint",        limit: 65535
    t.string   "h1",          limit: 255
    t.text     "keywords",    limit: 65535
    t.text     "description", limit: 65535
    t.text     "page",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "tag",         limit: 255
  end

  create_table "news", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "h1",          limit: 255
    t.text     "keywords",    limit: 65535
    t.text     "description", limit: 65535
    t.text     "page",        limit: 65535
    t.string   "tag",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "country_id",  limit: 4
  end

  create_table "newspictures", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "news_id",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "newspictures", ["news_id"], name: "index_newspictures_on_news_id", using: :btree

  create_table "newsvideos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "kode",       limit: 65535
    t.integer  "news_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "newsvideos", ["news_id"], name: "index_newsvideos_on_news_id", using: :btree

  create_table "placedas", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "showplace_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "countries",    limit: 65535
  end

  add_index "placedas", ["showplace_id"], name: "index_placedas_on_showplace_id", using: :btree
  add_index "placedas", ["user_id"], name: "index_placedas_on_user_id", using: :btree

  create_table "placenets", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "showplace_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "placenets", ["showplace_id"], name: "index_placenets_on_showplace_id", using: :btree
  add_index "placenets", ["user_id"], name: "index_placenets_on_user_id", using: :btree

  create_table "placetextblocks", force: :cascade do |t|
    t.text     "fulltext",           limit: 65535
    t.integer  "showplace_id",       limit: 4
    t.integer  "textblock_id",       limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.text     "image_file_name",    limit: 65535
    t.text     "image_content_type", limit: 65535
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "othershowplace_id",  limit: 4
    t.text     "blocklink",          limit: 65535
    t.integer  "position",           limit: 4,     default: 0
    t.boolean  "delete_image",                     default: false
  end

  add_index "placetextblocks", ["showplace_id"], name: "index_placetextblocks_on_showplace_id", using: :btree
  add_index "placetextblocks", ["textblock_id"], name: "index_placetextblocks_on_textblock_id", using: :btree

  create_table "placevidels", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "showplace_id",     limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "countryarray",     limit: 255
    t.string   "fullcountryarray", limit: 255
  end

  add_index "placevidels", ["showplace_id"], name: "index_placevidels_on_showplace_id", using: :btree
  add_index "placevidels", ["user_id"], name: "index_placevidels_on_user_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message",    limit: 65535
    t.string   "username",   limit: 255
    t.integer  "item",       limit: 4
    t.string   "table",      limit: 255
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "descrip",    limit: 65535
    t.text     "hint",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "sortorder",  limit: 4
    t.text     "googlemap",  limit: 65535
  end

  create_table "rightmenus", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "sortorder",          limit: 4
    t.string   "url",                limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "descrip",            limit: 65535
    t.text     "hint",               limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "sortorder",          limit: 4
    t.string   "icon_file_name",     limit: 255
    t.string   "icon_content_type",  limit: 255
    t.integer  "icon_file_size",     limit: 4
    t.datetime "icon_updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "sitename",               limit: 255
    t.string   "favicon_file_name",      limit: 255
    t.string   "favicon_content_type",   limit: 255
    t.integer  "favicon_file_size",      limit: 4
    t.datetime "favicon_updated_at"
    t.string   "logotype_file_name",     limit: 255
    t.string   "logotype_content_type",  limit: 255
    t.integer  "logotype_file_size",     limit: 4
    t.datetime "logotype_updated_at"
    t.string   "watermark_file_name",    limit: 255
    t.string   "watermark_content_type", limit: 255
    t.integer  "watermark_file_size",    limit: 4
    t.datetime "watermark_updated_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "top100_text",            limit: 65535
    t.text     "footer_text",            limit: 65535
    t.string   "system_email",           limit: 255
    t.string   "vk_link",                limit: 255
    t.string   "fb_link",                limit: 255
    t.string   "instagram_link",         limit: 255
    t.string   "twitter_link",           limit: 255
    t.string   "youtube_link",           limit: 255
    t.string   "google_link",            limit: 255
    t.text     "hotels",                 limit: 65535
    t.text     "flights",                limit: 65535
    t.text     "car_rental",             limit: 65535
  end

  create_table "showplacepanos", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "src",                limit: 65535
    t.integer  "showplace_id",       limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "thumb_file_name",    limit: 255
    t.string   "thumb_content_type", limit: 255
    t.integer  "thumb_file_size",    limit: 4
    t.datetime "thumb_updated_at"
  end

  add_index "showplacepanos", ["showplace_id"], name: "index_showplacepanos_on_showplace_id", using: :btree

  create_table "showplacepictures", force: :cascade do |t|
    t.integer  "showplace_id",       limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "name",               limit: 255
    t.integer  "position",           limit: 4,   default: 0
  end

  add_index "showplacepictures", ["showplace_id"], name: "index_showplacepictures_on_showplace_id", using: :btree

  create_table "showplaces", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "h1",            limit: 255
    t.text     "keywords",      limit: 65535
    t.text     "description",   limit: 65535
    t.string   "tag",           limit: 255
    t.text     "shortdesc",     limit: 65535
    t.text     "googlemap",     limit: 65535
    t.text     "fulldesc",      limit: 65535
    t.text     "primech",       limit: 65535
    t.integer  "section_id",    limit: 4
    t.integer  "category_id",   limit: 4
    t.integer  "group_id",      limit: 4
    t.integer  "region_id",     limit: 4
    t.string   "datapostroyki", limit: 255
    t.boolean  "lose"
    t.boolean  "wonders7"
    t.boolean  "top100"
    t.boolean  "unesco"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.decimal  "point",                       precision: 5, scale: 1
    t.boolean  "showfilter",                                          default: true
    t.boolean  "showhome",                                            default: true
    t.boolean  "ginnesa"
    t.boolean  "showinsection",                                       default: true
    t.boolean  "showincountry",                                       default: true
    t.boolean  "itsgorod",                                            default: false
    t.string   "title",         limit: 255
    t.boolean  "visible",                                             default: true
    t.text     "street_pano",   limit: 65535
  end

  add_index "showplaces", ["category_id"], name: "index_showplaces_on_category_id", using: :btree
  add_index "showplaces", ["group_id"], name: "index_showplaces_on_group_id", using: :btree
  add_index "showplaces", ["region_id"], name: "index_showplaces_on_region_id", using: :btree
  add_index "showplaces", ["section_id"], name: "index_showplaces_on_section_id", using: :btree

  create_table "showplacevideos", force: :cascade do |t|
    t.text     "kode",         limit: 65535
    t.integer  "showplace_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name",         limit: 255
  end

  add_index "showplacevideos", ["showplace_id"], name: "index_showplacevideos_on_showplace_id", using: :btree

  create_table "sliders", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.integer  "sortorder",          limit: 4
    t.boolean  "showinroot",                       default: true, null: false
    t.boolean  "showinguide",                      default: true, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "staticpages", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "h1",          limit: 255
    t.text     "keywords",    limit: 65535
    t.text     "description", limit: 65535
    t.text     "page",        limit: 65535
    t.string   "tag",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "menulast_id", limit: 4
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "content_id",   limit: 4
    t.string   "content_type", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "textblocks", force: :cascade do |t|
    t.text     "name",              limit: 65535
    t.integer  "sortorder",         limit: 4
    t.integer  "grouptextblock_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "textblocks", ["grouptextblock_id"], name: "index_textblocks_on_grouptextblock_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "family",                 limit: 255
    t.string   "role",                   limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "username",               limit: 255
    t.integer  "lastmarquee",            limit: 4
    t.integer  "lastnews",               limit: 4
    t.string   "country",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "gender",                 limit: 255
    t.date     "birthday"
    t.string   "facebook_link",          limit: 255
    t.string   "twitter_link",           limit: 255
    t.string   "vk_link",                limit: 255
    t.string   "instagram_link",         limit: 255
    t.string   "google_link",            limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,        null: false
    t.integer  "item_id",    limit: 4,          null: false
    t.string   "event",      limit: 255,        null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "chudesas", "showplaces"
  add_foreign_key "countrytextblocks", "countries"
  add_foreign_key "countrytextblocks", "textblocks"
  add_foreign_key "footersubmenus", "footermenus"
  add_foreign_key "identities", "users"
  add_foreign_key "newspictures", "news"
  add_foreign_key "newsvideos", "news"
  add_foreign_key "placetextblocks", "showplaces"
  add_foreign_key "placetextblocks", "textblocks"
  add_foreign_key "textblocks", "grouptextblocks"
end
