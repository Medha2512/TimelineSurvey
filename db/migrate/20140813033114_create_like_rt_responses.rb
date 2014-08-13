class CreateLikeRtResponses < ActiveRecord::Migration
  def change
    create_table :like_rt_responses do |t|
      t.integer  :user_id
      t.string   :question1
      t.string   :question2
      t.string   :question3
      t.string   :question4
      t.string   :question5
      t.string   :question6
      t.string   :question7
      t.string   :question8
      t.string   :question9
      t.string   :question10
      t.string   :question11
      t.string   :question12
      t.timestamps
    end
  end
end
