require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  test "resolve_event_type return values" do
    assert_equal "Breakfast", Schedule.resolve_event_type(1)
    assert_equal "Lunch", Schedule.resolve_event_type(2)
    assert_equal "Dinner", Schedule.resolve_event_type(3)
  end

  test "resolve_event_type bad value" do
    assert_equal nil, Schedule.resolve_event_type(0)
  end
end
