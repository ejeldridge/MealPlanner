require 'test_helper'

class SchedulingCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
