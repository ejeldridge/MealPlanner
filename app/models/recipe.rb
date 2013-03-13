class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :recipe_name, :steps
end
