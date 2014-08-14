class CreateEducationtransitions < ActiveRecord::Migration
  def change
    create_table :educationtransitions do |t|
      t.integer  :user_id
      t.string   :new_education_field, :default => "None"
      t.string   :other_non_engineering_field
      t.string   :motivation, :default => "None"
      t.boolean  :eng_service_through_program, :default => false
      t.boolean  :eng_service_through_extra, :default => false
      t.integer   :education_service_satisfaction, :default => 0
      t.integer   :initial_new_education_service_satisfaction, :default => 0
      t.integer   :previous_dissatisfaction, :default => 0
      t.text   :dissatisfaction_source , :default => ["None"]
      t.string :ed_other_dissatisfaction_source, :default => false
      t.string   :event_time, :default => false
      t.string   :content, :default => false
      t.timestamps
    end
  end
end
