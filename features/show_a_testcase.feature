Feature: Show a Testcase

  Scenario: Somebody inspects a Testcase with several Steps
    Given a testcase: "t1" exists with title: "My first Testcase"
    And the following teststeps exist
    | description | testcase |
    | First Step  | testcase: "t1" |
    | Second Step | testcase: "t1" |
    And I am on the testcases page
    When I follow "My first Testcase"
    Then I should be on "testcases/1"
    And I should see "My first Testcase"
    And I should see "First Step"
    And I should see "Second Step"
