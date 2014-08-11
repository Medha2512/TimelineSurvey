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

ActiveRecord::Schema.define(version: 20140810231710) do

  create_table "careertransitions", force: true do |t|
    t.integer  "user_id"
    t.string   "new_career_field"
    t.string   "motivation"
    t.string   "service_through"
    t.string   "ways_service_through"
    t.string   "service_outside"
    t.string   "ways_service_outside"
    t.integer  "job_length"
    t.string   "service_job_satisfaction"
    t.string   "previous_dissatisfaction"
    t.string   "dissatisfaction_source"
    t.string   "event_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ed_exp_classifications", force: true do |t|
    t.integer  "user_id"
    t.boolean  "service"
    t.integer  "no_of_engg_service"
    t.text     "service_exp"
    t.string   "participate_as"
    t.boolean  "travel"
    t.string   "travel_type"
    t.string   "travel_term"
    t.boolean  "formal_leadership"
    t.string   "service_period"
    t.string   "engg_beneficial_experience"
    t.boolean  "non_engg_service"
    t.text     "non_engg_ser_exp"
    t.string   "nonengg_beneficial_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educationtransitions", force: true do |t|
    t.integer  "user_id"
    t.string   "new_education_field"
    t.string   "motivation"
    t.boolean  "eng_service_through_program"
    t.boolean  "eng_service_through_extra"
    t.string   "education_service_satisfaction"
    t.string   "initial_new_education_service_satisfaction"
    t.string   "previous_dissatisfaction"
    t.string   "dissatisfaction_source"
    t.string   "event_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "like_rt_responses", force: true do |t|
    t.integer  "user_id"
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
    t.string   "question4"
    t.string   "question5"
    t.string   "question6"
    t.string   "question7"
    t.string   "question8"
    t.string   "question9"
    t.string   "question10"
    t.string   "question11"
    t.string   "question12"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "accepted",               default: false
    t.datetime "undergrad_end"
    t.string   "current_page"
    t.string   "undergrad_major"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "salt"
    t.boolean  "is_admin"
  end

end
