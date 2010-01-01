Feature: Run a Testcase

  Scenario: Somebody goes to the run page from the testcase page
    Given a testcase: "t1" exists with title: "My first Testcase"
    And the following teststeps exist
    | description | testcase       |
    | First Step  | testcase: "t1" |
    | Second Step | testcase: "t1" |
    And I am on the "testcases/1" page
    When I follow "Run"
    Then I should be on "testcase_results/new"

  Scenario: Run a testcase
    Given a testcase: "t1" exists with title: "My first Testcase"
    And the following teststeps exist
    | description | testcase       |
    | First Step  | testcase: "t1" |
    | Second Step | testcase: "t1" |
    And I am on the "testcase_results/new?testcase_id=1" page
    When I press "Create"
    Then a testcase_result should exist
    And 2 teststep_results should exist
