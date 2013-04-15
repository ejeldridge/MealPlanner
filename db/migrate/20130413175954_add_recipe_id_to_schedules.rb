class AddRecipeIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :recipe_id, :integer
  end
end
