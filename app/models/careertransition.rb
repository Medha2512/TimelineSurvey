class Careertransition < ActiveRecord::Base
  belongs_to :user  
  validates_uniqueness_of :new_career_field, :scope => [:event_time, :user_id]
  serialize :dissatisfaction_source
end
