class Educationtransition < ActiveRecord::Base
  belongs_to :user
  serialize :dissatisfaction_source
end
