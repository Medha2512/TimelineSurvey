class CreateCareertransitions < ActiveRecord::Migration
  def change
    create_table :careertransitions do |t|
      t.integer  :user_id
      t.string   :new_career_field , :default => "None"
      t.string   :motivation, :default => "None"
      t.integer  :service_through, :default => 0
      t.string   :ways_service_through, :default => "None"
      t.integer  :service_outside, :default => 0
      t.string   :ways_service_outside, :default => "None"
      t.integer  :job_length, :default => 0
      t.integer  :service_job_satisfaction, :default => 0
      t.integer  :initial_job_satisfaction, :default => 0
      t.integer  :previous_dissatisfaction, :default => 0
      t.text     :dissatisfaction_source , :default => ["None"]
      t.string   :other_dissatisfaction_source
      t.string   :event_time, :default => "None"
      t.string   :content, :default => "None"
      t.timestamps
    end
  end
end
