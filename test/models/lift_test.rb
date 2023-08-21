require "test_helper"

class LiftTest < ActiveSupport::TestCase
  test "should not add new lift without weight" do
    lift = Lift.new
    assert_not lift.save
  end
end
