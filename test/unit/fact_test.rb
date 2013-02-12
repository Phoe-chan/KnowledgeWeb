require 'test_helper'

class FactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "factsRequireNames" do
    f1 = Fact.new
    assert !f1.save
    f1.name = "testName"
    assert f1.save
  end
end
