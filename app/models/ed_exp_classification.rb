class EdExpClassification < ActiveRecord::Base
  serialize :service_exp
  serialize :non_engg_ser_exp
  belongs_to :user
end
