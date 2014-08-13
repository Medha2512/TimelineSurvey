class CreateCareertransitions < ActiveRecord::Migration
  def change
    create_table :careertransitions do |t|
      t.integer  :user_id
      t.string   :new_career_field
      t.string   :motivation
      t.integer  :service_through
      t.string   :ways_service_through
      t.integer  :service_outside
      t.string   :ways_service_outside
      t.integer  :job_length
      t.integer  :service_job_satisfaction
      t.integer  :initial_job_satisfaction
      t.integer  :previous_dissatisfaction
      t.text     :dissatisfaction_source
      t.string   :other_dissatisfaction_source
      t.string   :event_time
      t.string   :content
      t.timestamps
    end
  end
end
