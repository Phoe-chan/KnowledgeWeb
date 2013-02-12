class Relation < ActiveRecord::Base
  attr_accessible :relationship

  belongs_to :sourceFact, :class_name => "Fact", :foreign_key => "targetFact_id"
  belongs_to :targetFact, :class_name => "Fact", :foreign_key => "sourceFact_id"

  validates :relationship, :presence => true
  validates :sourceFact, :targetFact, :presence => true
end
