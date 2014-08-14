class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.integer  :user_id
      t.string :gender , :default => ""
      t.string :race, :default =>  ""
      t.string :religious, :default =>  ""
      t.string :religious_active, :default =>  ""
      t.timestamps
    end
  end
end
