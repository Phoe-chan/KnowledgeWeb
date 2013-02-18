class Relation < ActiveRecord::Base
  attr_accessible :relationship, :sourceFact, :targetFact

  belongs_to :sourceFact, :class_name => "Fact", :foreign_key => "targetFact_id"
  belongs_to :targetFact, :class_name => "Fact", :foreign_key => "sourceFact_id"
  belongs_to :owner, :class_name => "Character", :foreign_key => "character_id", :inverse_of => :relations

  validates :relationship, :presence => true
  validates :sourceFact, :targetFact, :owner, :presence => true
end
