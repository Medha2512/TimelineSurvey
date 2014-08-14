class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.integer  :user_id
      t.string :gender , :default => "None"
      t.string :race, :default =>  "None"
      t.string :religious, :default =>  "None"
      t.string :religious_active, :default =>  "None"
      t.timestamps
    end
  end
end
