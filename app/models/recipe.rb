class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :recipe_name, :steps
  has_many :schedules, :dependent => :destroy
end
