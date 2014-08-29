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

ActiveRecord::Schema.define(version: 20140813180034) do

  create_table "careertransitions", force: true do |t|
    t.integer  "user_id"
    t.string   "new_career_field",             default: ""
    t.string   "motivation",                   default: ""
    t.integer  "service_through"
    t.string   "ways_service_through",         default: ""
    t.integer  "service_outside"
    t.string   "ways_service_outside",         default: ""
    t.integer  "job_length"
    t.integer  "service_job_satisfaction"
    t.integer  "initial_job_satisfaction"
    t.integer  "previous_dissatisfaction"
    t.text     "dissatisfaction_source",       default: "---\n- None\n"
    t.string   "other_dissatisfaction_source"
    t.string   "event_time",                   default: ""
    t.string   "content",                      default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demographics", force: true do |t|
    t.integer  "user_id"
    t.string   "gender",           default: ""
    t.string   "race",             default: ""
    t.string   "other_race",       default: ""
    t.string   "religious",        default: ""
    t.string   "religious_active", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ed_exp_classifications", force: true do |t|
    t.integer  "user_id"
    t.string   "service_as_student",         default: ""
    t.integer  "no_of_engg_service"
    t.text     "engg_service_exp",           default: "---\n- None\n"
    t.string   "other_service_exp"
    t.string   "participate_as",             default: ""
    t.string   "travel",                     default: ""
    t.string   "travel_type",                default: ""
    t.string   "travel_term",                default: ""
    t.string   "formal_leadership",          default: ""
    t.string   "engg_service_length",        default: ""
    t.string   "engg_service_beneficial",    default: ""
    t.string   "nonengg_service_as_student", default: ""
    t.text     "nonengg_service_exp",        default: "---\n- None\n"
    t.string   "other_non_engg_services",    default: ""
    t.string   "nonengg_service_beneficial", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educationtransitions", force: true do |t|
    t.integer  "user_id"
    t.string   "new_education_field",                        default: ""
    t.string   "other_non_engineering_field"
    t.string   "motivation",                                 default: ""
    t.string   "eng_service_through_program",                default: ""
    t.string   "eng_service_through_extra",                  default: ""
    t.integer  "education_service_satisfaction"
    t.integer  "initial_new_education_service_satisfaction"
    t.integer  "previous_dissatisfaction"
    t.text     "dissatisfaction_source",                     default: "---\n- None\n"
    t.string   "ed_other_dissatisfaction_source",            default: ""
    t.string   "event_time",                                 default: ""
    t.string   "content",                                    default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "like_rt_responses", force: true do |t|
    t.integer  "user_id"
    t.string   "conflicted_community",   default: ""
    t.string   "helping_people",         default: ""
    t.string   "technical_soln_impact",  default: ""
    t.string   "service_not_part",       default: ""
    t.string   "less_money_for_society", default: ""
    t.string   "unconnected",            default: ""
    t.string   "incorporate_societal",   default: ""
    t.string   "call_by_society",        default: ""
    t.string   "pro_brono_work",         default: ""
    t.string   "serve_others",           default: ""
    t.string   "positive_volunteering",  default: ""
    t.string   "extra_time",             default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "accepted",               default: false
    t.string   "undergrad_end",          default: ""
    t.boolean  "completed",              default: false
    t.string   "current_page",           default: "consent"
    t.string   "undergrad_major",        default: ""
    t.string   "other_undergrad_major"
    t.boolean  "is_admin",               default: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
