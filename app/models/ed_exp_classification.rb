class EdExpClassification < ActiveRecord::Base
  serialize :engg_service_exp
  serialize :nonengg_service_exp
  belongs_to :user
end
