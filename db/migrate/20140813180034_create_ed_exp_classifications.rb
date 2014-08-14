class CreateEdExpClassifications < ActiveRecord::Migration
  def change
    create_table :ed_exp_classifications do |t|
      t.integer :user_id
      t.string  :service_as_student, :default => "None"
      t.integer :no_of_engg_service, :default => 0
      t.text    :engg_service_exp, :default => ["None"]
      t.string  :other_service_exp
      t.string  :participate_as, :default => "None"
      t.string  :travel, :default => "None"
      t.string  :travel_type, :default => "None"
      t.string  :travel_term, :default => "None"
      t.string  :formal_leadership, :default => "None"
      t.string  :engg_service_length, :default => "None"
      t.string  :engg_service_beneficial, :default => "None"
      t.string  :nonengg_service_as_student, :default => "None"
      t.text    :nonengg_service_exp, :default => ["None"]
      t.string  :other_non_engg_services
      t.string  :nonengg_service_beneficial, :default => "None"
      t.timestamps
    end
  end
end
