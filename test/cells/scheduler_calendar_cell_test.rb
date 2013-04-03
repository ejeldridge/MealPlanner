require 'test_helper'

class SchedulerCalendarCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
