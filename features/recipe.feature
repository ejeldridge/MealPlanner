Feature: Manage Recipes
  As a recipe database user
  I should be able to create, update, delete, and show recipes

  Scenario: Add a recipe
    Given I am on the home page
    When I press "Add New Recipe"
    Then I should be on the Create a new recipe page
    When I fill in "Recipe name" with "Chocolate Cake"
    And I fill in "Ingredients" with "Any number of ingredients here"
    And I fill in "Steps" with "Number of steps for cooking"
    And I press "submit"
    Then I should be on the home page
    And I should see "Chocolate Cake"

  Scenario: Delete recipe
    Given I have "Chocolate Cake" in recipe database
    And I am on the home page
    When I delete recipe with title "Chocolate Cake"
    Then I should be on the home page
    And I should not see "Chocolate Cake"

  Scenario: Edit a recipe
    Given I have "Chocolate Cake" in recipe database
    Given I am on the home page
    When I edit recipe with recipe name "Chocolate Cake"
    Then I should be on the Edit the recipe page
    When I fill in "Recipe Name" with "German Chocolate Cake"
    And I fill in "Ingredients" with "Ingredients for recipe"
    And I fill in "Steps" with "Number of cooking steps"
    And I press "submit"
    Then I should be on the home page
    And I should see "German Chocolate Cake"
    And I should not see "Chocolate Cake"

  Scenario: View a recipe
    Given I am on the home page
    When I follow "Chocolate Cake"
    Then I should be on the Recipe Detail page
    And I should see "Recipe Name: Chocolate Cake"
    And I should see "Ingredients: ingredients for recipe"
    And I should see "Steps: cooking steps for recipe"

#Scheduled for Iteration 4

  Scenario: Search a recipe
    Given I have "Chocolate Cake" in recipe database
    And I am on the home page
    When I fill in search with "Chocolate Cake"
    And I press "Submit"
    Then I should see "Chocolate Cake"

 Scenario: Display most eaten and favorite recipes
   Given I am on the home page
   Given I have "Chocolate Cake" in recipe database
   And I have "Macaroni and Cheese" in recipe database
   And I have "Macaroni and Cheese" selected as favorite
   Then I should see "Macaroni and Cheese" first in favorite recipe view
   And I should see "Chocolate Cake" second in favorite recipe view
