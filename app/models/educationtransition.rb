class Educationtransition < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :new_education_field, :scope => [:event_time, :user_id]
  serialize :dissatisfaction_source
end
