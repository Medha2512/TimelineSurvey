class CreateEdExpClassifications < ActiveRecord::Migration
  def change
    create_table :ed_exp_classifications do |t|
      t.integer  :user_id
      t.string   :service
      t.integer  :no_of_engg_service
      t.text     :service_exp
      t.string   :participate_as
      t.string   :travel
      t.string   :travel_type
      t.string   :travel_term
      t.string   :formal_leadership
      t.string   :service_period
      t.string   :engg_beneficial_experience
      t.string   :non_engg_service
      t.text     :non_engg_ser_exp
      t.string   :nonengg_beneficial_experience
      t.timestamps
    end
  end
end
