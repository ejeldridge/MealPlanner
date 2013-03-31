require 'test_helper'

class FavoriteRecentRecipesListCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
