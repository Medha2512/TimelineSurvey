class CreateEducationtransitions < ActiveRecord::Migration
  def change
    create_table :educationtransitions do |t|
      t.integer  :user_id
      t.string   :new_education_field, :default => ""
      t.string   :other_non_engineering_field
      t.string   :motivation, :default => ""
      t.boolean  :eng_service_through_program, :default => false
      t.boolean  :eng_service_through_extra, :default => false
      t.integer   :education_service_satisfaction
      t.integer   :initial_new_education_service_satisfaction
      t.integer   :previous_dissatisfaction
      t.text   :dissatisfaction_source , :default => ["None"]
      t.string :ed_other_dissatisfaction_source
      t.string   :event_time
      t.string   :content
      t.timestamps
    end
  end
end
