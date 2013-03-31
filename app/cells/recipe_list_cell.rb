class RecipeListCell < Cell::Rails

  def display
    @recipes = Recipe.all

    render
  end

end
