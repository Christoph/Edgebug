Feature: Define a Testcase

  Scenario: Somebody defines a Testcase with a Step
    Given I am on testcases/new
    When I fill in "Title" with "My first Testcase"
    And I fill in "Description" with "First Step"
    And I press "Create"
    Then I should be on /testcases
    And I should see "My first Testcase"
    And a testcase should exist
    And a teststep should exist

  Scenario: Somebody defines a Testcase with several Steps
    Given I am on testcases/new
    When I fill in "Title" with "My second Testcase"
    And I fill in "Description" with "First Step"
    And I follow "Add a step"
    And I fill in "Description" with "Second Step"
    And I press "Create"
    Then I should be on /testcases
    And I should see "My second Testcase"
    And a testcase should exist with title: "My second Testcase"
    And 1 teststeps should exist 
