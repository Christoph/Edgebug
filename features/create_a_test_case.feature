Feature: Define a Testcase

  Scenario: Somebody defines a Testcase with a Step
    Given I am on the new testcase page
    When I fill in "Title" with "My first Testcase"
    And I fill in "Description" with "First Step"
    And I press "Create"
    Then I should be on "testcases"
    And I should see "My first Testcase"

  Scenario: Somebody defines a Testcase with several Steps
    Given I am on the new testcase page
    When I fill in "Title" with "My second Testcase"
    And I fill in "Description" with "First Step"
    And I follow "Add a step"
    And I fill in "Description" with "Second Step"
    And I press "Create"
    Then I should be on "testcases"
