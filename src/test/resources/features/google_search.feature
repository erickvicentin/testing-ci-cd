Feature: Google Search

  Scenario: Search for a term on Google
    Given I am on the Google search page
    When I search for "Selenium"
    Then the title of the page should start with "Selenium"
