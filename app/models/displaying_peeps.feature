Feature: Display all peeps
  When a visitor visits the home page
  The visitor should see all peeps

  Scenario: Visitor visits the home page
    Given: signed in users have created peeps
    When: any visitor visits the home page
    Then: the visitor will see some peeps