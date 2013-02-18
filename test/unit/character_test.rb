require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  test "charactersRequireOwners" do
    c1 = Character.new(:name => "Bjorn")
    assert !c1.save
  end

  test "charactersRequireNames" do
    c1 = Character.new
    c1.user = User.first
    assert !c1.save
  end

  test "charactersSaveWithAllDetails" do
    c1 = Character.new(:name => "Bjorn")
    c1.user = User.first
    assert c1.save
  end

  test "charactersCanLearn" do
    c1 = Character.new(:name => "Bjorn", :user => User.first)
    assert (c1.relations.count == 0)
    r1 = Relation.new
    r1.relationship = "stole"
    r1.sourceFact = Fact.new(:name => "Lupin")
    r1.targetFact = Fact.new(:name => "Diamond")
    c1.relations.push(r1)
    assert c1.save
    assert (c1.relations.count == 1)
  end

  test "charactersCanForget" do
    c1 = Character.new(:name => "Bjorn", :user => User.first)
    r1 = Relation.new
    r1.relationship = "stole"
    r1.sourceFact = Fact.new(:name => "Lupin")
    r1.targetFact = Fact.new(:name => "Diamond")
    c1.relations.push(r1)
    r2 = Relation.new
    r2.relationship = "caught"
    r2.sourceFact = Fact.new(:name => "Zenigata")
    r2.targetFact = Fact.new(:name => "Lupin")
    c1.relations.push(r2)
    assert c1.save, "Failed to save test character."
    assert (c1.relations.count == 2), "Couldn't set up two relations."
    c1.relations.delete(r2)
    assert (c1.relations.count == 1), "Didn't remove a relation."
    assert (c1.relations.first.relationship == "stole"), "Removed the wrong relation."
  end

end
