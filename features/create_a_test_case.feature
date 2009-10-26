Feature: Define a Testcase

  Scenario: Somebody defines a Testcase with a Step
    Given I am on the new testcase page
    When I fill in "Title" with "My first Testcase"
    And I fill in "steps[step_attributes][][description]" with "First Step"
    And I press "Create"
    Then I should be on "testcases"
