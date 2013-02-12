require 'test_helper'

class RelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "relationsRequireRelationships" do
    f1 = Fact.new
    f1.name = "bob"
    r1 = Relation.new
    r1.sourceFact = f1
    r1.targetFact = f1
    assert !r1.save
    r1.relationship = "itself"
    assert r1.save
  end
end
