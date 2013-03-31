class FavoriteRecentRecipesListCell < Cell::Rails

  def display
    @recipes = Recipe.all

    render
  end

end
