class CreateEdExpClassifications < ActiveRecord::Migration
  def change
    create_table :ed_exp_classifications do |t|
      t.integer :user_id
      t.string  :service_as_student, :default => ""
      t.integer :no_of_engg_service
      t.text    :engg_service_exp, :default => ["None"]
      t.string  :other_service_exp
      t.string  :participate_as, :default => ""
      t.string  :travel, :default => ""
      t.string  :travel_type, :default => ""
      t.string  :travel_term, :default => ""
      t.string  :formal_leadership, :default => ""
      t.string  :engg_service_length, :default => ""
      t.string  :engg_service_beneficial, :default => ""
      t.string  :nonengg_service_as_student, :default => ""
      t.text    :nonengg_service_exp, :default => ["None"]
      t.string  :other_non_engg_services
      t.string  :nonengg_service_beneficial, :default => ""
      t.timestamps
    end
  end
end
