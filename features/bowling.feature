Feature: bowling game
  Scenario: bowl a frame
    When I bowl a 4 with the first roll
    And I bowl a 5 with the second roll
    Then the total for the frame is 9


  Scenario: bowl a strike
    When I bowl a strike
    And bowl a 5 and 3 in the next frame
    Then the total for the frame is 18

  Scenario: bowl a spare
    When I bowl a spare
    And I bowl a 6 in the next roll
    Then the total for the frame is 16



  Scenario: I bowl a 300 game
    When I bowl 12 strikes
    Then I will have a final score of 300

  Scenario:  I bowl a 299 game
    When I bowl 11 strikes
    And the 12th roll equals 9
    Then I will have a final score of 299

  Scenario: I bowl a 0 game
    When I bowl a 0 in every frame
    Then I will have a final score of 0

  Scenario: I bowl a 22 game
    When I bowl a 3 with the first roll
    And I bowl a 7 with the second roll
    And I bowl a 6 with the next roll
    And I bowl 0 for the next 17 rolls
    Then I will have a final score of 22
