class Character < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id", :inverse_of => :characters
  has_many :relations, :class_name => "Relation", :foreign_key => "character_id", :inverse_of => :owner

  attr_accessible :name, :user
  validates :name, :user, :presence => true
end
