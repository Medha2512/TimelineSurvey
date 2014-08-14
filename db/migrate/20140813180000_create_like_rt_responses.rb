class CreateLikeRtResponses < ActiveRecord::Migration
  def change
    create_table :like_rt_responses do |t|
      t.integer  :user_id
      t.string  :conflicted_community, :default => ""
      t.string  :helping_people, :default => ""
      t.string  :technical_soln_impact, :default => ""
      t.string  :service_not_part, :default => ""
      t.string  :less_money_for_society, :default => ""
      t.string  :unconnected, :default => ""
      t.string  :incorporate_societal, :default => ""
      t.string  :call_by_society, :default => ""
      t.string  :pro_brono_work, :default => ""
      t.string  :serve_others, :default => ""
      t.string  :positive_volunteering, :default => ""
      t.string  :extra_time, :default => ""
      t.timestamps
    end
  end
end
