class CreateEducationtransitions < ActiveRecord::Migration
  def change
    create_table :educationtransitions do |t|
      t.integer  :user_id
      t.string :new_education_field 
      t.string :motivation
      t.boolean :eng_service_through_program
      t.boolean :eng_service_through_extra
      t.string :education_service_satisfaction
      t.string :initial_new_education_service_satisfaction
      t.string :previous_dissaticfaction
      t.string :dissatisfaction_source
      t.string :event_time
      t.timestamps
    end
  end
end
