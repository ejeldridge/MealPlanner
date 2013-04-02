Feature: User can create an account
  As a new user of the meal planner
  I should be able to create a new account
  and then use the account to log in again.

  Scenario: Submit blank User Account
    Given I am on the home page
    When I follow "Create Account"
    Then I should be on the user_accounts page
    When I press "submit"
    Then I should be on the user_accounts page
    And I should see "First Name blank!"
    And I should see "Last Name blank!"
    And I should see "Email addresses blank!"
    And I should see "Passwords empty!"

  Scenario: Submit User Account with bad confirm email
    Given I am on the home page
    When I follow "Create Account"
    Then I should be on the user_accounts page
    When I fill in "user_account_first_name" with "Test"
    And I fill in "user_account_last_name" with "User"
    And I fill in "user_account_user_name" with "test"
    And I fill in "user_account_email" with "test@email.com"
    And I fill in "user_account_confirm_email" with "test@nope.com"
    And I fill in "user_account_password" with "password"
    And I fill in "user_account_confirm_password" with "password"
    And I press "submit"
    Then I should be on the user_accounts page
    And I should see "Email addresses did not match!"

  Scenario: Submit User Account with bad confirm password
    Given I am on the home page
    When I follow "Create Account"
    Then I should be on the user_accounts page
    When I fill in "user_account_first_name" with "Test"
    And I fill in "user_account_last_name" with "User"
    And I fill in "user_account_user_name" with "test"
    And I fill in "user_account_email" with "test@email.com"
    And I fill in "user_account_confirm_email" with "test@email.com"
    And I fill in "user_account_password" with "password"
    And I fill in "user_account_confirm_password" with "drowssap"
    And I press "submit"
    Then I should be on the user_accounts page
    And I should see "Passwords did not match!"

  Scenario: Submit User Account with valid data
    Given I am on the home page
    When I follow "Create Account"
    Then I should be on the user_accounts page
    When I fill in "user_account_first_name" with "Test"
    And I fill in "user_account_last_name" with "User"
    And I fill in "user_account_user_name" with "test"
    And I fill in "user_account_email" with "test@email.com"
    And I fill in "user_account_confirm_email" with "test@email.com"
    And I fill in "user_account_password" with "password"
    And I fill in "user_account_confirm_password" with "password"
    And I press "submit"
    Then I should be on the home page
    And I should see "User 'test' created."

  Scenario: Log in with existing user then log out
    Given I am on the home page
    When I fill in "user_name" with "static"
    And I fill in "password" with "password"
    And I press "Sign in"
    Then I should be on the home page
    And I should see "Welcome back Test"
    And I should see "Logout"
    When I follow "Logout"
    Then I should be on the home page
    And I should see "You have logged out."
    And I should not see "Logout"



