Feature: Define a Testcase

  Scenario: Somebody defines a Testcase without steps
    Given I am on the new testcase page
    When I fill in "Title" with "My first Testcase"
    And I press "Create"
    Then I should be on "testcases"
