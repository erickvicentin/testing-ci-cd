Feature: Google Search

  Scenario: Search for a term on Google
    Given I am on the Millanel Resistencia page
    When I search for "Perfume arabe"
    Then I found the item searched
