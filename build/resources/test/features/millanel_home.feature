Feature: Millanel Home Page

  Scenario: Open a Millanel Web Page & search product
    Given I am on the Millanel Resistencia page
    When I search for "Perfume arabe"
    Then I found the item searched
