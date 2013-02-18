require 'test_helper'

class RelationTest < ActiveSupport::TestCase
  test "relationsRequireRelationships" do
    f1 = Fact.new
    f1.name = "bob"
    r1 = Relation.new
    r1.sourceFact = f1
    r1.targetFact = f1
    c1 = Character.new(:name => "Bob")
    r1.owner = c1
    assert !r1.save
  end

  test "relationsRequireOwners" do
    f1 = Fact.new
    f1.name = "bob"
    r1 = Relation.new
    r1.sourceFact = f1
    r1.targetFact = f1
    r1.relationship = "itself"
    assert !r1.save
  end

  test "relationsRequireFacts" do
    f1 = Fact.new
    f1.name = "bob"
    r1 = Relation.new
    r1.relationship = "itself"
    c1 = Character.new(:name => "Bob")
    r1.owner = c1
    r1.sourceFact = f1
    assert !r1.save
    r1.sourceFact = nil
    r1.targetFact = f1
    assert !r1.save
  end

  test "relationsSaveWithAllInformation" do
    f1 = Fact.new
    f1.name = "bob"
    r1 = Relation.new
    r1.sourceFact = f1
    r1.targetFact = f1
    r1.relationship = "itself"
    c1 = Character.new(:name => "Bob")
    r1.owner = c1
    assert r1.save
  end
end
