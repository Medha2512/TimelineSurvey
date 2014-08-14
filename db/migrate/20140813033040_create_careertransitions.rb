class CreateCareertransitions < ActiveRecord::Migration
  def change
    create_table :careertransitions do |t|
      t.integer  :user_id
      t.string   :new_career_field , :default => ""
      t.string   :motivation, :default => ""
      t.integer  :service_throughe
      t.string   :ways_service_through, :default => ""
      t.integer  :service_outside
      t.string   :ways_service_outside, :default => ""
      t.integer  :job_length
      t.integer  :service_job_satisfaction
      t.integer  :initial_job_satisfaction
      t.integer  :previous_dissatisfaction
      t.text     :dissatisfaction_source , :default => ["None"]
      t.string   :other_dissatisfaction_source
      t.string   :event_time, :default => ""
      t.string   :content, :default => ""
      t.timestamps
    end
  end
end
