class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :recipe_name, :steps
  belongs_to :schedule
end
