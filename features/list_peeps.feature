Feature: List peeps
  Upon visiting the home page
  The user should see all peeps regardless of whether they have signed in or not

  Scenario Outline: when peeps have been peeped
    Given there are peeps that have "<text>" written by "<first_name>", "<last_name>" with the username "<username>"
    When a visitor visits the home page
    Then all "<text>" should be displayed
    And the "<first_name>" should be displayed
    And the "<last_name>" should be displayed
    And the "<username>" should be displayed next to the name

    Examples: 
      | first_name | last_name | username   | post        |
      | Enrique    | Ecomba    | ecomba     | my students are wonderful |
      | Margo      | Urey      | margOnline | ipsem lorem |
