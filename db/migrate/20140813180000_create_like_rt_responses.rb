class CreateLikeRtResponses < ActiveRecord::Migration
  def change
    create_table :like_rt_responses do |t|
      t.integer  :user_id
      t.string  :conflicted_community, :default => "None"
      t.string  :helping_people, :default => "None"
      t.string  :technical_soln_impact, :default => "None"
      t.string  :service_not_part, :default => "None"
      t.string  :less_money_for_society, :default => "None"
      t.string  :unconnected, :default => "None"
      t.string  :incorporate_societal, :default => "None"
      t.string  :call_by_society, :default => "None"
      t.string  :pro_brono_work, :default => "None"
      t.string  :serve_others, :default => "None"
      t.string  :positive_volunteering, :default => "None"
      t.string  :extra_time, :default => "None"
      t.timestamps
    end
  end
end
