Feature: Manage schedules
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Register new schedule
    Given I am on selected recipe page
    And I press "The date on the scheduler module"
    And I select "Breakfast"
    Then I press "Add recipe to this date"
    Then I should see "Date Breakfast: Recipe"


  Scenario: Delete schedule
    Given the following schedules:
    Given "Scrambled eggs and bacon" is scheduled for breakfast
    And "Peanut butter and jelly sandwich" is scheduled for lunch
    And "Steak and potatoes" is scheduled for dinner
    When I delete the dinner schedule
    Then I should see "Breakfast: Scrambled eggs and bacon"
    And I should see "Lunch: Peanut butter and jelly sandwich"
    And I should not see "Dinner: Steak and potatoes"

    #Scheduled for iteration 4
Scenario: Up-coming meals
  Given I am on the home page
  And I have "Scrambled eggs and bacon" in recipe database
  And "Scrambled eggs and bacon" is scheduled for breakfast today
  Then I should see "Scrambled eggs and bacon" in the up-coming meals view






