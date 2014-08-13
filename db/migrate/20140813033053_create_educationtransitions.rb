class CreateEducationtransitions < ActiveRecord::Migration
  def change
    create_table :educationtransitions do |t|
      t.integer  :user_id
      t.string   :new_education_field
      t.string   :motivation
      t.boolean  :eng_service_through_program
      t.boolean  :eng_service_through_extra
      t.integer   :education_service_satisfaction
      t.integer   :initial_new_education_service_satisfaction
      t.integer   :previous_dissatisfaction
      t.text   :dissatisfaction_source
      t.string :ed_other_dissatisfaction_source
      t.string   :event_time
      t.string   :content
      t.timestamps
    end
  end
end
