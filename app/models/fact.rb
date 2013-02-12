class Fact < ActiveRecord::Base
  attr_accessible :name

  has_many :relationSource, :class_name => "Relation", :foreign_key => "sourceFact_id"
  has_many :relationTarget, :class_name => "Relation", :foreign_key => "targetFact_id"

  validates :name, :presence => true
end
