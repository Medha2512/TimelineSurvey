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
    t.string   "new_career_field",             default: "None"
    t.string   "motivation",                   default: "None"
    t.integer  "service_through",              default: 0
    t.string   "ways_service_through",         default: "None"
    t.integer  "service_outside",              default: 0
    t.string   "ways_service_outside",         default: "None"
    t.integer  "job_length",                   default: 0
    t.integer  "service_job_satisfaction",     default: 0
    t.integer  "initial_job_satisfaction",     default: 0
    t.integer  "previous_dissatisfaction",     default: 0
    t.text     "dissatisfaction_source",       default: "---\n- None\n"
    t.string   "other_dissatisfaction_source"
    t.string   "event_time",                   default: "None"
    t.string   "content",                      default: "None"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demographics", force: true do |t|
    t.integer  "user_id"
    t.string   "gender",           default: "None"
    t.string   "race",             default: "None"
    t.string   "religious",        default: "None"
    t.string   "religious_active", default: "None"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ed_exp_classifications", force: true do |t|
    t.integer  "user_id"
    t.string   "service_as_student",         default: "None"
    t.integer  "no_of_engg_service",         default: 0
    t.text     "engg_service_exp",           default: "---\n- None\n"
    t.string   "other_service_exp"
    t.string   "participate_as",             default: "None"
    t.string   "travel",                     default: "None"
    t.string   "travel_type",                default: "None"
    t.string   "travel_term",                default: "None"
    t.string   "formal_leadership",          default: "None"
    t.string   "engg_service_length",        default: "None"
    t.string   "engg_service_beneficial",    default: "None"
    t.string   "nonengg_service_as_student", default: "None"
    t.text     "nonengg_service_exp",        default: "---\n- None\n"
    t.string   "other_non_engg_services",    default: "None"
    t.string   "nonengg_service_beneficial", default: "None"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educationtransitions", force: true do |t|
    t.integer  "user_id"
    t.string   "new_education_field",                        default: "None"
    t.string   "other_non_engineering_field"
    t.string   "motivation",                                 default: "None"
    t.string   "eng_service_through_program",                default: "None"
    t.string   "eng_service_through_extra",                  default: "None"
    t.integer  "education_service_satisfaction",             default: 0
    t.integer  "initial_new_education_service_satisfaction", default: 0
    t.integer  "previous_dissatisfaction",                   default: 0
    t.text     "dissatisfaction_source",                     default: "---\n- None\n"
    t.string   "ed_other_dissatisfaction_source",            default: "None"
    t.string   "event_time",                                 default: "None"
    t.string   "content",                                    default: "None"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "like_rt_responses", force: true do |t|
    t.integer  "user_id"
    t.string   "conflicted_community",   default: "None"
    t.string   "helping_people",         default: "None"
    t.string   "technical_soln_impact",  default: "None"
    t.string   "service_not_part",       default: "None"
    t.string   "less_money_for_society", default: "None"
    t.string   "unconnected",            default: "None"
    t.string   "incorporate_societal",   default: "None"
    t.string   "call_by_society",        default: "None"
    t.string   "pro_brono_work",         default: "None"
    t.string   "serve_others",           default: "None"
    t.string   "positive_volunteering",  default: "None"
    t.string   "extra_time",             default: "None"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "accepted",               default: false
    t.datetime "undergrad_end"
    t.boolean  "completed",              default: false
    t.string   "current_page",           default: "consent"
    t.string   "undergrad_major",        default: "None"
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
