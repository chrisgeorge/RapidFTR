Feature: Request Password Reset

  Scenario: Allow user to request a reset of his/her password
  
    Given a user "jdoe" with a password "123"
    And I am on the login page
    And I follow "Reset Password"
    Then I am on the request password reset page
    
    When I fill in "jdoe" for "user name"
    And I press "Request Password Reset"
    Then I should see "Thank you"
  
