require 'test_helper'

class RecipeToolboxCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
