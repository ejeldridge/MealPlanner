class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :ingredients
      t.text :steps
      t.string :recipe_name

      t.timestamps
    end
  end
end
