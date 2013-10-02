@sign_in_out

Feature: List Peeps
  Upon visiting the home page
  The visitor should see all peeps regardless of whether they have signed in or not

  Scenario: New User to site
    Given The visitor visits the home page
    Then He will see a list of peeps
    And He will see "Sign in"
    And He will see "Sign up"

  Scenario: Maker enters a peep
    Given The maker is signed in
    When He clicks the button "Add peep"
    Then He will his peep "Welcome, margo@margonline.co.uk"
    And He will see the time of his peep
    And He will see his username
    And He will see his first name and last name

  Scenario: Maker enters another peep
    Given The maker is signed in
    When He clicks the button "Add peep"
    Then He will see the second peep listed before the first peep



  Scenario Outline: when peeps have been peeped
    Given there are peeps that have "<post>" written by "<first_name>", "<last_name>" with the username "<username>"
    When a visitor visits the home page
    Then all "<post>" should be displayed
    And the "<first_name>" should be displayed
    And the "<last_name>" should be displayed
    And the "<username>" should be displayed next to the name

    Examples: 
      | first_name | last_name | username   | post        |
      | Enrique    | Ecomba    | ecomba     | my students are wonderful |
      | Margo      | Urey      | margOnline | ipsem lorem |
