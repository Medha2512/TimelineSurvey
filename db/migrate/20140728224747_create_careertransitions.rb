class CreateCareertransitions < ActiveRecord::Migration
  def change
    create_table :careertransitions do |t|
      t.integer  :user_id
      t.string :new_career_field 
      t.string :motivation
      t.string :service_through
      t.string :ways_service_through
      t.string :service_outside
      t.string :ways_service_outside
      t.integer :job_length
      t.string :service_job_satisfaction
      t.string :previous_dissaticfaction
      t.string :dissatisfaction_source
      t.string :event_time
      t.timestamps
    end
  end
end
