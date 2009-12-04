Feature: Show a Testcase

  Scenario: Somebody inspects a Testcase with several Steps
    Given a testcase exists with title: "My first Testcase"
    And I am on the testcases page
    When I follow "My first Testcase"
    Then I should be on "testcases/1"
    And I should see "My first Testcase"
    #And I should see "First Step"
    #And I should see "Second Step"
