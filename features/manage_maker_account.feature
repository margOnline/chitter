@sign_in_out

Feature: Maker signs in

  Scenario: with correct credentials
    Given The visitor signs in with the email "margo@margonline.co.uk" and the password "secret!"
    When He clicks the button "Sign in"
    Then He will see "Welcome, margo@margonline.co.uk"
    And He will see "Enter a Peep!"

  Scenario: with incorrect credentials
    Given the user signs in with the email "margo@margonline.co.uk" and the password "secret"
    When He clicks the button "Sign in"
    Then He will not see the message "Welcome, margo@margonline.co.uk"
    And He will see "The email or password are incorrect"

Feature: Maker signs out

  Scenario: while signed in
    Given The visitor is signed in with the email "margo@margonline.co.uk" and password "secret!"
    When He clicks the button "Sign out"
    Then He should see "Good bye!"
    And The page should not display "Welcome, margo@margonline.co.uk"

Feature: Maker signs up
 
  Scenario: Sign up with valid data
    Given Visitor is on the sign up page
    When He fills in "Enter a Peep!"
      | first_name            | Margo                  |
      | last_name             | Urey                   |
      | username              | margOnline             |
      | email                 | margo@margonline.co.uk |
      | password              | secret!                |

    And Clicks the "Sign up" button 
    Then He should see "Enter a Peep!"

  Scenario: Sign up with duplicate email
    Given Visitor is on the sign up page
    When He fills in
      | first_name            | Margo                  |
      | last_name             | Urey                   |
      | username              | margOnline             |
      | email                 | margo@margonline.co.uk |
      | password              | secret!                |
    And Clicks the "Sign up" button
    And He is on the sign up page
    And Fills in
      | first_name            | Margo                  |
      | last_name             | Urey                   |
      | username              | margOnline             |
      | email                 | margo@margonline.co.uk |
      | password              | secret!                |
    And Clicks the "Sign up" button
    Then He should see "This email address has already been registered"

  Scenario: Sign up with duplicate username
    Given Visitor is on the sign up page
    When He fills in
      | first_name            | Margo                  |
      | last_name             | Urey                   |
      | username              | margOnline             |
      | email                 | margo@margonline.co.uk |
      | password              | secret!                |
    And Clicks the "Sign up" button
    And He is on the sign up page
    And Fills in
      | first_name            | Margo                  |
      | last_name             | Urey                   |
      | username              | margOnline             |
      | email                 | margo@margonline.co.uk |
      | password              | secret!                |
    And Clicks the "Sign up" button
    Then He should see "This username is taken, please choose another one"

  